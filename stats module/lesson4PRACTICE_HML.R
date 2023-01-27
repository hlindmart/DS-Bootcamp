# importing libraries
library("dplyr")
library("rcompanion")
library("car")

# importing data
youtube<-read.csv('/Users/hlind/Downloads/YoutubeChannels.csv')
View(youtube)

# do the video views differ by the grade it received?
## testing normality
plotNormalHistogram(youtube$Video.views)

# positively skewed - square rooting data
youtube$Video.viewsSQRT<-sqrt(youtube$Video.views)
plotNormalHistogram(youtube$Video.viewsSQRT)

# attempting log
youtube$Video.viewsLOG<-log(youtube$Video.views)
plotNormalHistogram(youtube$Video.viewsLOG)
# far too left - keeping sqrt histogram

# bartlett test
bartlett.test(Video.views~Grade, data=youtube)
# p value < .05 - does not meet homogeneity

# welchs one-way test - unequal variance
ytANOVA<-lm(Video.views~Grade, data=youtube)
Anova(ytANOVA, Type="II", white.adjust=TRUE)

# computing post hoc w bonferroni - fixing violation
pairwise.t.test(youtube$Video.views, youtube$Grade, p.adjust="bonferroni", pool.sd=FALSE)

# calculating the mean - after finding significant difference
ytMEANS<-youtube%>%group_by(Grade)%>%summarize(Mean=mean(Video.views))
View(ytMEANS)
# all grades differ in number views, though the higher the grade, the more views the channel got