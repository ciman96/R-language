DT = data.table( ID = c(rep("b",3),rep("a",2),"c"),
                 a = 1:6 ,
                 b = 7:12,
                 c = 13:18 )

DT[, print(.SD), by = ID]

DT[, lapply(.SD,mean), by = ID]
DT[, lapply(.SD,mean), by = ID, .SDcols = c("a","b")]
#指定欄位a、b

flights[carrier == "AA",                       ## Only on trips with carrier "AA"
        lapply(.SD, mean),                     ## compute the mean
        by = .(origin, dest, month),           ## for every 'origin,dest,month'
        .SDcols = c("arr_delay", "dep_delay")] ## for just those specified in .SDcols