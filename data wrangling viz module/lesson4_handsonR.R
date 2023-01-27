library(ggplot2)
library(lattice)
library(tidyr)
library(dplyr)

#importing part 5 data
hearts1<-read.csv("/Users/hlind/Downloads/L6handson.csv")
View(hearts1)

#checking data
str(hearts)

#changing data from chr to num
hearts$Day<-as.numeric(hearts$Day)
hearts$Month<-as.numeric(hearts$Month)
str(hearts1)
View(hearts)

ggplot(hearts1)+
  geom_line()

ggplot(hearts1, aes(as.Date("%B %j, %Y", Year)))+
  geom_line()

hearts1$Date<-NA
hearts1$Date[hearts1$]