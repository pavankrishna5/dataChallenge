# Some calls result in an officer being dispatched to the scene, and some log an arrival time.
# What is the median response time (dispatch to arrival), in seconds, considering only valid 
# (i.e. non-negative) times?

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

med<-c(fc_2011$responseTime,fc_2012$responseTime,fc_2013$responseTime,fc_2014$responseTime,fc_2015$responseTime)
median(med)
answer<-median(med)*60
