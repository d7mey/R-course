library(Smarket)
View(Smarket)
data<-Smarket[,-7]
View(data)
data$Year <- factor(data$Year)
str(data)


train<- data[!data$Year=="2005",]
tail(train)
test<-data[data$Year=="2005",]
head(test)

library(ggplot2)
ggplot(data,aes(x=Year , y = Today , fill=Year))+
  geom_boxplot()+
  ylab(" daily change in S&P500 index")


fit1<-glm(data= train , formula = Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Today , 
         family = binomial)
summary(fit1)
View(test)
head(test)

