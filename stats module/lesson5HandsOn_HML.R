# loading libraries
library("rcompanion")
library("car")
library("fastR2")

# loading data
honey<-read.csv('/Users/hlind/Downloads/honey.csv')
View(honey)

# has honey production changed over the years?
## wrangling data
honey$year<-as.character(honey$year)
honey$year<-as.factor(honey$year)

# testing normality
plotNormalHistogram(honey$totalprod)
# positively skewed - square rooting data

honey$totalprodSQRT<-sqrt(honey$totalprod)
plotNormalHistogram(honey$totalprodSQRT)
# attempting log

honey$totalprodLOG<-log(honey$totalprod)
plotNormalHistogram(honey$totalprodLOG)
# keeping log histogram

# levene test
leveneTest(totalprodLOG~year, data=honey)
# fvalue 0.03

# running ANOVA
RMhoneyanova<-aov(totalprodLOG~year, honey)
summary(RMhoneyanova)
# significant changes of total production of honey over the years