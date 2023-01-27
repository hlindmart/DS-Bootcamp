library(tidyr)
library(dplyr)
library(readxl)

#transposing data
energy1<-t(energy)
View(energy1)

#checking data
class(energy1)

#changing data to dataframe
energy2<-as.data.frame(energy1)
class(energy2)

#renaming columns
names(energy2)<-gsub("V", "Year", names(energy2))
View(energy2)