d <- ggplot(diamonds, aes(x, y)) + xlim(4, 10) + ylim(4, 10)


### bin 是指每一格小方塊。


d + geom_bin2d()
d + geom_bin2d(bins = 10)
# You can control the size of the bins by specifying the number of
# bins in each direction
d + geom_bin2d(bins = 30) # default
d + geom_bin2d(binwidth = c(0.5, 0.5))


