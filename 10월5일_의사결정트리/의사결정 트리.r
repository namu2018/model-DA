
##의사결정 트리 함수를 써서 악성 양성 예측 모델 생성
##데이터 셋 연습
###UCI

loc <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
ds  <- "breast-cancer-wisconsin/breast-cancer-wisconsin.data"
url <- paste(loc, ds, sep="")##loc와 ds를 공백없이 붙이겠ㄷ
breast <- read.table(url, sep=",", header=FALSE, na.strings="?")
names(breast) <- c("ID", "clumpThickness", "sizeUniformity",
                   "shapeUniformity", "maginalAdhesion", 
                   "singleEpithelialCellSize", "bareNuclei", 
                   "blandChromatin", "normalNucleoli", "mitosis", "class")
str(breast)
df <- breast[,-1]
df$class <- factor(df$class, levels=c(2,4), labels=c("benign","maginant"))
set.seed(1234)
idx <-sample(nrow(df), 0.7*nrow(df))
train <- df[idx,]
test <- df[-idx,]
str(test)
logist <- glm(class~., data=train, family='binomial')
summary(logist)

prob <- predict(logist, test, type="response")
prob

pred <- factor(prob>.5, levels=c(FALSE,TRUE), labels=c("benign","malignant"))
perf <- table(test$class, pred, dnn=c("Actual","predicted"))
perf
confusionMatrix(pred,test$class)
install.packages("e1071")
library(e1071)
library(caret)
