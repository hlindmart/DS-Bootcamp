# importing packages
library("rcompanion")
library("IDPmisc")

# importing data
parks<-read.csv('/Users/hlind/Downloads/Seattle_ParksnRec.csv')

# viewing data
View(parks)

# num of trips Fall
plotNormalHistogram(parks$X..of.trips.Fall)

# positively skewed - square rooting data
parks$X..of.trips.FallSQRT<-sqrt(parks$X..of.trips.Fall)
plotNormalHistogram(parks$X..of.trips.FallSQRT)

# attempting log
parks$X..of.trips.FallLOG<-log(parks$X..of.trips.Fall)
plotNormalHistogram(parks$X..of.trips.FallLOG)
# keeping squared root histogram

# num of participants Fall
plotNormalHistogram(parks$X..of.participants.Fall)

# positively skewed - square rooting data
parks$X..of.participants.FallSQRT<-sqrt(parks$X..of.participants.Fall)
plotNormalHistogram(parks$X..of.participants.FallSQRT)
# now normally distributed

# num of trips per year
plotNormalHistogram(parks$X..of.trips.per.year)

#positively skewed - square rooting data
parks$X..of.trips.per.yearSQRT<-sqrt(parks$X..of.trips.per.year)
plotNormalHistogram(parks$X..of.trips.per.yearSQRT)

# attempting log
parks$X..of.trips.per.yearLOG<-log(parks$X..of.trips.per.year)
plotNormalHistogram(parks$X..of.trips.per.yearLOG)
# keeping log histogram

# participants per year
plotNormalHistogram(parks$X..participants.per.year)

# positively skewed - square rooting data
parks$X..participants.per.yearSQRT<-sqrt(parks$X..participants.per.year)
plotNormalHistogram(parks$X..participants.per.yearSQRT)

# attempting log
parks$X..participants.per.yearLOG<-log(parks$X..participants.per.year)
plotNormalHistogram(parks$X..participants.per.yearLOG)
# keeping square root histogram

# increase/decrease of prior year
plotNormalHistogram(parks$increase.decrease.of.prior.year)

#positively skewed - square rooting data
parks$increase.decrease.of.prior.yearSQRT<-sqrt(parks$increase.decrease.of.prior.year)

# attempting to square data
parks$increase.decrease.of.prior.yearSQ<-parks$increase.decrease.of.prior.year*parks$increase.decrease.of.prior.year
plotNormalHistogram(parks$increase.decrease.of.prior.yearSQ)

# attempting log
parks$increase.decrease.of.prior.yearLOG<-log(parks$increase.decrease.of.prior.year)
# NaNs produced - keeping original histogram

# average num of people per trip
plotNormalHistogram(parks$Average...people.per.trip)

#positively skewed - square rooting data
parks$Average...people.per.tripSQRT<-sqrt(parks$Average...people.per.trip)
plotNormalHistogram(parks$Average...people.per.tripSQRT)
# now normally distributed