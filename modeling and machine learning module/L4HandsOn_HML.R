# part 1 - backwards regression
## loading data
iq<-read.csv('/Users/hlind/Downloads/IQ.csv')
View(iq)

# creating model
iqModel<-lm(IQ~., data=iq)
summary(iqModel)
#pvalue <.05 at .38 - adj r2 .06

# backward regression
step(iqModel, direction="backward")
# AIC 71.69 with test 1, 2, and 4

# testing new model
iqModel2<-lm(IQ~Test1+Test2+Test4, data=iq)
summary(iqModel2)
# pvalue significant <.05 at .13 - adj r2 .21
## best model is backward regression model with a pvalue of .13
### adjusted r2 value on new model is .21 meaning it has 21% reliability compared to a .06 from the original model
#### each variable influences IQ by 38%

# part 2 - comparing stepwise
## loading data
stepR<-read.csv('/Users/hlind/Downloads/stepwiseRegression.csv')
View(stepR)

# creating model - backward regression
stepModel<-lm(Y~., data=stepR)
summary(stepModel)
# pvalue <.05 - adj r2 .999

# backward regression
step(stepModel, direction="backward")
# AIC 213.38

# testing new model
newModel<-lm(formula = Y ~ X2 + X4 + X6 + X10 + X11 + X12, data = stepR)
summary(newModel)
# pvalue <.05 - r2 .999 - results are the same as the original model

# creating model - forward selection
fwdModel<-lm(Y~1, data=stepR)
summary(fwdModel)

# forward selection
step(fwdModel, direction="forward", scope=(formula(stepR)))
# AIC 213.38

# testing new model
fwdModel2<-lm(formula = Y ~ X6 + X4 + X12 + X10 + X2 + X11, data = stepR)
summary(fwdModel2)
# pvalue <.05 - adj r2 0.999 - same as original model

# hybrid model - using same model as above
step(fwdModel, direction = "both", scope = formula(stepR))
# AIC 213.38

# testing new model
fwdModelhybrid<-lm(formula = Y ~ X6 + X4 + X12 + X10 + X2 + X11, data = stepR)
summary(fwdModelhybrid)
# pvalue <.05 - adj r2 .999 - results are the same
## they were the same on ever occassion
### they all provided the same results, except for the backwards model, the formula was aligned from lowest to highest as opposed to forward and hybrid which had no particular order