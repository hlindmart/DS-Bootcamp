library(dplyr)
library(tidyr)
library(readxl)

#add a new column
FakeNews$StoryType="Fake"

#remove the when column
fake<-c("url", "tracker", "StoryType")
FakeNews2<-FakeNews[fake]
View(FakeNews2)

#separate the url column into website and domain
FakeNews2a<-separate(FakeNews2, url, c("Website", "Domain"), sep="_")
View(FakeNews2a)

#put back the domain column
FakeNews3<-unite(FakeNews2a, Link, Website, Domain, sep = "_")
View(FakeNews3)

#keep only the first 10 rows
FakeNews3a<-FakeNews3[1:10, 1:3]
View(FakeNews3a)