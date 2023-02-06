# loading libraries
library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")

# loading data
minerals<-read.csv('/Users/hlind/Downloads/minerals.csv')
View(minerals)

# creating linear regression
mineralLogit<-glm(Gold~Antimony, data=minerals, family = "binomial")

# predictions
probabilities<-predict(mineralLogit, type="response")

# converting probabilities
minerals$Predicted<-ifelse(probabilities>.5, "pos", "neg")

# recoding predicted column
minerals$PredictedR<-NA
minerals$PredictedR[minerals$Predicted=='pos']<-1
minerals$PredictedR[minerals$Predicted=='neg']<-0

# converting predicted and gold columns as factors
minerals$PredictedR<-as.factor(minerals$PredictedR)
minerals$Gold<-as.factor(minerals$Gold)

# creating confusion matrix
mineralsMatrix<-caret::confusionMatrix(minerals$PredictedR, minerals$Gold)
str(minerals)
mineralsMatrix
# 34 were predicted to find no gold, and no gold was found
## 8 locations gold was found where there shouldn't have
### 2 locations that were predicted to have gold did not
#### 20 locations were predicted to have gold and did have gold
##### accuracy of team is 84%

# creating logit
minerals1<-minerals %>%
dplyr::select_if(is.numeric)  
predictors<-colnames(minerals1)
## creating logit
minerals1<-minerals1 %>%
mutate(logit=log(probabilities/(1-probabilities))) %>%  
gather(key="predictors", value="predictor.value", -logit)  

# creating plot
ggplot(minerals1, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method = "loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y")
# strong linear regression

# graphing errors
plot(mineralLogit$residuals)
# assumption met

# durbin watson test
dwtest(mineralLogit, alternative="two.sided")
# pvalue significant - dw is 1.76, assumption of independent errors met

# checking for outliers
infl<-influence.measures(mineralLogit)
summary(infl)
# no outliers!

# interpreting regression model
summary(mineralLogit)
# pvalue significant - based on antimony there's an estimate of increase in gold of 1.76

# graphing model
logi.hist.plot(minerals$Antimony, minerals$Gold, boxp = FALSE, type = "hist", col="gray")
