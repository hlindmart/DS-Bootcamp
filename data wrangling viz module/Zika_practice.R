library(dplyr)
library(tidyr)
library(readxl)

#should you MERGE or APPEND
ZikaData<-rbind(ZikaColombia, ZikaUS)
View(ZikaData)