#Load air passenger data set
data("AirPassengers")

#verify the dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)

#convert the dataset to dataframe
ap_df<-data.frame(
  year<-time(AirPassengers),
  passengers=as.numeric(AirPassengers)
)
ap_df

#data frame with years and months separately
ap_df_months<-data.frame(
  year=floor(time(AirPassengers)),
  month=cycle(time(AirPassengers)),
  passengers=as.numeric(AirPassengers)
)
ap_df_months

#Basic plot
plot(AirPassengers)

#plot with title,axis,label and color
plot(AirPassengers,
     type='l',
     main="Air Passengers trend Analysis",
     xlab="Months",
     ylab="No.of Passengers",
     col="red"
)

#changing the line width & point color
plot(AirPassengers,
     type='l',
     lwd=1.5,
     main="Air Passengers trend Analysis",
     xlab="Months",
     ylab="No.of Passengers",
     col="red"
)
points(AirPassengers,
       type='o',
       pch=16,
       col="blue"
)
grid()

#using ggplot2 library
library(ggplot2)

#A basic grid with x&y axes
ggplot(
  ap_df,
  aes(x=year,y=passengers))+
  geom_line(color='blue',linewidth=0.7)+
  labs(
    title='Trend Analysis of Air Passengers',
    subtitle='From 1949-1960',
    caption='using Built-in Air Passengers Dataset',
    x='Months',
    y='No.of Passengers')+
  geom_point(color='red',size=0.9)+
  geom_smooth(se=FALSE,color='orange',linewidth=0.9)+
  theme_minimal()+
  theme(
    plot.title=element_text(face="bold",size=14),
    plot.subtitle=element_text(size=10,color="purple"),
    plot.caption=element_text(color="blue",hjust = 0.5)
  )