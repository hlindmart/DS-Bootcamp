# importing libraries
library("rcompanion")
library("IDPmisc")
library("gmodels")
library("tidyr")
library("dplyr")
library("car")
library("fastR2")
library("effects")
library("multcomp")
library("mvnormtest")

# scenario 1 - one proportion z test
prop.test(x=28, n=94, p=0.16, alternative="two.sided", correct=FALSE)
# pvalue <.05 - sample estimate is 30%

# scenario 2 - independent chi-square
## importing data
aseptic<-read.csv('/Users/hlind/Downloads/antiseptics.csv')
View(aseptic)

# data wrangling
aseptic.expanded <-aseptic[rep(row.names(aseptic), aseptic$Number.of.applications), 1:2]
View(aseptic.expanded)

# independent chi-square comparing antiseptic usage across three clinics
CrossTable(aseptic.expanded$Clinic, aseptic.expanded$Antiseptic.Type, fisher=TRUE, chisq=TRUE, expected=TRUE, sresid=TRUE, format="SPSS")
# pvalue >.05 at 0.98 - B topical is used more through all three clinics at 49% with topical D coming in second place at 30%

# scenario 3 - one-way ANOVA
## importing data
savings<-read.csv('/Users/hlind/Downloads/savings.csv')
View(savings)

# reformatting data
savings.reformat<-gather(savings, key="Group", value="Price")
View(savings.reformat)

# removing NA values
funds<-na.omit(savings.reformat)
View(funds)

# testing normality
plotNormalHistogram(funds$Price)
# looks to be normally distributed - checking square root
funds$PriceSQRT<-sqrt(funds$Price)
plotNormalHistogram(funds$PriceSQRT)
# negatively skewed - attempting log
funds$PriceLOG<-log(funds$Price)
plotNormalHistogram(funds$PriceLOG)
# keeping original histogram

# bartlett test
bartlett.test(Price~Group, data=funds)
# pvalue <.05 - assumption not met

# running ANOVA
fundsANOVA<-lm(Price~Group, data=funds)
Anova(fundsANOVA, Type="II", white.adjust=TRUE)
# pvalue <.05

# t test w bonferroni adjust
pairwise.t.test(funds$Price, funds$Group, p.adjust.method = "bonferroni", pool.sd = FALSE)

# checking the mean
fundsMean<-funds%>%group_by(Group)%>%summarize(Mean=mean(Price))
fundsMean
# group A has a better savings practice with group C having the most challenges when it comes to savings

# scenario 4 - two proportion z-test
prop.test(x=c(129, 74), n=c(374, 171), alternative = "two.sided")
# pvalue >.05