# Lectura de datos --------------------------------------------------------

nombres_CA <- read.table('Data/nombres_CA.txt', sep = ',',header = T)
nombres_TX <- read.table('Data/nombres_TX.TXT', sep = ',',header = T)

data <- rbind(nombres_CA,nombres_TX)

modacity <- function(df){
  m <- data.frame(table(df[,'Name']))
  colnames(m) <- c('City', 'Moda')
  p <- head(m[order(m[,'Moda'],decreasing = T),],3)
  rownames(p) <- NULL
  return(p)
}

# Con tidyverse:

rbind(nombres_CA,nombres_TX) %>% 
  as_tibble() %>% 
  mutate_if(is.character, as.factor) %>%
  group_by(Name) %>%
  count(Name) %>% 
  arrange(desc(n)) %>% 
  head(3)
  










