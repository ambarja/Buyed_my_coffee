setwd("C:/QUINTA CLASE/EXAMEN")

####Primera Pregunta####
CA<-read.csv("nombres_CA.txt")
TX<-read.csv("nombres_TX.TXT")

View(CA)
View(TX)
#pregunta a
"cuantos bebes nacieron por año"
sum(CA$year)
C1910<-CA[CA$year=="1910",]
View(C1910)
año_1910<-sum(C1910$Num)
print("hola",año_1910)

  
  
  
  
  
####Segunda Pregunta####
cherry<-read.csv("cherry.csv",sep = ";")
View(cherry)
#pregunta a
colnames(cherry)
filas<-rownames(cherry)
help("count.fields")
count.fields(filas)
length(rownames(cherry))
#pregunta b
  ##para Girth
    plot(cherry$Girth,
         xlab="Index",
         ylab="Girth",
         main = "Diagrama de Girth ")
  ##para  Height
    plot(cherry$Height,
         ylab="Height",
         main = "Diagrama de Height")

    ##para volume
    plot(cherry$Volume,
         ylab="Volume",
         main = "Diagrama de Volume")
    ##ggplot
    library("ggplot2")
    ggplot(cherry, aes(Girth,Height))+geom_point()
    ggplot(cherry, aes(Girth,Volume))+geom_point()
    ggplot(cherry, aes(Height,Volume))+geom_point()

#pregunta c
boxplot(cherry$Girth)
boxplot(cherry$Height)
boxplot(cherry$Volume)

#pregunta d

  plot(cherry$Girth, xlab = "indece")
  reg_lin<-lm(cherry$Girth~cherry$Volume)
  plot(cherry$Volume,cherry$Girth,
       main = "Volume vs Girth ",
       xlab = "Volume",
       ylab = "Girth")
  abline(reg_lin)
summary(reg_lin)
#pregunta e
  summary(reg_lin)
  reg_lin$residuals
  plot(reg_lin$residuals)

#pregunta f
  "Al reemplazar los valores de Girth por Height como variable independiente no permite
  que la regresion lineal sea mejor al contrario la correlacion es baja a la linea de referencia. 
  adema Bo y B1 son mas altos de Height que el Girth"
  
  plot(cherry$Girth, xlab = "indece")
  reg_lin2<-lm(cherry$Height~cherry$Volume)
  
  summary(reg_lin2)
  plot(cherry$Volume,cherry$Height,
       main = "Volume vs Height ",
       xlab = "Volume",
       ylab = "Height")
  abline(reg_lin2)
