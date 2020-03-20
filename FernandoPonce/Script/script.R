# Insumos: ----------------------------------------------------------------
library(sf)        # Lectura de datos vectoriales
library(tmap)      # Creación de mapas temáticos
library(cptcity)   # Paleta de colores variados
library(tidyverse) # Ciencia de datos 


# Primer caso con tm_polygons() -------------------------------------------

read_sf('Data/Indice_Vulnerabilidad.shp') %>% 
  tm_shape() +
  tm_polygons(col = 'vul',
              lwd = 0.2) + 
  tm_layout(frame = FALSE,
            legend.format = list(text.separator = '-'),
            legend.position = c(-0.3,0))


# Segundo caso con tm_fill ------------------------------------------------

read_sf('Data/Indice_Vulnerabilidad.shp') %>% 
  tm_shape() +
  tm_fill(col = 'vul',
          style = 'quantile',
          palette = cpt(pal = 'mpl_plasma'), 
          lwd = 0.2) + 
  tm_layout(frame = FALSE,
            legend.format = list(text.separator = '-'),
            legend.position = c(-0.3,0))

# Exportar el plot  -------------------------------------------------------

tmap_save(tm = last_map(),
          filename = 'Plot/mapa.png',
          width = 5,
          height = 4)





