#loading libraries
library("rcompanion")
library("IDPmisc")

#viewing data
View(cruise)

#checking passengers
plotNormalHistogram(cruise$passngrs)
#passengers are positively skewed

#running sqrt function
cruise$passngrsSQRT<-sqrt(cruise$passngrs)
plotNormalHistogram(cruise$passngrsSQRT)
#now normally distributed

#checking length
plotNormalHistogram(cruise$Length)
#length negatively skewed

#squaring length data
cruise$LengthSQ<-cruise$Length*cruise$Length
plotNormalHistogram(cruise$LengthSQ)
#could still use some work

#cubing length data
cruise$LengthCUBE<-cruise$Length^3
plotNormalHistogram(cruise$LengthCUBE)
#keeping squared histogram at negatively skewed

#checking cabins
plotNormalHistogram(cruise$Cabins)
#cabins positively skewed

#running sqrt function
cruise$CabinsSQRT<-sqrt(cruise$Cabins)
plotNormalHistogram(cruise$CabinsSQRT)

#running log function
cruise$CabinsLOG<-log(cruise$Cabins)
plotNormalHistogram(cruise$CabinsLOG)
#keeping original histogram at positively skewed

#checking crew
plotNormalHistogram(cruise$Crew)
#crew positively skewed

#running sqrt function
cruise$CrewSQRT<-sqrt(cruise$Crew)
plotNormalHistogram(cruise$CrewSQRT)

#running log function
cruise$CrewLOG<-log(cruise$Crew)
plotNormalHistogram(cruise$CrewLOG)
#keeping original histogram at positively skewed

#checking passSpcR
plotNormalHistogram(cruise$PassSpcR)
#positively skewed

#running sqrt function
cruise$PassSpcRSQRT<-sqrt(cruise$PassSpcR)
plotNormalHistogram(cruise$PassSpcRSQRT)

#running log function
cruise$PassSpcRLOG<-log(cruise$PassSpcR)
plotNormalHistogram(cruise$PassSpcRLOG)
#now normally distributed

#checking outcab
plotNormalHistogram(cruise$outcab)
#positively skewed

#running sqrt function
cruise$outcabSQRT<-sqrt(cruise$outcab)
plotNormalHistogram(cruise$outcabSQRT)

#running log function
cruise$outcabLOG<-log(cruise$outcab)
plotNormalHistogram(cruise$outcabLOG)
#keeping sqrt histogram - closest to normally distributed

#checking year built
plotNormalHistogram(cruise$YearBlt)
#negatively skewed

#squaring year built data
cruise$YearBltSQ<-cruise$YearBlt*cruise$YearBlt
plotNormalHistogram(cruise$YearBltSQ)

#cubing year built data
cruise$YearBltCUBE<-cruise$YearBlt^3
plotNormalHistogram(cruise$YearBltCUBE)
