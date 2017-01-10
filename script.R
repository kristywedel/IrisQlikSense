
require(caret)
require(kernlab)
require(randomForest)
require(lubridate)
require(e1071)
require(pROC)
require(mlbench)
require(pglm)
require(dplyr)
require(plyr)
require(data.table)
require(lubridate)
set.seed(4444)

inTrain <- createDataPartition(y=iris$Species, p=0.75, list = FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
inTrain <- createDataPartition(y=testing$Species, p=0.25, list = FALSE)
validation <- testing[inTrain,]
testing <- testing[-inTrain,]

iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE)

pred_val_test<-predict(iris.rf, testing)
val <- confusionMatrix(pred_val_test, testing$Species)$overall[1]
round(val, digits = 2)
oose = 1-as.numeric(val["Accuracy"])
oose

importance(iris.rf)
importance(iris.rf, type=1)
varImpPlot(iris.rf,type=2)

##Make validation set too

pred <- predict(iris.rf,validation,"prob")
res <- predict(iris.rf,validation,"response")
validation <- cbind(validation,pred)
validation <- cbind(validation,res)
write.csv(validation,"validation.csv")