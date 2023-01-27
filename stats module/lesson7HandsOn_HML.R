# loading libraries
library("rcompanion")
library("car")
library("effects")
library("multcomp")

# loading data
cells<-read.csv('/Users/hlind/Downloads/cellPhone.csv')
View(cells)

# how does the presence or absence of an intl phone plan influence the use of nighttime mins, holding whether or not the client has a voicemail plan?
## testing normality for nighttime mins
plotNormalHistogram(cells$Night.Mins)
# already normally distributed

# levene test
leveneTest(Night.Mins~International.Plan, data=cells)
# pvalue assumption met

# homogeneity test
phoneHomogeneity=lm(Night.Mins~vMail.Plan, data=cells)
anova(phoneHomogeneity)
#pvalue assumption met

# running ANCOVA
phoneANCOVA=lm(Night.Mins~vMail.Plan+International.Plan*vMail.Plan, data=cells)
anova(phoneANCOVA)
# it does not matter whether the client has an international plan, it does not affect their minutes