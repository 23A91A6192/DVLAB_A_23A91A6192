# Load Air Passengers Dataset
data(AirPassengers)


#Verifying Dataset
?AirPassengers
class(AirPassengers)
View(AirPassengers)



#Converting the dataset to Dataframe
ap_df <- data.frame(
  year <- time(AirPassengers),
  passengers=as.numeric(AirPassengers)
)
ap_df


#Data Frame with years & months Separately
ap_df_months <- data.frame(
  year= floor(time(AirPassengers)),
  month=cycle(time(AirPassengers)),
  passengers=as.numeric(AirPassengers)
)
ap_df_months

#Basic plotting
plot(AirPassengers)

#Plot with Title, Axislabels and Color
plot(AirPassengers,
     type='l',
     lwd=1.5,
     main="Air Passengers Trend Analysis",
     xlab="Months",
     ylab="No.of Passengers",
     col="red"
)
points(AirPassengers,
       type='o',
       pch=16,
       col="blue")
grid()




# Using GGPLOT2 Library
#Importing the library ggplot2
library(ggplot2)

# A Basic Grid with x,y axes
ggplot(ap_df,
       aes(x=year,y=passengers))+
  geom_line(color='darkgreen',linewidth=0.5)+
  labs(
    title='Trend Analysis of Air Passengers',
    subtitle='From 1949-1960',
    caption='Uisng built-in Air Passengers Dataset',
    x='Months',
    y='No.of Passengers')+
  geom_point(color='red',size=0.5)+
  geom_smooth(se=FALSE,color='orange')+
  theme_minimal()+
  theme(
    plot.title=element_text(face="bold",size=14),
    plot.subtitle=element_text(size=10))
