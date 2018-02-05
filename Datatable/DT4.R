set.seed(45)
DT <- data.table(
  i_1 = c(1:5, NA), 
  i_2 = c(NA,6,7,8,9,10), 
  f_1 = factor(sample(c(letters[1:3], NA), 6, TRUE)), 
  f_2 = factor(c("z", "a", "x", "c", "x", "x"), ordered=TRUE), 
  c_1 = sample(c(letters[1:3], NA), 6, TRUE), 
  d_1 = as.Date(c(1:3,NA,4:5), origin="2013-09-01"), 
  d_2 = as.Date(6:1, origin="2012-01-01"))
DT[, l_1 := DT[, list(c=list(rep(i_1, sample(5,1)))), by = i_1]$c]
DT[, l_2 := DT[, list(c=list(rep(c_1, sample(5,1)))), by = i_1]$c]