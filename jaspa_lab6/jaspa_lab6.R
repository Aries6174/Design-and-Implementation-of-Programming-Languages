# Load required libraries
#library(ggmap)
#library(dplyr)
#library(tidyverse)
#library(lubridate)

# Register the Google Maps API key
#register_google(key = "AIzaSyAbfTjAPKWCqKxsIYa82cP67RLHCzPpHZg")  # Ensure you run this line with your API key

#ext_tracks_file <- "ebtrk_atlc_1988_2015.txt"
#ext_tracks_widths <- c(7,10,2,2,3,5,5,6,4,5,4,4,5,3,4,3,3,3,4,3,3,3,4,3,3,3,2,6,1)
#ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day", "hour", "year", "latitude", "longitude", "max_wind", "min_pressure", "rad_max_wind", "eye_diameter", "pressure_1", "pressure_2",paste("radius_34", c("ne", "se", "sw", "nw"), sep="_"), paste("radius_50", c("ne", "se", "sw", "nw"), sep="_"), paste("radius_64", c("ne", "se", "sw", "nw"), sep="_"), "storm_type", "distance_to_land", "final")
#ext_tracks <- read_fwf(ext_tracks_file, fwf_widths(ext_tracks_widths, ext_tracks_colnames),na="-99")

#katrina <-filter(ext_tracks, storm_name == "KATRINA")
#katrina_reduced <- select(katrina, month, day, hour, max_wind)
#head(katrina_reduced, 3)

#head(select(filter(ext_tracks, storm_name == "KATRINA"),month,day,hour,max_wind),3)

#ext_tracks %>%
#  filter(storm_name == "KATRINA") %>%
#  select(month, day, hour, max_wind) %>%
#  head(3)

#ext_tracks %>%
#  summarize(n_obs = n(), worst_wind = max(max_wind), worst_ppressure = min(min_pressure))

#knots_to_mph <- function(knots){
#  mph <- 1.152 * knots
#}

#ext_tracks %>%
#  summarize(n_obs = n(), worst_wind = knots_to_mph(max(max_wind)), worst_ppressure = min(min_pressure))

#ext_tracks %>%
#  group_by(storm_name,year) %>%
#  head()

#ext_tracks %>%
#  group_by(storm_name, year) %>%
#  summarize(n_obs = n(), worst_wind = max(max_wind), worst_pressure = min(min_pressure))

#library(ggplot2)
#ext_tracks %>%
#  group_by(storm_name) %>%
#  summarize(worst_wind = max(max_wind)) %>%
#  ggplot(aes(x = worst_wind))+ geom_histogram()

#ext_tracks %>%
#  select(storm_name, month, day, hour, year, latitude, longitude, max_wind)

#ext_tracks %>%
#  select(storm_name, latitude, longitude, starts_with("radius_34"))

#head(ext_tracks$hour)

#head(ext_tracks$hour == "00")

#ext_tracks %>%
#  select(storm_name, hour, max_wind) %>%
#  head(9)

#ext_tracks %>%
#  select(storm_name, hour, max_wind) %>%
#  filter(hour == "00") %>%
#  head(3)

#ext_tracks %>%
#  group_by(storm_name, year) %>%
#  summarize(worst_wind = max(max_wind)) %>%
#  filter(worst_wind >= 160)

#ext_tracks %>%
#  select(storm_name, month, day, hour, latitude, longitude, max_wind) %>%
#  filter(storm_name == "ANDREW" & max_wind >= 137)

#worldcup <- worldcup %>%
#  mutate(player_name = rownames(worldcup))
#
#worldcup %>% slice(1:3)

#worldcup <- worldcup %>%
#  group_by(Position) %>%
#  mutate(ave_shots = mean(Shots)) %>%
#  ungroup()
#
#worldcup %>% slice(1:3)

#worldcup %>%
#  rename(Name = player_name) %>%
#  slice(1:3)

#head(VADeaths)

#VADeaths <- VADeaths %>%
#  tbl_df() %>%
#  mutate(age - row.names(VADeaths))

#VADeaths %>%
#  gather(key = key, value = death_rate, -age)

#library(tidyr)
#library(ggplot2)
#worldcup %>%
#  select(Position, Time, Shots, Tackles, Saves) %>%
#  gather(Type, Number, -Position, -Time) %>%
#  ggplot(aes(x = Time, y = Number)) +geom_point() + facet_grid(Type ~ Position)

