# Find the call type that displayed the largest percentage decrease in volume between 2011 and 2015. 
# What is the fraction of the 2011 volume that this decrease represents? The answer should be between 0 and 1.
# Importing all the CSV files into R
f_2011<-read.csv("Calls_for_Service_2011.csv", stringsAsFactors = FALSE)
f_2015<-read.csv("Calls_for_Service_2015.csv", stringsAsFactors = FALSE)
# Calculating the frequency of Type for 2011 and 2015 datasets
library(plyr)
type_2011<-ddply(f_2011, .(f_2011$Type_), nrow)
type_2015<-ddply(f_2015, .(f_2015$Type_), nrow)
colnames(type_2011)<-c('Type', '2011')
colnames(type_2015)<-c('Type', '2015')
library(dplyr)
type<-full_join(type_2011,type_2015,by='Type')
# Removing NA values
type<-na.omit(type)
type$diff<-(type$`2011`-type$`2015`)/type$`2011`
# The answer for 3rd question is 0.9944444440 and the call type is 89