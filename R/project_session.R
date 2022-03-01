#call the packages

source(here::here("R/package-loading.R"))


# R project management ----------------------------------------------------


weight_killos <- 100
weight_killos

# Character vector
c("a", "b", "c")
# Logic vector
c(TRUE, FALSE, FALSE)
# Numeric vector
c(1, 5, 6)
# Factor vector
factor(c("low", "high", "medium", "high"))

head(airquality)
colnames(airquality)
str(airquality)
summary(airquality)
colnames(airquality)


# Opgave omkring navngivning, spacing, functions --------------------------


# Object names
#DayOne should be:
#day_one

#false <- FALSE
# number_value <- 9

# Spacing
library(tidyverse)
usethis::use_r("package-loading")

?colnames
?here

r3::check_git_config()
usethis::use_git()
