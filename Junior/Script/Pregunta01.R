# Lectura de datos --------------------------------------------------------
library(tidyverse)

nombres_CA <- read_csv('Data/nombres_CA.txt')
nombres_TX <- read_csv('Data/nombres_TX.TXT')

data <- rbind(nombres_CA,nombres_TX)

contrybb <- function(df,año){
  n <- subset(df , year == año)
  p <- n[,c('year','Name','Num')]
  return(p)
  }

# Opcional con tidyverse : 
# rbind(nombres_CA,nombres_TX) %>% 
#   group_by(year,Name) %>% 
#   summarise(Tniños = sum(Num)) -> pregunta01-


