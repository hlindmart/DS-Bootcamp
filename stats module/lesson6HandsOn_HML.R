# loading libraries
library("rcompanion")
library("car")
library("dplyr")
library("IDPmisc")

# loading data
suicides<-read.csv('/Users/hlind/Downloads/suicide.csv')
View(suicides)

# have suicide rates changed over the years, if so, does the generation matter?
## wrangling/subsetting data - keeping columns i need
k<-c("country", "year", "suicides.100k.pop", "generation")
sd<-suicides[k]
View(sd)

# testing normality
plotNormalHistogram(sd$suicides.100k.pop)
# positively skewed - square rooting data

sd$suicides.100k.popSQRT<-sqrt(sd$suicides.100k.pop)
plotNormalHistogram(sd$suicides.100k.popSQRT)
# attempting log

sd$suicides.100k.popLOG<-log(sd$suicides.100k.pop)
plotNormalHistogram(sd$suicides.100k.popLOG)

# removing irregular values
sd2<-NaRV.omit(sd)
View(sd2)

# re-attempting log histogram
plotNormalHistogram(sd2$suicides.100k.popLOG)
# keeping log histogram

# levene test
leveneTest(suicides.100k.popLOG~generation, data=sd2)
# assumption failed

# ANOVA test
sdANOVA<-aov(suicides.100k.popLOG~(generation*year)+Error(country/(year)), sd2)
summary(sdANOVA)
# there's a connection between year and generation

# post-hoc
pairwise.t.test(sd2$suicides.100k.popLOG, sd2$generation, p.adjust="bonferroni")

# determining means
sdMean<-sd2%>%group_by(generation, year)%>%summarize(Mean=mean(suicides.100k.pop))
View(sdMean)
# Millennials and Gen Z are the least to commit suicide, with Gen X coming third; leaving GI Gen, Silent Generation, and Boomers with the highest numbers through the years.