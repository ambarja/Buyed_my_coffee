library(leaflet)
library(leaflet.extras)
library(leaflegend)
library(sf)
library(tidyverse)
library(cptcity)

readxl::read_xlsx("SE_48.2021. DIRECCIONES.xlsx") %>% 
  st_as_sf(coords = c("Lon","Lat"),crs=4326) -> dots

web_map <- dots %>%
  leaflet() %>% 
  addTiles() %>% 
  addHeatmap(radius = 10) %>% 
  addMiniMap() %>% 
  addLegendNumeric(
    pal = colorNumeric(
      palette = cpt("grass_bcyr"),domain = c(0,1)),
    values =  c(0,1),
    title = 'Casos',
    orientation = 'horizontal',
    width = 100,
    height = 20,
    position = 'bottomright') 

# legenda <- div(
#   style = 'style="width: 100%; height: 1rem; position: relative;"', 
#   id = "first",
#   div(style = 'style="position:absolute; left:0px; top: 0px;"',"Min"),
#   div(style = 'style="position:absolute; left:0px; top: 0px;"',"Max"),
# )

