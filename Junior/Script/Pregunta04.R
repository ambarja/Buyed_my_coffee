# Lectura de datos --------------------------------------------------------
nombres_CA <- read.table('Data/nombres_CA.txt', sep = ',',header = T)
nombres_TX <- read.table('Data/nombres_TX.TXT', sep = ',',header = T)

data <- rbind(nombres_CA,nombres_TX)

moda_deca <- function(df){
  m <- seq(from = 1910,to = 2018,by = 10)
  for(i in m){
  n <- subset(df, year == i)
  p <- data.frame(table(unique(n[,'Name'])))
  q <- head(p[order(p[,'Freq'],decreasing = T),],3)
  r <- as.vector(q[2,1])
 print(r) 
 }
}

moda_deca(data)

# Con tidyverse: 
rbind(nombres_CA,nombres_TX) %>% 
  as_tibble() %>% 
  mutate_if(is.character, as.factor) %>%
  filter(year == c(seq(from = 1910, to = 2018, by = 10))) %>%
  group_by(Name) %>%
  count(Name) %>% 
  arrange(desc(n))







