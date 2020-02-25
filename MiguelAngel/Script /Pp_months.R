library(tidyverse)

# Lectura de datos  -------------------------------------------------------

read_csv('Data/estacion.csv') %>% 
  separate(col = FECHA, into = c('día','mes','año'), sep = '/')%>%
  mutate(mes = as.factor((as.numeric(mes)))) %>% 
  group_by(año, mes) %>% 
  summarise(Pp = sum(VALOR)) %>% 
  spread(mes,Pp) -> newdata

colnames(newdata) <- c('años', month.name)
 
write.csv(newdata, 'Resultado/Newtable.csv')

