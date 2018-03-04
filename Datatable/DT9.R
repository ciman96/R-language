name1 <- c("Bob","Mary","Jane","Kim")
name2 <- c("Bob","Mary","Kim","Jane")
weight <- c(60,65,45,55)
height <- c(170,165,140,135)
birth <- c("1990-1","1980-2","1995-5","1996-4")
accept <- c("no","ok","ok","no")
dft <- data.table(name1,weight,height,accept)

setindex(dft, name1)
names(attributes(dft))#多出index屬性
dft[name1=="Bob"] # 用==判断提取
indices(dft) # 自動生成index為name1

##index屬性裏頭是資料排序過後的位置，做第二次或第三、四提取，速度會更快。
setindex(dft, NULL)
dft["Bob", on = "name1"] #不會自動生成index但速度也會隨著提取次數變多而增快。
indices(dft)