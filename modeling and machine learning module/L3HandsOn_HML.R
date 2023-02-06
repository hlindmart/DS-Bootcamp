# loading library
library("ggplot2")

# loading data
linear<-read.csv('/Users/hlind/Downloads/nonlinear.csv')
View(linear)

# x1 y1
x1y1<-ggplot(linear, aes(x=X1, y=Y1))+
  geom_point()+
  stat_smooth(method="lm", formula=y ~x + I(x^2), size=1)
x1y1
# x1 y1 is quadratic relationship

# modeling quadratic relationship
x1y1Q<-linear$X1^2
x1y1Model<-lm(linear$Y1~linear$X1+x1y1Q)
summary(x1y1Model)
# pvalue <.05 - test is significant

# x2 y2
x2y2<-ggplot(linear, aes(x=X2, y=Y2))+
  geom_point()+
  stat_smooth(method="lm", formula=y ~x + I(x^2), size=1)
x2y2
# x2 y2 is exponential relationship

# exponential model
x2y2Model<-lm(log(linear$Y2)~linear$X2)
summary(x2y2Model)
# pvalue <.05 - test is significant