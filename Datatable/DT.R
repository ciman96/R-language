DT1 = data.table(A=1:5,B=letters[1:5],C=6:10)

DT2 = data.table(a = c(1L,2L), 
                 b=LETTERS[1:4])


#typeof(1) == "double"
#typeof(1L) == "integer"

#DT[i, j, by]


DT1[,{print(A)
      hist(A)
      NULL}]

DT1[.N] #顯示最後一列
DT1[,.N] #總列數、共幾筆資料
DT1[2:.N] #.N in row


DT1[,.(B)]  #不降維度 return data.table
DT1[,B]   #return vector

DT = data.table(iris)
DT[,.N,by = 10*round(Sepal.Length * Sepal.Width/10)]

#Count how many occur in each group by specifying .N in j
