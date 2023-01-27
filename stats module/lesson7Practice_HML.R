# importing libraries
library("rcompanion")
library("car")
library("effects")
library("multcomp")

# viewing already imported data
View(gradAd)
## does university rating significantly predict your college GPA when holding the TOEFL score constant?

# checking normality for gpa
plotNormalHistogram(gradAd$CGPA)
# attempting to square data
gradAd$CGPAsq<-gradAd$CGPA*gradAd$CGPA
plotNormalHistogram(gradAd$CGPAsq)
# now normally distributed

# checking normality for TOEFL
plotNormalHistogram(gradAd$TOEFL.Score)
# attempting squaring the data
gradAd$TOEFL.ScoreSQ<-gradAd$TOEFL.Score*gradAd$TOEFL.Score
plotNormalHistogram(gradAd$TOEFL.ScoreSQ)
# now normally distributed

# levene test
leveneTest(CGPAsq~University.Rating, data=gradAd)
# pvalue <.05 meets assumption

# testing homogeneity
gpaHomogeneity=lm(CGPA~TOEFL.Score, data=gradAd)
anova(gpaHomogeneity)
# assumption not met

# running ANCOVA test
gpaANCOVA=lm(CGPA~TOEFL.Score+University.Rating*TOEFL.Score, data=gradAd)
anova(gpaANCOVA)
# significant value between TOEFL score and university rating
## no need for Anova proceeding with post hocs

# post hocs
gpaPH<-glht(gpaANCOVA, linfct=mcp(University.Rating="Tukey"))
summary(gpaPH)

# determining means
gpaMeans<-effect("University.Rating", gpaANCOVA)
gpaMeans
# college gpa's are similar across the board