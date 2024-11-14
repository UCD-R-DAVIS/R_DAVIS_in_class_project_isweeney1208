
#week8study
#3 time classes
#dates
#posixct (calendar time)
#posixlt (local time)

sample_dates_1 <- c("2018-02-01","2018-03-21","2018-10-05", "2019-01-01", "2019002-18")

class(sample_dates_1)


#the string must be the form YYYY-MM-DD
#to convert it into a Date object 
sample_dates_1 <- as.Date(sample_dates_1)

class(sample_dates_1)

#otherwise this happens:
sample_dates_2 <- c("02-02-2018","03-21-2018","10-05-2018","01-01-2019","02-18-2019")

sample_dates_3 <- as.Date(sample_dates_2)

sample_dates_3 #this doesnt work, wrong formatting causes bad results

#to fix this error you need to specify the format like so:
sample_dates_3 <- as.Date(sample_dates_2, format = "%m-%d-%Y")
#date code preceded by %
sample_dates_3

?strptime

#challenge
as.Date("Jul 04, 2019", format =
          "%b%d,%Y")

tm1 <- as.POSIXct("2016-07-24 23:55:26")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2

#posixct assumes you collected your data in the timezone your computer is set to
#To change this, set the timezone parameter. Here's an example that sets the timezone to GMT

tm3 <- as.POSIXct("2010-12-01 11:42:03", tz ="GMT")
tm3

#the tidyverse way
library(lubridate)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")

#we use ymd since our data is y-m-d
sample_dates_lub <- ymd(sample_dates_1)

sample_dates_lub
 
sample_dates_2 <- c("2-01-2018", "3-21-2018", "10-05-18", "01-01-2019", "01-18-2019")

#notice that not all the expected numbers of digits are always used. Lubridate doesnt care.

sample_dates_lub2 <-mdy(sample_dates_2)
sample_dates_lub2

#timezones:
#hms means hours, minutes, seconds, to add time to a date, use functions that add 
# "_hms" or "_hm"
#its a good idea to combine your date and time into a signle column, since
#it represents different sized increments of a single time variable

lubridate::ymd_hm("2016-01-01 12:00",
                  tz="America/Los_Angeles")
#24 hour time
lubridate::ymd_hm("2016/04/05 14:47",
                 tz="America/Los_Angeles")

#convert 12 hour time into 24 hour time
latime <- lubridate::ymd_hms("2016/04/05 4:47:21 PM",
                             tz="America/Los_Angeles")
latime
#how to change time zones
with_tz(latime, tzone= "GMT")
with_tz(latime, tzone = "Pacific/Honolulu")

