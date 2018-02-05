flights <- fread("flights14.csv")
ans <- flights[order(origin, -dest)]
flights[order(origin,-dest)]
# Sort flights first by column "origin" in ascending order,
# and then by "dest" in descending order

odt = data.table(col = sample(1e7))
t1 <- system.time(ans1 <- odt[base::order(col)]) ## uses order from base R
t2 <- system.time(ans2 <- odt[forder(col)])    ## uses data.table's forder
identical(ans1,ans2)

ans <- flights[, .(delay_arr = arr_delay, delay_dep = dep_delay)]
head(ans)

flights[, sum((arr_delay + dep_delay) < 0)]
flights[origin == "JFK" & month == 6L,
               .(m_arr = mean(arr_delay), m_dep = mean(dep_delay))]

flights[origin == "JFK" & month == 6L, length(dest)]
# We could have used any other column as input argument to length() really.
flights[origin == "JFK" & month == 6L, .N]

DF = data.frame(x = c(1,1,1,2,2,3,3,3), y = 1:8)

DF[with(DF, x > 1), ] #column x as if it were a variable.

ans <- flights[carrier == "AA",
               .(mean(arr_delay), mean(dep_delay)),
               by = .(origin, dest, month)]
ans

flights[carrier == "AA",
        .(mean(arr_delay), mean(dep_delay)),
        keyby = .(origin, dest, month)]
# automatically sort by the variables we grouped by

###Chaining  

ans <- flights[carrier == "AA", .N, by = .(origin, dest)][order(origin, -dest)]
ans






