fbpage14m_15m<-read.csv('fbpage_m.csv')

fbpage14m_15m$ordered_Month <- with(data=fbpage14m_15m,
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

fbpage14m_15m$ordered_Month <- factor(fbpage14m_15m$ordered_Month, levels=1:12,
                                     labels = c("Jan","Feb","Mar","April", "May", "June", "July", "Aug", "Sept", "Oct","Nov","Dec"))

ggplot(data = fbpage14m_15m, aes(x = ordered_Month, y = Engaged.Users, fill=factor(Year))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(y = "\nEngaged users with FB Page", x = NULL)+ggtitle('Engaged users with FB page for given month in 2014 & 2015')