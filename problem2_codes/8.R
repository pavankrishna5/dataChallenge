# The calls are assigned a priority. Some types of calls will receive a greater variety of priorities. 
# To understand which type of call has the most variation in priority, 
# find the type of call whose most common priority is the smallest fraction of all calls of that type. 
# What is that smallest fraction?
# Importing all the CSV files into R
f_2011<-read.csv("Calls_for_Service_2011.csv", stringsAsFactors = FALSE)
f_2012<-read.csv("Calls_for_Service_2012.csv", stringsAsFactors = FALSE)
f_2013<-read.csv("Calls_for_Service_2013.csv", stringsAsFactors = FALSE)
f_2014<-read.csv("Calls_for_Service_2014.csv", stringsAsFactors = FALSE)
f_2015<-read.csv("Calls_for_Service_2015.csv", stringsAsFactors = FALSE)

f<-rbind(f_2011,f_2012,f_2013,f_2014,f_2015)
f1<-data.frame(f)

library(dplyr)

f_mean<-f %>% group_by(Type_,Priority) %>% summarise(Total=n())

f_mean2<-f_mean %>% group_by(Type_) %>% summarise(Type_cnt=n())

f_mean3 <- merge(f_mean,f_mean2,by="Type_")

library(data.table)
setDT(f_mean3)[, frac := Total / sum(Total), by=Type_]
# Answer is 0.822309560
