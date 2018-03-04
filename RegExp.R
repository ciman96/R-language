# \d stands for digits
# \w stands for "word character"
## \\d ， \\w used in R .

str_detect(c("a", "apple", "banana"), pattern = "a.")
str_detect(c("banana", "ba", "bac"), pattern = "ba.")
# 含有ba後面接一個任意字元的字串
str_detect(c("a", "Hello"), pattern = "a*") # "a"可有可無
str_detect(c("abc", "ac", "bcde"), pattern = "ab*") #第一個為a，b*可有可無
str_detect(c("a", "", "c", "abab"), pattern = "a?") #a出現 0次或 1次
str_detect(c("a", "", "c", "b"), pattern = "ba?") 
str_detect(c("123a", "123banana", "123apple", "123a"), pattern = "123a+")
# "123a+" ， 123a符合條件。 
str_detect(c("123a", "123", "123aa", "123baa"), pattern = "123a{1,2}")
#123a，a出現1次或2次。
str_detect(c("123a", "123", "123aa", "123baa", "123aaa"), pattern = "123a{2,}")
# a 出現2次以上
str_detect(c("123aaaaa", "123a", "123aaaaaa"), pattern = "123a{2,5}")
#a出現2次到5次
str_detect(c("apple", "app", "ap", "bapp", "appcde", "cdeapp") , pattern = "^app")
# "app"字串開頭
str_detect(c("ry", "Larry", "Marry", "Mari"), pattern = "ry$")
# "ry"字串結尾
str_detect(c("abcd"), pattern = "^abcd$")
# "abcd"字串為開頭和結尾。
str_detect(c("Larry", "loves", "apple", "aple"), pattern = "^ap.*le$")
## pattern為"ap"字串開頭，le結尾，"*" 任一字串可有可無，
#  即aple也符合pattern。
str_detect(c("a", "aeuo", "abcd", "u"), pattern = "[aeiou]")
str_detect(c("a", "aeuo", "abcd"), pattern = "^[aeiou]")
#開頭是"aeiou"任一字元。
str_detect(c("abce", "aeiouggg", "aeiou", "abcd","e", "egg", "apple"), pattern = "[^aeiou]")
# "^aeiou"，不包含"aeiou"字串，但aeiougg可
str_detect(c("aaa", "ccd", "cce"), pattern = "^[abcd]{3}")
str_detect("M123456789", "^[A-Z]\\d{9}$ ")