#library(knitr)
#
#wc_table <- worldcup %>%
#  filter(Team %in% c("Spain", "Netherlands", "Uruguay", "Germany")) %>%
#  select(Team, Position, Passes) %>%
#  group_by(Team, Position) %>%
#  summarize(ave_passes = mean(Passes),min_passes = min(Passes), max_passes = max(Passes), pass_summary = paste0(round(ave_passes)," (",min_passes, ",", max_passes, ")")) %>%
#  select(Team, Position, pass_summary)
#
#wc_table

#data(worldcup)

#worldcup %>%
#  mutate(Name = rownames(worldcup), Team = as.character(Team)) %>%
#  select(Name, Position, Shots, Team) %>%
#  arrange(desc(Shots)) %>%
#  slice(1:5) %>%
#  left_join(team_standings, by = "Team") %>%
#  rename("Team Standing" = Standing) %>%
#  kable()

#library(lubridate)

#ymd("2006-03-12")
#ymd("06 March 12")
#ymd_hm("06/3/12 6:30 pm")

#library(dplyr)
#library(tidyr)
#
#andrew_tracks <- ext_tracks %>%
#  filter(storm_name == "ANDREW" & year == "1992") %>%
#  select(year, month, day, hour, max_wind, min_pressure) %>%
#  unite(datetime, year, month, day, hour) %>%
#  mutate(datetime = ymd_h(datetime))
#
#head(andrew_tracks, 3)

#andrew_tracks %>%
#  gather(measure, value, -datetime) %>%
#  ggplot(aes(x = datetime, y = value)) +
#  geom_point() + geom_line() +
#  facet_wrap(~ measure, ncol = 1, scales = "free_y")

#andrew_tracks %>%
#  select(datetime) %>%
#  mutate(year=year(datetime),
#         month = months(datetime),
#         weekday = weekdays(datetime),
#         yday = yday(datetime),
#         hour = hour(datetime)) %>%
#  slice(1:3)

#check_tracks <- ext_tracks %>%
#  select(month, day, hour, year, max_wind) %>%
#  unite(datetime, year, month, day, hour) %>%
#  mutate(datetime = ymd_h(datetime),
#         weekday = weekdays(datetime),
#         weekday = factor(weekday, levels = c("Sunday", "Monday",
#                                              "Tuesday","Wednesday",
#                                              "Thursday", "Friday",
#                                              "Saturday")),
#         month = months(datetime),
#         month = factor(month, levels = c ("April", "May", "June",
#                                           "July", "August", "September",
#                                           "October", "November",
#                                           "December", "January")))
#check_weekdays <- check_tracks %>%
#  group_by(weekday) %>%
#  summarize(ave_max_wind = mean(max_wind)) %>%
#  rename(grouping = weekday)
#check_months <- check_tracks %>%
#  group_by(month) %>%
#  summarize(ave_max_wind = mean(max_wind)) %>%
#  rename(grouping = month)
#
#a <- ggplot(check_weekdays, aes(x = grouping, y = ave_max_wind)) + geom_bar(stat = "identity") + xlab("")
#b <- a %+% check_months
#library(gridExtra)
#grid.arrange(a, b, ncol =1)
andrew_tracks <- ext_tracks %>%
  filter(storm_name == "ANDREW") %>%
  slice(23:47) %>%
  select(year, month, day, hour, latitude, longitude) %>%
  unite(datetime, year, month, day, hour) %>%
  mutate(datetime = ymd_h(datetime),
         date = format(datetime, "%b %d"))


# Register the Google Maps API key
library(ggmap)
register_google(key = "AIzaSyAbfTjAPKWCqKxsIYa82cP67RLHCzPpHZg")  # Ensure you run this line with your API key

# Get the map
# Get the map
miami <- get_map("miami", zoom = 5)

# Plotting the map with Andrew's tracks
#ggmap(miami) +
#  geom_path(data = andrew_tracks, aes(x = -longitude, y = latitude), color = "gray", size = 1.1) +
#  geom_point(data = andrew_tracks, aes(x = -longitude, y = latitude, color = date), size = 2) +
#  labs(title = "Tracks of Hurricane Andrew",
#       x = "Longitude",
#       y = "Latitude") +
#  theme_minimal()  # Optional: for a cleaner theme

#andrew_tracks <- andrew_tracks %>%
#  mutate(datetime = with_tz(datetime, tzone = "America/New_York"),
#         date = format(datetime, "%b %d"))
#
#ggmap(miami) +
#  geom_path(data = andrew_tracks, aes(x = -longitude, y = latitude), color = "gray", size = 1.1) +
#  geom_point(data = andrew_tracks, aes(x = -longitude, y = latitude, color = date), size = 2)
  





