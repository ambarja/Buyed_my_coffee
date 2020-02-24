library(tidyverse)

# Lectura de datos  -------------------------------------------------------

read_csv('Data/estacion.csv') %>% 
  separate(col = FECHA,into = c('día','mes','año'),sep = '/') %>%
  group_by(mes, año) %>% 
  summarise(Pp = sum(VALOR)) -> newdata

write.csv(newdata,'Resultado/Newtable.csv')

