##### 合併根據key。

sales<-data.table(saleID=c("S1","S2","S3","S4","S5"),
                  saleDate=as.Date(c("2014-2-20","2014-5-1","2014-6-15","2014-7-1","2014-12-31")))

commercials<-data.table(commercialID=c("C1","C2","C3","C4"),
                        commercialDate=as.Date(c("2014-1-1","2014-4-1","2014-7-1","2014-9-15")))
setkey(sales, "saleDate")
setkey(commercials, "commercialDate")

sales[commercials, roll = T]
#根據commercialDate和saleDate合併。#先顯示sales的欄位名稱。
#roll = T ，根據commercialDate，合併比commercialDate早或相同的時間(saleDate)資料
#the most recent sale prior to each commercial is said to roll forwards

###依照"commercials"跟sales做合併。

sales[, rollDate:=saleDate] #Add a column, rollDate equal to saleDate
commercials[, rollDate:=commercialDate] #Add a column, rollDate equal to commercialDate

setkey(sales, rollDate)
setkey(commercials, rollDate)

sales[commercials] 
sales[commercials, roll = T]   #forward rolling joins
#sales為被處理的資料，and we select commercials，根據commercials的key值做合併。
# alternatively, sales[commercials, roll = Inf]

### sales根據key < rollDate >，向前抓取離sales key值中最接近的key <rollDate> from commercials.

sales[commercials, roll = -Inf] #backward rolling joins


##setkey，eg. sales[commercials, roll = -Inf]
# join the sales to the commercials，把sales合併到commercials。
# setkey後欄位照順序排，roll = -Inf，向後合併
# sales裡的欄位rollDate，對照commercials裡的rollDate，
# sales$rollDate[1]，"2014-02-20"，向後合併，看commercials的rollDate欄位，S1這一列的key值與C1最接近.
# sales$rollDate[2]，"2014-05-01"，同理，看commercials這一個data.table，
# "2014-05-01"向後合併到"2014-04-01"，在sales rollDate裏5月向後合併和下一列的6月向後合併，
# 5月離commercials裡rollDate的4月比較接近，故合併在一起。

## forward rolling joins or backward，
#  eg. sales[commercials, roll = T] #forward rolling joins
#  以sales來看向前或向後合併，例子:把sales向前合併至commericials.


