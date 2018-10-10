library(caret)


set.seed(0)

idx <- createDataPartition(iris$Species, p=0.7, list=F)
idx
iris_tr <- iris[idx,]
iris_test <- iris[-idx,]

table(iris_tr$Species)
install.packages("nnet")
install.packages("Neuralnet")
install.packages("neuralnet")
library(nnet)
library(neuralnet)

   
iris_tr_scale <- as.data.frame(sapply(iris_tr[-5], scale))
iris_test_scale <- as.data.frame(sapply(iris_test[-5], scale))

##5species add
iris_tr_scale$Species <- iris_tr$Species
iris_test_scale$Species <- iris_test$Species

##model_nnet
nnet_model <- nnet(Species~., iris_tr_scale, size=8)
nnet_pred <- predict(nnet_model, iris_test_scale, type='class')
table(nnet_pred, iris_test$Species, dnn=c("pred","real"))

is(sapply(iris_tr[,-5], scale))
iris_tr[-5]
is(iris_tr[,-5])
