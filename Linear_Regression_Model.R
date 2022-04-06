library(ISLR)
library(MASS)
library(boot)
library(caret)
snails<- read.csv("Snails.csv", header=T, stringsAsFactors = T)
View(snails)
lm.fitall<- lm(Rings~ ., data=snails)
summary(lm.fitall)
##Finding best transformation for a predictor
lm.fit_dia<-lm(Rings~ Diameter, snails)
summary(lm.fit_dia)
lm.fit_logdia<-lm(Rings~log(Diameter), snails)
summary(lm.fit_logdia)
lm.fit_rootdia<-lm(Rings~ I(Diameter^0.5))
summary(lm.fit_rootdia)
attach(snails)

#finding the best interactions and combinations
lm.fit<- lm(Rings~Type+ LongestShell+ log(Diameter)*I(Height^0.5)+ I(WholeWeight^0.5)*ShuckedWeight*ShellWeight*VisceraWeight, data=snails)
summary(lm.fit)
lm.fit2<- lm(Rings~Type+ LongestShell+ log(Diameter)+ log(Diameter):I(Height^0.5)+ I(WholeWeight^0.5)*I(ShuckedWeight^0.5)*ShellWeight+ VisceraWeight, data=snails)
summary(lm.fit2)
lm.fit3<-lm(Rings~Type+ LongestShell+ log(Diameter)+ log(Diameter):I(Height^0.5)+ I(WholeWeight^0.5)*I(ShuckedWeight^0.5)+ I(ShellWeight^0.5)+ I(ShellWeight^0.5):I(WholeWeight^0.5)+ I(ShellWeight^0.5):I(ShuckedWeight^0.5)+ I(VisceraWeight^0.5):I(ShuckedWeight^0.5), data=snails)
summary(lm.fit3)

#testing R squared and MSE using validation technique
set.seed(1)
trainingindex<- sample(1:nrow(snails), nrow(snails)/2,replace=F)
###we will use half of our data to train


TrainingData<- snails[trainingindex,]
TestingData <- snails[-trainingindex,]
fit<- lm(Rings~Type+ LongestShell+ log(Diameter)+ log(Diameter):I(Height^0.5)+ I(WholeWeight^0.5)*I(ShuckedWeight^0.5)+ I(ShellWeight^0.5)+ I(ShellWeight^0.5):I(WholeWeight^0.5)+ I(ShellWeight^0.5):I(ShuckedWeight^0.5)+ I(VisceraWeight^0.5):I(ShuckedWeight^0.5), TrainingData)
TrainingData$PredictedRings<- predict(fit, TrainingData)
View(TrainingData)
TrainingData$PredictedRings

View(TestingData)
TestingData$PredictedRings<- predict(fit, TestingData)
View(TestingData)

actual<- TestingData$Rings
predicted<- TestingData$PredictedRings
rss<-sum((predicted - actual)^2)
rss
tss<- sum((actual-mean(actual))^2)
tss
rsq<- 1 - rss/tss
rsq
test_mse<- sum(((predicted-actual)^2))/nrow(TestingData)
test_mse

