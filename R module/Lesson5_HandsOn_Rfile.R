library(ggplot2)

rr=data.frame(rivers)
View(rr)

ggplot(rr, aes(x=rivers))+geom_histogram(binwidth = 20, col='#C9B6BE', fill='#D1BECF')+
  ggtitle("Major Rivers in North America")+
  xlab("Length (in miles)")

ggplot(rr, aes(x="", y=rivers))+geom_boxplot(col='#ACCBE1', fill='#7C98B3')+
  xlab("")+
  ylab("Length (in miles)")

summary(rr)
outlier_river <- 680-310
outlier_river*1.5 -> river_outlier
680+river_outlier
310-river_outlier

ggplot(rr, aes(sample=rivers))+geom_qq()+
  xlab("")+
  ylab("Length (in miles)")