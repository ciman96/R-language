name1 <- c("Bob","Mary","Jane","Kim")
name2 <- c("Bob","Mary","Kim","Jane")
weight <- c(60,65,45,55)
height <- c(170,165,140,135)
birth <- c("1990-1","1980-2","1995-5","1996-4")
accept <- c("no","ok","ok","no")
library(data.table)
DT <- data.table(name1,weight,height,accept) 
DF  = data.frame(DT)


## data.table中無列名

#rownames(DT) = letters[1:4]
#rownames(DF) = letters[1:4]
#DF["a",]

#DT 列名仍是1、2、3、4
#DT["1",] error  


##setkey 可以當作是 set的行當作列名

#setkey(ndt,NULL) 可去掉key

ndt = copy(DT)
setkey(ndt,name1)
ndt["Bob",] #找 Bob 那一列
ndt["Bob","weight"]
DT["Bob",2,on="name1"] # 等同上面


setkey(ndt, weight)
ndt[60] #60列
ndt[.(60)] #return data.table

df1 <- data.frame(weight,height,row.names = name1)
dt1 <- as.data.table(df1) #data.table 預設拋棄rowwnames
dt2 <- as.data.table(df1,keep.rownames=T) #增加新的一行，欄名rn
dt3 <- as.data.table(df1,keep.rownames= "rownames")#欄名 rownames 



name1 <- "weight"
setkey(ndt,name1)
ndt
setkeyv(ndt,name1)
ndt

setkey(ndt,name1,weight)
setkeyv(ndt,c("name1","weight"))
##########

setkey(ndt,accept)
ndt[c("ok","no"),sum(weight),by=.EACHI]


setkey(ndt,name1,weight)
ndt[.("Kim",50:60)]
ndt[.("Kim",50:60),nomatch=0]
ndt[.("Kim",50:60),roll=T]
ndt[.("Kim",50:60),roll=Inf] #遇到NA抓上一列資料補
ndt[.("Kim",50:60),roll=-Inf]
ndt[!"Kim"]
ndt[!.("Kim",56)]



