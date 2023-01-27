# loading libraries
library("rcompanion")
library("car")

# viewing loaded data
View(breakfast)

# does weight loss changes from baseline to follow up based upon whether the person ate breakfast or not
## wrangling data - keeping rows i want
bk<-breakfast[1:33,]
View(bk)

# subsetting data
keep<-c("Participant.Code", "Treatment.Group", "Age..y.", "Sex", "Height..m.", "Baseline.Resting.Metabolic.Rate..kcal.d.", "Follow.Up.Resting.Metabolic.Rate..kcal.d.")
bk2<-bk[keep]
## adding new columns to data
bk3<-bk2[,1:5]
bk3$repdat<-bk2$Baseline.Resting.Metabolic.Rate..kcal.d.
bk3$contrasts<-"T1"
### adding follow-up data
bk4<-bk2[,1:5]
bk4$repdat<-bk2$Follow.Up.Resting.Metabolic.Rate..kcal.d.
bk4$contrasts<-"T2"
#### binding data
brekky<-rbind(bk3, bk4)

# testing normality with baseline body mass
plotNormalHistogram(bk$Baseline.Body.Mass..kg.)
# looks to be normal

# testing normality with follow-up body mass
plotNormalHistogram(bk$Follow.Up.Body.Mass..kg.)
# looks to be normal

# levene test
leveneTest(repdat~Treatment.Group*contrasts, data=brekky)
# pvalue 1.02 - assumption met

# ANOVA test
mixedANOVA<-aov(repdat~(Treatment.Group*contrasts)+Error(Participant.Code/(contrasts)), brekky)
summary(mixedANOVA)
# no significance