setwd("C:/Downloads")
data=read.csv("C:/Downloads/drug200.csv")
require(caret)
set.seed(234)
data_=createDataPartition(y=data$Drug,p=0.7,list = FALSE)
data_train<-data[data_,]
data_test=data[-data_,]
require(randomForest)
model<-randomForest(as.factor(Drug)~.,da=data_train,mtry=3)
summary(model)
pred=predict(model,data_test)
table(predicted=model$predicted,actual=data_train$Drug)
table(predicted=pred,actual=data_test$Drug)
confusionMatrix(pred,as.factor(data_test$Drug))
confusionMatrix(model$predicted,as.factor(data_train$Drug))
varImpPlot(model)

                