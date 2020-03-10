library(tidyverse)
library(ggpmisc)

# Reading to data ---------------------------------------------------------
data <- read_csv('Data/VOLUMEN VS COTA.csv')
my.formula <-  data$COTA ~ poly(data$VOLUMEN,3)

data %>% 
ggplot(aes(x = VOLUMEN,y = COTA)) + 
  geom_line(col = 'blue') + 
  scale_y_continuous(breaks = seq(4677.9, 4679.6, length.out = 8)) +
  scale_x_continuous(breaks = seq(0.054, 2332.591, length.out = 8))+
  geom_point(shape = 15) + 
  stat_poly_eq(aes(label = ..eq.label..), formula = my.formula, 
               parse = TRUE) +
  theme_bw() + 
  xlab(label = 'VOLUMEN(m3)') + 
  ylab(label = 'COTA (m)') + 
  ggtitle(label = 'CURVA COLUMEN VS COTA') +
  theme(plot.title = element_text(hjust = 0.5)) -> g1

last_plot()

# Export to graphic -------------------------------------------------------

ggplot2::ggsave(filename = 'Plot/Hidro.png',
                plot = g1,
                width = 10,
                height = 4)



