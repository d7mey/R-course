
data <- read.csv("SimpleAdvertising(1).csv",header=T)
data$X<- NULL
data
fit<-lm(data , formula = Sales~Radio)
summary(fit)
library(ggplot2)
ggplot(data=data,
       aes(x=Radio , y=Sales ))+
  annotate("text",x=10,y=25,
           label="Sales=9.31164+0.20250*X",
           color="red",size =3.5)+geom_point()+geom_smooth(method=lm,se=T)
