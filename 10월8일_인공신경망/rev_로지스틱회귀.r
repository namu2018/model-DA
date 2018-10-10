###호지스틱 회귀 모델 만들기
model <- glm(formula=vs~wt+disp, data=mtcars, family="binomial")
summary(model)

##값예측
newdata=data.frame(wt=2.1, disp=180)

prev=predict(model, newdata, type='response')
prev ##1이 나타난 확율/ 로지스틱이기 떄문에 값이 아님  

plot(mtcars$wt, mtcars$vs, pch=16)

model2 <- glm(formula=vs~wt, data=mtcars, family="binomial")
summary(model2)
range(mtcars$wt)
xweight = seq(0,6,0.01)
xweight
vs_pred = predict(model2, list(wt=xweight), type='response')
plot(mtcars$wt, mtcars$vs)
lines(xweight, vs_pred)
