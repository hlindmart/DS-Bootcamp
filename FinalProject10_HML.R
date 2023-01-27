library(Ecdat)
library(ggplot2)
library(dplyr)
library(reshape2)

View(Cigarette)

#boxplot for packpc by state
ggplot(Cigarette, aes(x=packpc, y=state))+
  geom_boxplot(color='#9BC1BC', fill='#17255A')+
  xlab("Packs per Capita")+
  ylab("State")

#which have the highest and which have the lowest
Cigarette%>%group_by(state)%>%
  summarise(Mean=mean(packpc))%>%
  arrange(desc(Mean))

#median of packpc by state
cigMedian <- Cigarette%>%group_by(year)%>%
  summarise(Median=median(packpc))
View(cigMedian)

ggplot(cigMedian, aes(x=year, y=Median))+
  geom_line()

#scatter plot of avgprs & packpc
ggplot(Cigarette, aes(x=avgprs, y=packpc))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)
  xlab("Average Price")+
  ylab("Packs per Capita")
  
cor.test(Cigarette$avgprs, Cigarette$packpc, method="pearson", use="complete.obs")

#colorful scatterplot per year
ggplot(Cigarette, aes(x=avgprs, y=packpc, color=year))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)

#linear regression
LM1 <- lm(packpc~avgprs, Cigarette)
summary(LM1)

#inflation
inflPrice <- Cigarette%>%mutate(inflation=avgprs/cpi)
ggplot(inflPrice, aes(x=inflation, y=packpc))+
  geom_point()+
  geom_smooth(method=lm, se=FALSE)

LM2 <- lm(packpc~inflation, inflPrice)
summary(LM2)

#new data frame with paired t-test
eighty <- Cigarette%>%filter(year==1985)
ninety <- Cigarette%>%filter(year==1995)

eightyPACKPC <- eighty$packpc
ninetyPACKPC <- ninety$packpc

eigh_nin <- t.test(eightyPACKPC, ninetyPACKPC, paired=TRUE)
eigh_nin

packs <- data.frame(eightyPACKPC=eightyPACKPC, ninetyPACKPC=ninetyPACKPC)
packs_test <- melt(packs)

View(packs_test)

ggplot(packs_test)+
  geom_boxplot(aes(x=variable, y=value))+
  xlab("Years")+
  ylab("Packs Per Capita")+
  ggtitle("Difference between the Years")