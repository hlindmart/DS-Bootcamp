library(ggplot2)
library("dplyr")

View(mtcars)

ggplot(mtcars, aes(x=cyl, y=mpg))+
  geom_boxplot(col='#6A0136', fill='#B38CB4', aes(group=cyl))+
  xlab("Cylinders")+
  ylab("Miles Per Gallon (mpg)")

mtcars %>% group_by(cyl) %>%
  summarize(count=n())
