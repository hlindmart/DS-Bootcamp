library(ggplot2)
library("dplyr")
library(reshape2)

first25 <- nhtemp[1:25]
last25 <- nhtemp[36:60]

temp_dep <- t.test(first25, last25, paired=TRUE)
temp_dep