# Lectura de datos --------------------------------------------------------

nombres_CA <- read.table('Data/nombres_CA.txt', sep = ',',header = T)
nombres_TX <- read.table('Data/nombres_TX.TXT', sep = ',',header = T)

data <- rbind(nombres_CA,nombres_TX)

contrybb <- function(df, year_min, year_max){
  n <- subset(df , year_min <= year & year <=year_max || Sex == 'F')
  p <- n[,c('year','Name','Sex','Num')]
  rownames(p) <- NULL
  return(p)
}

contrybb(df = data,year_min = 2000,year_max = 2001)

# Opcional con tidyverse : 
library(tidyverse)

rbind(nombres_CA,nombres_TX) %>%
  filter(year <=2001 & year >=2000) %>%
  group_by(year,Sex,Name) %>%
  summarise(Tniños = sum(Num)) -> pregunta02





