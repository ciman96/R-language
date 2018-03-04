p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
p + geom_boxplot(notch = TRUE)
p + geom_boxplot(varwidth = TRUE)
p + geom_boxplot(colour = "#3366FF")
p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)

p + geom_boxplot(aes(colour = drv)) 
# Boxplots are automatically dodged when any aesthetic is a factor

ggplot(diamonds, aes(carat, price)) +
  geom_boxplot()
# x軸可為連續資料，需指定group

ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)),  outlier.alpha = 0.1)

########
y <- rnorm(100)
df <- data.frame(
  x = 1,
  y0 = min(y),
  y25 = quantile(y, 0.25),
  y50 = median(y),
  y75 = quantile(y, 0.75),
  y100 = max(y)
)
ggplot(df, aes(x)) +
  geom_boxplot(
    aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100),
    stat = "identity"
  )
# It's possible to draw a boxplot with your own computations if you
# use stat = "identity":








