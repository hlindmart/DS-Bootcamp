# importing libraries
library("gmodels")
library("tidyr")
library("dplyr")

# importing data
loans<-read.csv('/Users/hlind/Downloads/loans.csv')
View(loans)

# PART 1 - does the term of the loan influence loan status? how?
## independent chi
CrossTable(loans$term, loans$loan_status, fisher=TRUE, chisq=TRUE, expected=TRUE, sresid=TRUE, format="SPSS")
# pvalue looks to be significant with 36mos looking to be payable back more than 60mos.

# PART 2 - how has the ability to own a home changed after 2009?
## reformatting date column
loans$DateR <-as.Date(paste(loans$Date), "%m/%d/%Y")

# separating date
loans1<-separate(loans, DateR, c("Year", "Month", "Date"), sep="-")
View(loans1)

# recoding year
loans1$YearR<-NA
loans1$YearR[loans1$Year >= 2009]<-0
loans$YearR[loans1$Year < 2009]<-1

# recoding home ownership
loans1$OwnR<-NA
loans1$OwnR[loans1$home_ownership == "OWN"]<-0
loans1$OwnR[loans1$home_ownership != "OWN"]<-1

# chi-square
CrossTable(loans1$YearR, loans1$OwnR, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")
# only 14% of people own homes after 2009, meaning home ownership has decreased since 2009

# PART 3 - does it seem likely that the data for this hands on came from the larger population of america?
View(loans)
# aggregating data
loans%>%group_by(loan_status)%>%summarize(count=n())

# creating observed vector
observed=c(3382, 502, 18173)

# creating expected vector - 10% charged off, 15% fully paid, remaining 75% current
expected=c(0.10, 0.75, 0.15)

# goodness of fit chi-square
chisq.test(x=observed, p=expected)
#pvalue shows difference between sample and population