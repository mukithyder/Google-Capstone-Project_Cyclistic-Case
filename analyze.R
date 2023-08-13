##data by members & bike type
data_by_members_long <- aggregated_Data_cleaned %>% 
  group_by(member_casual, rideable_type) %>% 
  summarise(mean_ride_lenth= mean(ride_length),total_rides=n());

##TIME
data_by_hours_long <- aggregated_Data_cleaned %>% 
  mutate(date=ymd_hms(started_at)) %>%
  mutate(time=format(date, format ='%I %p'), h=hour(date)) %>% 
  group_by(h,time,member_casual) %>% 
  summarise(usage=n()) %>%
  arrange(h)

##DAY
data_by_day_long <- aggregated_Data_cleaned %>% 
  group_by(day,member_casual) %>% 
  summarise(mean_ride_length=mean(ride_length),total_rides=n())

##MONTH
data_by_month_long <- aggregated_Data_cleaned %>% 
  mutate(date=ymd_hms(started_at)) %>% 
  mutate(month=months.Date(date), year=substr(started_at,1,4)) %>% 
  group_by(year,month,member_casual) %>% 
  summarise(usage=n(),duration=mean(ride_length))

##START & END STATION

#start station casual
top_start_st_casual_long  <- aggregated_Data_cleaned %>%
  filter(member_casual=='casual') %>% 
  group_by(start_station_name) %>% 
  summarise(rides=n(), lat=round(mean(start_lat), digits = 4), lng=round(mean(start_lng), digit = 4)) %>%
  arrange(-rides)
  
#start station member
top_start_st_member_long  <- aggregated_Data_cleaned %>%
  filter(member_casual=='member') %>% 
  group_by(start_station_name) %>% 
  summarise(rides=n(), lat=round(mean(start_lat), digits = 4), lng=round(mean(start_lng), digit = 4)) %>%
  arrange(-rides)

#end station casual
top_end_st_casual_long  <- aggregated_Data_cleaned %>%
  filter(member_casual=='casual') %>% 
  group_by(end_station_name) %>% 
  summarise(rides=n(), lat=round(mean(end_lat), digits = 4), lng=round(mean(end_lng), digit = 4)) %>%
  arrange(-rides)

#end station member
top_end_st_member_long  <- aggregated_Data_cleaned %>%
  filter(member_casual=='member') %>% 
  group_by(end_station_name) %>% 
  summarise(rides=n(), lat=round(mean(end_lat), digits = 4), lng=round(mean(end_lng), digit = 4)) %>%
  arrange(-rides)
