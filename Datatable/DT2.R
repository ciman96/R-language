DT <- data.table(A = rep(letters[2:1], each = 4L), 
                 B = rep(1:4, each = 2L), 
                 C = sample(8))

# Create the new data.table, DT2
### doing j by group 

DT[,.(A,B,C)]

DT2 = DT[,.(C = cumsum(C)),by = .(A,B)]




DT2[,.(C = tail(C,2)),by = A]  #DT2，先按照A分組，再抓取C的最後兩筆資料並命名C

