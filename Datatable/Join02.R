isabel_website <- data.table(name = rep('Indecisive Isabel', 5),
                             session_start_time = as.POSIXct(c('2016-01-01 11:01', '2016-01-02 8:59', '2016-01-05 18:18', '2016-01-07 19:03', '2016-01-08 19:01')))
isabel_paypal <- data.table(name = 'Indecisive Isabel', purchase_time = as.POSIXct('2016-01-08 19:10'))

sally_website <- data.table(name = 'Spendy Sally', 
                            session_start_time = as.POSIXct('2016-01-03 10:00'))
sally_paypal <- data.table(name = rep('Spendy Sally', 2), 
                           purchase_time = as.POSIXct(c('2016-01-03 10:06', '2016-01-03 10:15')))
francis_website <- data.table(name = rep('Frequent Francis', 6),
                              session_start_time = as.POSIXct(c('2016-01-02 13:09', '2016-01-03 19:22', '2016-01-08 8:44', '2016-01-08 20:22', '2016-01-10 17:36', '2016-01-15 16:56')))
francis_paypal <- data.table(name = rep('Frequent Francis', 3), 
                             purchase_time = as.POSIXct(c('2016-01-03 19:28', '2016-01-08 20:33', '2016-01-10 17:46')))

erica_website <- data.table(name = rep('Error-prone Erica', 2),
                            session_start_time = as.POSIXct(c('2016-01-04 19:12', '2016-01-04 21:05')))
erica_paypal <- data.table(name = 'Error-prone Erica', 
                           purchase_time = as.POSIXct('2016-01-03 08:02'))
vivian_website <- data.table(name = rep('Visitor Vivian', 2),
                             session_start_time = as.POSIXct(c('2016-01-01 9:10', '2016-01-09 2:15')))
vivian_paypal <- erica_paypal[0] # has 0 rows, but the same column names/classes

mom_website <- vivian_website[0] # has 0 rows, but the same column names/classes
mom_paypal <- data.table(name = 'Mom', 
                         purchase_time = as.POSIXct('2015-12-02 17:58'))

website <- rbindlist(list(isabel_website, sally_website, francis_website, erica_website, vivian_website, mom_website))
paypal <- rbindlist(list(isabel_paypal, sally_paypal, francis_paypal, erica_paypal, vivian_paypal, mom_paypal))

website[, session_id:=.GRP, by = .(name, session_start_time)]
paypal[, payment_id:=.GRP, by = .(name, purchase_time)]

website[, join_time:=session_start_time]
paypal[, join_time:=purchase_time]
setkey(website, name, join_time)
setkey(paypal, name, join_time)




