# load libraries
library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("e1071")
library("lmtest")

# loading data
heights<-read.csv('/Users/hlind/Downloads/heights 2.csv')
View(heights)

# testing for linearity
scatter.smooth(x=heights$AM_Height, y=heights$PM_Height, main="Heights")
# appears to be linear

# linear model
heightsMod<-lm(PM_Height~AM_Height, data=heights)

# testing for homoscedasticity - creating graphs
par(mfrow=c(2,2))
plot(heightsMod)

# breusch test
lmtest::bptest(heightsMod)
# pvalue >.05 - homoscedasticity achieved, assumption met

# ncv test
car::ncvTest(heightsMod)
# pvalue >.05 - assumption met

# checking for assumptions since no corrections are needed
gvlma(heightsMod)
# all assumptions acceptable

# testing outliers in x
CookD(heightsMod, group=NULL, plot=TRUE, idn=3, newwd=TRUE)
# rows 3, 4, 12 have outliers in x

# testing leverage
heightsLev=hat(model.matrix(heightsMod))
plot(heightsLev)
heights[heightsLev>.2,]
# 3 is the issue

# testing outliers in y
car::outlierTest(heightsMod)
# pvalue <.05 - possibility of 1 outlier

# testing for outliers in x and y
summary(influence.measures(heightsMod))
# 3, 11, and 37

# creating new model to test against old model
heightsOutliers<-heights[c(1:2,4:10,12:36,38:41),]
heightsOutlierslm=lm(PM_Height~AM_Height, data=heightsOutliers)
summary(heightsOutlierslm)
# AM height is significant at 98% - pvalue <.05

# checking original model
summary(heightsMod)
# results are the same