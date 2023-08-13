#creating two derived columns: ride_length & day

aggregated_Data_cleaned <- aggregated_data_3 %>%
  mutate(ride_length=difftime(ended_at,started_at, units = 'mins'),
         day=weekdays(as.Date(started_at))) %>% 
  filter(ride_length> 1, ride_length<(24*60))

#replacing redundant data docked_bike with classic_bike

aggregated_Data_cleaned$rideable_type <- replace(aggregated_Data_cleaned$rideable_type,
                  aggregated_Data_cleaned$rideable_type == 'docked_bike','classic_bike')