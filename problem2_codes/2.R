# Work out the average (mean) response time in each district. 
# What is the difference between the average response times of the districts with the longest and shortest times?
# Importing all the CSV files into R
f_2011<-read.csv("Calls_for_Service_2011.csv", stringsAsFactors = FALSE)
f_2012<-read.csv("Calls_for_Service_2012.csv", stringsAsFactors = FALSE)
f_2013<-read.csv("Calls_for_Service_2013.csv", stringsAsFactors = FALSE)
f_2014<-read.csv("Calls_for_Service_2014.csv", stringsAsFactors = FALSE)
f_2015<-read.csv("Calls_for_Service_2015.csv", stringsAsFactors = FALSE)
#Cleaning the Data
library(dplyr)
fc_2011<-filter(f_2011, TimeArrive != '', TimeDispatch!='')
fc_2012<-filter(f_2012, TimeArrive != '', TimeDispatch!='')
fc_2013<-filter(f_2013, TimeArrive != '', TimeDispatch!='')
fc_2014<-filter(f_2014, TimeArrive != '', TimeDispatch!='')
fc_2015<-filter(f_2015, TimeArrive != '', TimeDispatch!='')
# Converting the required columns to Time format and creating a column 'responseTime' with Minutes as its units
library('lubridate')
fc_2011$TimeArrive<-mdy_hms(fc_2011$TimeArrive)
fc_2011$TimeDispatch<-mdy_hms(fc_2011$TimeDispatch)
fc_2011$responseTime<-fc_2011$TimeArrive-fc_2011$TimeDispatch

fc_2012$TimeArrive<-mdy_hms(fc_2012$TimeArrive)
fc_2012$TimeDispatch<-mdy_hms(fc_2012$TimeDispatch)
fc_2012$responseTime<-fc_2012$TimeArrive-fc_2012$TimeDispatch

fc_2013$TimeArrive<-mdy_hms(fc_2013$TimeArrive)
fc_2013$TimeDispatch<-mdy_hms(fc_2013$TimeDispatch)
fc_2013$responseTime<-fc_2013$TimeArrive-fc_2013$TimeDispatch

fc_2014$TimeArrive<-mdy_hms(fc_2014$TimeArrive)
fc_2014$TimeDispatch<-mdy_hms(fc_2014$TimeDispatch)
fc_2014$responseTime<-fc_2014$TimeArrive-fc_2014$TimeDispatch

fc_2015$TimeArrive<-mdy_hms(fc_2015$TimeArrive)
fc_2015$TimeDispatch<-mdy_hms(fc_2015$TimeDispatch)
fc_2015$responseTime<-fc_2015$TimeArrive-fc_2015$TimeDispatch
# Aggregating the responseTime with respect to PoliceDistrict
num<-aggregate(responseTime~PoliceDistrict, fc_2011, length)
names(num)[2]<-'Total Number 2011'
total<-aggregate(responseTime~PoliceDistrict, fc_2011, sum)
names(total)[2]<-'Sum 2011'
fcpdrtm_2011<-merge(num, total)

num<-aggregate(responseTime~PoliceDistrict, fc_2012, length)
names(num)[2]<-'Total Number 2012'
total<-aggregate(responseTime~PoliceDistrict, fc_2012, sum)
names(total)[2]<-'Sum 2012'
fcpdrtm_2012<-merge(num, total)

num<-aggregate(responseTime~PoliceDistrict, fc_2013, length)
names(num)[2]<-'Total Number 2013'
total<-aggregate(responseTime~PoliceDistrict, fc_2013, sum)
names(total)[2]<-'Sum 2013'
fcpdrtm_2013<-merge(num, total)

num<-aggregate(responseTime~PoliceDistrict, fc_2014, length)
names(num)[2]<-'Total Number 2014'
total<-aggregate(responseTime~PoliceDistrict, fc_2014, sum)
names(total)[2]<-'Sum 2014'
fcpdrtm_2014<-merge(num, total)

num<-aggregate(responseTime~PoliceDistrict, fc_2015, length)
names(num)[2]<-'Total Number 2015'
total<-aggregate(responseTime~PoliceDistrict, fc_2015, sum)
names(total)[2]<-'Sum 2015'
fcpdrtm_2015<-merge(num, total)

fcpdrtm<-Reduce(merge, list(fcpdrtm_2011,fcpdrtm_2012,fcpdrtm_2013,fcpdrtm_2014,fcpdrtm_2015))
fcpdrtm$TotalNumber<-fcpdrtm$`Total Number 2011`+fcpdrtm$`Total Number 2012`+fcpdrtm$`Total Number 2013`+fcpdrtm$`Total Number 2014`+fcpdrtm$`Total Number 2015`
#Export final dataframe to excel and find the answer there
write.csv(file='Need.csv', x=fcpdrtm)
