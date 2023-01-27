library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

#importing data set
studentSurvey<-read.csv("/Users/hlind/Downloads/studentSurvey.csv")
View(studentSurvey)

#subsetting data
areas=studentSurvey[, 31:42]
View(areas)
areas1=NaRV.omit(areas)

#creating matrix
areasMTX<-cor(areas1)
View(round(areasMTX, 2))

#running bartlett test
cortest.bartlett(areas1)

#getting determinates
det(areasMTX)

#creating suitable model
areasModel<-principal(areas1, nfactors = 12, rotate = "none")
areasModel

#scree plot
plot(areasModel$values, type='b')

#determining reliability
library("psych")
alpha(areas1)
View(areas1)

areas1$Area1[areas1$Area1 == 1] <- 5
areas1$Area1[areas1$Area1 == 2] <- 4
areas1$Area1[areas1$Area1 == 3] <- 3
areas1$Area1[areas1$Area1 == 4] <- 2
areas1$Area1[areas1$Area1 == 5] <- 1

areas1$Area2[areas1$Area2 == 1] <- 5
areas1$Area2[areas1$Area2 == 2] <- 4
areas1$Area2[areas1$Area2 == 3] <- 3
areas1$Area2[areas1$Area2 == 4] <- 2
areas1$Area2[areas1$Area2 == 5] <- 1

areas1$Area3[areas1$Area3 == 1] <- 5
areas1$Area3[areas1$Area3 == 2] <- 4
areas1$Area3[areas1$Area3 == 3] <- 3
areas1$Area3[areas1$Area3 == 4] <- 2
areas1$Area3[areas1$Area3 == 5] <- 1

areas1$Area4[areas1$Area4 == 1] <- 5
areas1$Area4[areas1$Area4 == 2] <- 4
areas1$Area4[areas1$Area4 == 3] <- 3
areas1$Area4[areas1$Area4 == 4] <- 2
areas1$Area4[areas1$Area4 == 5] <- 1

areas1$Area5[areas1$Area5 == 1] <- 5
areas1$Area5[areas1$Area5 == 2] <- 4
areas1$Area5[areas1$Area5 == 3] <- 3
areas1$Area5[areas1$Area5 == 4] <- 2
areas1$Area5[areas1$Area5 == 5] <- 1

areas1$Area6[areas1$Area6 == 1] <- 5
areas1$Area6[areas1$Area6 == 2] <- 4
areas1$Area6[areas1$Area6 == 3] <- 3
areas1$Area6[areas1$Area6 == 4] <- 2
areas1$Area6[areas1$Area6 == 5] <- 1

areas1$Area7[areas1$Area7 == 1] <- 5
areas1$Area7[areas1$Area7 == 2] <- 4
areas1$Area7[areas1$Area7 == 3] <- 3
areas1$Area7[areas1$Area7 == 4] <- 2
areas1$Area7[areas1$Area7 == 5] <- 1

areas1$Area8[areas1$Area8 == 1] <- 5
areas1$Area8[areas1$Area8 == 2] <- 4
areas1$Area4[areas1$Area8 == 3] <- 3
areas1$Area8[areas1$Area8 == 4] <- 2
areas1$Area8[areas1$Area8 == 5] <- 1

areas1$Area9[areas1$Area9 == 1] <- 5
areas1$Area9[areas1$Area9 == 2] <- 4
areas1$Area9[areas1$Area9== 3] <- 3
areas1$Area9[areas1$Area9 == 4] <- 2
areas1$Area9[areas1$Area9 == 5] <- 1

areas1$Area10[areas1$Area10 == 1] <- 5
areas1$Area10[areas1$Area10 == 2] <- 4
areas1$Area10[areas1$Area10 == 3] <- 3
areas1$Area10[areas1$Area10 == 4] <- 2
areas1$Area10[areas1$Area10 == 5] <- 1

areas1$Area11[areas1$Area11 == 1] <- 5
areas1$Area11[areas1$Area11 == 2] <- 4
areas1$Area11[areas1$Area11 == 3] <- 3
areas1$Area11[areas1$Area11 == 4] <- 2
areas1$Area11[areas1$Area11 == 5] <- 1

areas1$Area12[areas1$Area12 == 1] <- 5
areas1$Area12[areas1$Area12 == 2] <- 4
areas1$Area12[areas1$Area12 == 3] <- 3
areas1$Area12[areas1$Area12 == 4] <- 2
areas1$Area12[areas1$Area12 == 5] <- 1

alpha(areas1)
