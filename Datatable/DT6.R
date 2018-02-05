DT = data.table( ID = c(rep("b",3),rep("a",2),"c"),
                 a = 1:6 ,
                 b = 7:12,
                 c = 13:18 )
## Suppose we can refer to the data subset for each group as a variable 
## while grouping


DT[,print(.SD),by=ID]
# ".SD" stands for Subset of Data
# .SD contains all the columns except the grouping columns by default.

nice = copy(DT[, lapply(.SD, mean), by = ID])
colnames(nice) = c("Group",paste0(letters[1:3],"_mean"))

test = list(x = as.data.frame(matrix(1:9,3,3)),
            y = as.data.frame(matrix(1:6,2)),
            z = as.data.frame(matrix(1:3,1)))
sapply(test,mean) # Error. data.frame is not numeric 
#In mean.default(X[[i]], ...) :
#argument is not numeric or logical: returning NA


DT[,c(a,b),by = ID] #根據ID分組，連結a,b向量

DT[, .(val = list(c(a,b))), by = ID]  #a list column in data.table