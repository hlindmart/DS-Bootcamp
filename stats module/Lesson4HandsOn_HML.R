# importing packages
library("dplyr")
library("rcompanion")
library("car")

# importing data
avocados<-read.csv('/Users/hlind/Downloads/avocados.csv')
View(avocados)

# does the average price of avocados differ between albany, houston, and seattle?
## filtering data to keep cities i need
avos<-na.omit(avocados%>%filter(region%in%c("Albany", "Houston", "Seattle")))

# making price numeric
avos$AveragePrice<-as.numeric(avos$AveragePrice)
View(avos)

# testing normality
plotNormalHistogram(avos$AveragePrice)
# positively skewed - square rooting data

avos$AveragePriceSQRT<-sqrt(avos$AveragePrice)
plotNormalHistogram(avos$AveragePriceSQRT)
# more normally skewed - attempting log

avos$AveragePriceLOG<-log(avos$AveragePrice)
plotNormalHistogram(avos$AveragePriceLOG)
# keeping sqrt histogram - now normally skewed

# bartlett test
bartlett.test(AveragePriceSQRT~region, data=avos)
# pvalue <0.05 - unequal variance test needed

# ANOVA test
ANOVA<-lm(AveragePriceSQRT~region, data=avos)
Anova(ANOVA, Type="II", white.adjust=TRUE)
# pvalue not significant

# pairwise t test with bonferroni adjust
pairwise.t.test(avos$AveragePriceSQRT, avos$region, p.adjust="bonferroni", pool.sd=FALSE)

# checking the mean
avosMean<-avos%>%group_by(region)%>%summarize(Mean=mean(AveragePrice))
View(avosMean)

# prices vary between all three cities with the most expensive purchase being albany and the least expensive being houston