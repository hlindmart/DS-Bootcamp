library(tidyr)
library(dplyr)
library(fastDummies)

#importing csv
eatingHabits<-read.csv("/Users/hlind/Downloads/Eating_Habits.csv")

#viewing my data
View(eatingHabits)

#recoding into new variable anything that is junk - empty variable
eatingHabits$JunkFood<-NA

#recoding into new variable anything that is junk - filling in column
eatingHabits$JunkFood[eatingHabits$Activity=='Eating fruit']<-0
eatingHabits$JunkFood[eatingHabits$Activity=='Eating raw vegetables']<-0
eatingHabits$JunkFood[eatingHabits$Activity=='Eating candy, chocolate bars']<-1
eatingHabits$JunkFood[eatingHabits$Activity=='Eating potato chips, crisps']<-1
eatingHabits$JunkFood[eatingHabits$Activity=='Eating french fries']<-1
eatingHabits$JunkFood[eatingHabits$Activity=='Eating hamburgers, hot dogs or sausages']<-1
eatingHabits$JunkFood[eatingHabits$Activity=='Eating peanuts']<-0
eatingHabits$JunkFood[eatingHabits$Activity=='Eating whole wheat or rye bread']<-0
eatingHabits$JunkFood[eatingHabits$Activity=='Drinking soft drinks, cola or other drinks with sugar']<-1
eatingHabits$JunkFood[eatingHabits$Activity=='Drinking coffee']<-0

#check recoded data
View(eatingHabits)

#recode 'sex' column to numbers
eatingHabits$Sex[eatingHabits$Sex=='Males']<-0
eatingHabits$Sex[eatingHabits$Sex=='Females']<-1

#check recoded data
View(eatingHabits)