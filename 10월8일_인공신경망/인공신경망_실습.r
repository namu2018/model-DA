library(caret)
dim(mtcars)
data(mtcars)
set.seed(0)
###partitioning

idx <- createDataPartition(mtcars$vs, p=0.8, list=F)
mtcars_tr <- mtcars[idx,]
mtcars_vali<- mtcars[-idx,]

##input값 표준화 시작
mtcars_tr_scale <- as.data.frame(sapply(mtcars_tr[,-8], scale))
mtcars_vali_scale <- as.data.frame(sapply(mtcars_vali[,-8], scale))

###다시 측청할 값(vs)를 넣어줌
mtcars_tr_scale$vs <- as.factor(mtcars_tr$vs)
mtcars_vali_scale$vs <- as.factor(mtcars_vali$vs)

##인공신경망 예측 
str(mtcars_vali_scale)
str(mtcars_tr_scale)
model <- nnet(vs~., mtcars_tr_scale, size=100)
pred <- predict(model, mtcars_vali_scale, type='class')
table(pred, mtcars_vali_scale$vs)
