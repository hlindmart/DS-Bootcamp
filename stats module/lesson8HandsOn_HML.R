# loading libraries
library("mvnormtest")
library("car")

# loading data
heart<-read.csv('/Users/hlind/Downloads/heartAttacks.csv')
View(heart)

# how does gender (sex) influence some of the heart attack predictors like resting blood pressure (trestbps) and cholesterol (chol)?
## iv will be SEX, dv's are TRESTBPS and CHOL

# creating matrix - only keeping dv's
keepn<-c("trestbps", "chol")
hAttacks<-heart[keepn]
View(hAttacks)
## only 303 entries - does not violate count

# multivariate normality test
mshapiro.test(t(hAttacks))
# pvalue <.05 - assumption not met

# homogeneity test - resting bp
leveneTest(heart$trestbps, heart$sex, data=heart)
# violated assumption
## homogeneity test - cholesterol
leveneTest(heart$chol, heart$sex, data=heart)
# violated assumption

# multicollinearity test
cor.test(heart$trestbps, heart$chol, method="pearson", use="complete.obs")
# below .7 - no presence of multicollinearity

# running MANOVA
heartMANOVA<-manova(cbind(trestbps, chol)~sex, data=heart)
summary(heartMANOVA)

# post-hoc test
summary.aov(heartMANOVA, test="wilks")
# resting bp significant at <.05
## cholesterol significant at <.05
### gender does play a role in heart attack predictors, like resting blood pressure and cholesterol between men and women.
