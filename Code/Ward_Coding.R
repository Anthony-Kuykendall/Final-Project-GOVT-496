Ward_Breakdown <- read.csv("Ward_Breakdown.csv")

Ward_Plot1 <- ggplot(data = Ward_Breakdown) +
  geom_point(mapping = aes(x = Total, y = Ward_Breakdown$Rate, color = Ward))
Ward_Plot2 <- ggplot(data = Ward_Breakdown) +
  geom_point(mapping = aes(x = Total, y = Schools, color = Ward)) +
  geom_smooth(mapping = aes(x = Total, y = Schools))
Ward_Plot3 <- ggplot(data = Ward_Breakdown) +
  geom_point(mapping = aes(x = Total, y = Schools, color = Ward)) +
  lm(Total~Schools, data = Ward_Breakdown) +
  abline(4332.4, 613.4)

data(Ward_Breakdown) %>% plot(Total, Schools, pch = 16, cex = 1.3, col = "blue",
     main = "Total Population Against Total School Closures",
     xlab = "Population of African Americans (5-19)", ylab = "Schools Closed (2008-2013)") %>% 
  lm(Total~Schools, data = Ward_Breakdown) %>% 
  abline(4332.4, 613.4)

SchoolReg <- lm(Closed~Total, data = Ward_Breakdown)
summary(SchoolReg)

with(Ward_Breakdown, plot(Total, Schools))
abline(SchoolReg)

Rate_Closure <- mutate(Ward_Breakdown, Rate = Closed / (Closed + Schools))
SchoolLR <- lm(Ward_Breakdown$Rate~Total, data = Ward_Breakdown)
SchoolLR
Ward_Plot1
class(Rate)