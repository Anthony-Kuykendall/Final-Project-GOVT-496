CensusData <- read.csv("Census_Data.csv")
library(data.table)
WardPop <- setattr(CensusData, "row.names", c("5-9", "10-14", "15-17", "18-19", "Total"))