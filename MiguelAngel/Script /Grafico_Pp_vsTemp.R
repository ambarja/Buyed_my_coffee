library(tidyverse)
library(ggplot2)
library(forcats)

# Lectura de datos --------------------------------------------------------
read_csv('Data/YACAR.csv')%>%
  mutate_if(is.character,
            as.factor) %>% 
  ggplot(aes(x = id)) + 
  geom_line(aes(y = Temp, colour = "Temperatura")) +
  scale_x_continuous(breaks = seq(1,12,by = 1),
                     labels = c(month.abb[9:12],month.abb[1:8])) +
  geom_line(aes(y = Pp, colour = "Precipitación")) +
  scale_colour_manual(values = c("blue", "red")) + 
  scale_y_continuous(breaks = seq(0,150,10),
                     sec.axis = sec_axis(~.*1,name = "Precipitación (mm)")) + 
  labs(y = "Temperatura (°C)",
       colour = 'Parametros') +
  theme_bw() + 
  theme(legend.position = c(0.8, 0.9)) -> g01


# Exportar plot -----------------------------------------------------------

ggsave(filename = 'PLot/g01.png',
       plot = last_plot(),
       width = 5,
       height = 5)




  







