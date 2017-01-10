
require(caret)
require(randomForest)
set.seed(4444)
iris <- read.csv("iris.csv")
#remove the index
iris$X <- NULL

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

png(filename='plot.png', width = 600, height = 600, res = 80)
varImpPlot(iris.rf,type=2)
dev.off()

pred <- predict(iris.rf,validation,"prob")
res <- predict(iris.rf,validation,"response")
validation <- cbind(validation,pred)
validation <- cbind(validation,res)
write.csv(validation,"validation.csv")