# What fraction of calls are of the most common type?
# Importing all the CSV files into R
f_2011<-read.csv("Calls_for_Service_2011.csv")
f_2012<-read.csv("Calls_for_Service_2012.csv")
f_2013<-read.csv("Calls_for_Service_2013.csv")
f_2014<-read.csv("Calls_for_Service_2014.csv")
f_2015<-read.csv("Calls_for_Service_2015.csv")
# Calculating the frequency of Type for each dataset
library(plyr)
type_2011<-ddply(f_2011, .(f_2011$Type_), nrow)
type_2012<-ddply(f_2012, .(f_2012$Type_), nrow)
type_2013<-ddply(f_2013, .(f_2013$Type_), nrow)
type_2014<-ddply(f_2014, .(f_2014$Type_), nrow)
type_2015<-ddply(f_2015, .(f_2015$Type_), nrow)
# It can be observed that all of them having type '21' as highest by soring the second coulumn
# a is total number types
a<-sum(type_2011$V1)+sum(type_2012$V1)+sum(type_2013$V1)+sum(type_2014$V1)+sum(type_2015$V1)
# b is sum of number of times of type '21' occurred
b<-type_2011[which(type_2011[2]==max(type_2011[2])), 2]+type_2012[which(type_2012[2]==max(type_2012[2])), 2]+
   type_2013[which(type_2013[2]==max(type_2013[2])), 2]+type_2014[which(type_2014[2]==max(type_2014[2])), 2]+
   type_2015[which(type_2015[2]==max(type_2015[2])), 2]
# The fraction of calls are of the most common type is b/a
b/a
# The answer is 0.2453954000