# Lectura de datos --------------------------------------------------------
nombres_CA <- read.table('Data/nombres_CA.txt', sep = ',')
nombres_TX <- read.table('Data/nombres_TX.TXT', sep = ',')

data <- rbind(nombres_CA,nombres_TX)

contrybb <- function(year_min, year_max){
  n <- subset(df , year == año & sex == F)
  p <- n[,c('year','Name','Num')]
  return(p)
}

# Opcional con tidyverse : 
# rbind(nombres_CA,nombres_TX) %>% 
#   group_by(year,Name) %>% 
#   summarise(Tniños = sum(Num)) -> pregunta01


