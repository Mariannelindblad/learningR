#load of the packages
source(here::here("R/package-loading.R"))
glimpse(NHANES)

#filter

nhanes_small %>%
    filter(PhysActive=="No")

# participants who are physical active

nhanes_small %>%
    filter(PhysActive != "No")

# same way to find the ones who are physical active with diff code:

nhanes_small %>%
    filter(PhysActive == "Yes")

# participants who has a BMI equal to 25

nhanes_small %>%
    filter(BMI == "25")
nhanes_small %>%
    filter(BMI > 25)

TRUE & TRUE
TRUE & FALSE

# when you want to use "or" you use |

TRUE | TRUE

TRUE | FALSE

FALSE | FALSE

# WHen BMI is 15 and physical active is NO
nhanes_small %>%
    filter(BMI==25 & PhysActive == "No")

#when BMI is 25 or physical active is No
nhanes_small %>%
    filter(BMI==25 | PhysActive=="No")

#the "ARRANGE" function
# Arranging data by age in ascending order
nhanes_small %>%
    arrange(Age)

nhanes_small %>%
    arrange(Education)

nhanes_small %>%
    arrange(desc(Age))

# arranging data by education and age by ascending order
nhanes_small %>%
    arrange(Education, Age)

# Mutate columns
Age=Age*12

nhanes_small %>%
    mutate(Age=Age*12)

#Making a new variable, eg. BMI
nhanes_small %>%
    mutate(logged_bmi = log(BMI))

# combining variables
nhanes_small %>%
    mutate(Age = Age * 12,
           logged_bmi = log(BMI))

# Making a new varible using the "if else" function : you are "old" if you are >30 years
nhanes_small %>%
    mutate(old = if_else(Age>=30, "Yes", "No") )

