library(ggplot2)
library(PerformanceAnalytics)
library(corrplot)
View(mtcars)

#scatter plot to determine correlation between hp and qsec
ggplot(mtcars, aes(x=hp, y=qsec))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE, color="#50A2A7")+
  xlab("Engine Horsepower")+
  ylab("Time Traveled")

#computing linear regression between qsec and hp
lin_reg <- lm(qsec~hp, mtcars)
summary(lin_reg)

#scatter plot to determine correlation between wt and qsec
ggplot(mtcars, aes(x=wt, y=qsec))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE, color="#F45866")+
  xlab("Vehicle Weight")+
  ylab("Time Traveled")

#computing linear regression between qsec and wt
lin_reg2 <- lm(qsec~wt, mtcars)
lin_reg2
summary(lin_reg2)