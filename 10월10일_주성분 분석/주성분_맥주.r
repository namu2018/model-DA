install.packages("readxl")
library(readxl)
getdev()
setwd("C:/Users/ktm/Documents/choi_dontouch/R-basic/10월10일_주성분 분석")
beer <- read_excel("beer_pca.xls")
beer <- as.data.frame(beer)
beer.pca <- prcomp(beer, scale=T)
summary(beer.pca)
screeplot(beer.pca, type="lines", pch=19, main="scree plot")
biplot(beer.pca)
corbeer<- cor(beer)
corrplot(corbeer, method="number")
beer.pca

beer.predict <- predict(beer.pca)
beer.predict
