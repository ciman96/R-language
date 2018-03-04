###The := operator can be used in j in two ways


flights = fread("flights14.csv")
DF = data.frame(ID = c("b","b","b","a","a","c"), a = 1:6, b = 7:12, c = 13:18)
DF$c <- 18:13               # (1) -- replace entire column
# or
DF$c[DF$ID == "b"] <- 15:13 # (2) -- subassign in column 'c'

flights[,":="(speed = distance / (air_time/60), # speed in mph (mi/h)
              delay = arr_delay + dep_delay)] # delay in minutes


## alternatively, using the 'LHS := RHS' form
# flights[, c("speed", "delay") := list(distance/(air_time/60), arr_delay + dep_delay)]

flights[hour == 24L, hour := 0L] # := returns the result invisibly.

flights[hour == 24L, hour := 0L][] 
##see the result after the assignment
#We can accomplish that by adding an empty [] 
#at the end of the query .

flights[, c("delay") := NULL]
# remove delay
# or flights[, ":="(delay = NULL)]