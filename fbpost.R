fbpost14m_15m<-read.csv('fbpost_m.csv')

fbpost14m_15m$ordered_Month <- with(data=fbpost14m_15m,
                               ifelse ((Month == "Jan"),1,
                                       ifelse ((Month == "Feb"),2,
                                               ifelse ((Month == "Mar"),3,
                                                       ifelse ((Month == "Apr"),4,
                                                               ifelse ((Month == "May"),5,
                                                                       ifelse ((Month == "Jun"),6,
                                                                               ifelse ((Month == "Jul"),7,
                                                                                       ifelse ((Month == "Aug"),8,
                                                                                               ifelse ((Month == "Sep"),9,
                                                                                                       ifelse ((Month == "Oct"),10,
                                                                                                               ifelse ((Month == "Nov"),11,12
                                                                                                               ))))))))))))

fbpost14m_15m$ordered_Month <- factor(fbpost14m_15m$ordered_Month, levels=1:12,
                                 labels = c("Jan","Feb","Mar","April", "May", "June", "July", "Aug", "Sept", "Oct","Nov","Dec"))

ggplot(data = fbpost14m_15m, aes(x = ordered_Month, y = Sum.of.Engaged.Users, fill = factor(Year))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(y = "\nSumOfEngagedUsers", x = 'Month') + ggtitle('Engaged users with FBposts for given month in 2014 & 2015')