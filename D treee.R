data<- read.csv("Annuities.csv",header=T)
str(data)
data$Region<-as.factor(data$Region)
data$MaritalStatus<- as.factor(data$MaritalStatus)
ggplot(data=data, aes(x=EducationLevel, fill=AnnuitySold ))+ geom_bar()
summary(data)
table(data$AnnuitySold, data$Gender)
head(data)
HasDept<- ifelse(data$StudentLoanDebt>0,"Y","N")
data$HasDept<- HasDept
#...watch the recoed
set.seed(111)
splitter<- sample.split(data$AnnuitySold, SplitRatio=0.75)

training<- subset(data, splitter==T)
test <-subset(data, splitter==F)

Dtree<-rpart(AnnuitySold ~ . ,data=training)

rpart.plot(Dtree,type=1 , extra =101)
x <- ifelse(data$StudentLoanDebt>=2500 ,"Yes","NO")
  