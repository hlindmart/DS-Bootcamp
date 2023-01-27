# loading libraries
library("rcompanion")
library("car")
library("fastR2")

# determine whether weight changes from baseline to follow-up
## wrangling data
breakfast1<-breakfast[1:33,1:7]
keep<-c("Participant.Code", "Treatment.Group", "Age..y.", "Sex", "Height..m.", "Baseline.Resting.Metabolic.Rate..kcal.d.", "Follow.Up.Resting.Metabolic.Rate..kcal.d.")
breakfast2<-breakfast1[keep]
View(breakfast2)
### reshaping data
breakfast3<-breakfast2[,1:5]
breakfast3$repdat<-breakfast2$Baseline.Body.Mass..kg.
breakfast3$contrasts<-"T1"
#### adding follow-up
breakfast4<-breakfast2[,1:5]
breakfast4$repdat<-breakfast2$Follow.Up.Body.Mass..kg.
breakfast4$contrasts<-"T2"
##### binding data
breks<-rbind(breakfast3, breakfast4)

# testing normality - baseline
plotNormalHistogram(breakfast1$Baseline.Body.Mass..kg.)
# looks normal

# testing normality - follow-up
plotNormalHistogram(breakfast1$Follow.Up.Body.Mass..kg.)
# looks normal

# levene test
leveneTest(repdat~Treatment.Group*contrasts, data=breks)
# assumption met

# running ANOVA
RManova1<-aov(repdat~contrasts+Error(Participant.Code), breks)
summary(RManova1)
