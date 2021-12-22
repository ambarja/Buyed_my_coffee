library(rgee)
library(tidyverse)
library(sf)
ee_Initialize()

lima_prov <- st_read(
  "https://github.com/ambarja/gpkg-pe/raw/main/Lima_distritos.gpkg"
) %>%
  select(NOMBDIST) %>%
  head()

lulc <- ee$Image("COPERNICUS/Landcover/100m/Proba-V-C3/Global/2019")$
  select("discrete_classification")

ee_area_lulc <- function(img, region, scale = 1000) {
  lista_histo <- list()
  for (i in 1:nrow(region)) {
    region_ee <- region[i, ] %>% sf_as_ee()
    ee_histo <- img$reduceRegion(
      reducer = ee$Reducer$frequencyHistogram(),
      geometry = region_ee,
      scale = scale
    )
    lista_histo[[i]] <- ee_histo$getInfo() %>%
      map_df(., .f = as.data.frame) %>%
      mutate(DISTRITO = region[[i, 1]] %>% as.vector())
  }
  histo_df <- map_df(lista_histo, .f = as.data.frame) %>%
    mutate_if(is.numeric, .funs = function(x) {
      x * 1000 * 1000 / 10000
    }) %>%
    replace(is.na(.), 0) %>%
    rename_with(~ paste0("Pi", sub("X", "", .), "_Ha"), -DISTRITO) %>%
    select(DISTRITO, ends_with("Ha")) %>%
    gather(Category, values, Pi20_Ha:Pi200_Ha)
  return(histo_df)
}

area_Ha <- ee_area_lulc(img = lulc, region = lima_prov)

ee_plot <- function(x) {
  p1 <- x %>%
    ggplot(aes(x = Category, y = values, fill = Category)) +
    geom_bar(stat = "identity") +
    scale_fill_viridis_d() +
    facet_wrap(~DISTRITO, scales = "free")
  return(p1)
}

ee_plot(area_Ha)
