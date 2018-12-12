Preliminaries
library(tidyverse)

closed_schools <- read.csv("ClosedDCPS.csv")

# Here is a breakdown of changing the column names that need it. It is important
# for the map and grade count data to actually work in this code.
colnames(closed_schools)[colnames(closed_schools)=="X"] <- "Longitude"
colnames(closed_schools)[colnames(closed_schools)=="Y"] <- "Latitude"
colnames(closed_schools)[colnames(closed_schools)=="FACUSE"] <- "Designation"
colnames(closed_schools)[colnames(closed_schools)=="PS"] <- "PreSchool"
colnames(closed_schools)[colnames(closed_schools)=="PK"] <- "PreK"
colnames(closed_schools)[colnames(closed_schools)=="GR_1"] <- "Grade 1"
colnames(closed_schools)[colnames(closed_schools)=="GR_2"] <- "Grade 2"
colnames(closed_schools)[colnames(closed_schools)=="GR_3"] <- "Grade 3"
colnames(closed_schools)[colnames(closed_schools)=="GR_4"] <- "Grade 4"
colnames(closed_schools)[colnames(closed_schools)=="GR_5"] <- "Grade 5"
colnames(closed_schools)[colnames(closed_schools)=="GR_6"] <- "Grade 6"
colnames(closed_schools)[colnames(closed_schools)=="GR_7"] <- "Grade 7"
colnames(closed_schools)[colnames(closed_schools)=="GR_8"] <- "Grade 8"
colnames(closed_schools)[colnames(closed_schools)=="GR_9"] <- "Grade 9"
colnames(closed_schools)[colnames(closed_schools)=="GR_10"] <- "Grade 10"
colnames(closed_schools)[colnames(closed_schools)=="GR_11"] <- "Grade 11"
colnames(closed_schools)[colnames(closed_schools)=="GR_12"] <- "Grade 12"
colnames(closed_schools)[colnames(closed_schools)=="TOTAL_STUD"] <- "Total Students"

# This value stores the number of students by grade level affected by school
# closures.
student_by_grade <- subset(closed_schools, select = c(10:25))
colSums(student_by_grade, na.rm = TRUE, dims = 1)

school_designation <- subset(closed_schools, select = c(4, 6, 39))

ggplot(data = closed_schools) +
  geom_point(mapping = aes(x = Designation, y = "Total Students"), na.rm = TRUE)