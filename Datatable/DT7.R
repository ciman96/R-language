DF = data.frame(ID1 = sample(letters[1:2], 10, TRUE),
                ID2 = sample(1:3, 10, TRUE),
                val = sample(10),
                stringsAsFactors = FALSE,
                row.names = sample(LETTERS[1:10]))
DT = as.data.table(DF)

flights = fread("flgihts14.csv")
setkey(flights,origin)
flights[.("JFK")]

flights["JFK"]
##On single column key of character type,
#you can drop the .() notation and use the values directly when subsetting, 
#like subset using row names on data.frames.

flights[c("JFK", "LGA")] ## a vector
#This returns all columns corresponding to those rows where origin column matches either “JFK” or “LGA”
setkey(flights,origin,dest)
## or alternatively
# setkeyv(flights, c("origin", "dest")) # provide a character vector of column names
##it sorts the data.table first by the column origin and then by dest by reference

flights["JFK"]#可以只給第一個的key值

flights[.(unique(origin), "MIA")] #無法不指定第一個key值
##We can not skip the values of key columns before. 
#Therefore we provide all unique values from key column origin.
##“MIA” is automatically recycled to fit the length of unique(origin) which is 3

flights[.("LGA", "TPA"), "arr_delay"][order(-arr_delay)]
#use chaining to order the column in decreasing order.

flights[, sort(unique(hour))]
setkey(flights, hour)
key(flights)
flights[.(24)]
## subset on hour by using the .() notation.
flights[.(24), hour := 0L]
key(flights)
setkey(flights, origin, dest)
key(flights)
ans <- flights["JFK", max(dep_delay), keyby = month]

flights[.("JFK","MIA"),mult="first"]
##The query “JFK”, “XNA” doesn't match any rows in flights and therefore returns NA

flights[.(c("LGA", "JFK", "EWR"), "XNA"), mult = "last", nomatch = 0L]
