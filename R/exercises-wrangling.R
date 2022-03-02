# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#Using Select to look at our data, here we only look at 1 colum by its name without ""
?select
select(NHANES, Age)

select(NHANES, Age, Weight, BMI)

#To exclude a coloum use minus (-)
select(NHANES, -HeadCirc)

# All colums starting with letters "BP" (short for blood pressure)
select(NHANES, starts_with("BP"))

# All colums ending with "day"
select(NHANES, ends_with("day") )

# All colums containing letter "Age"
select(NHANES, contains("age"))

#Save the selected columns as a new dataframe
nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, Education)

#view the new dataframa
nhanes_small

#rename all columns to snake case
nhanes_small <- rename_with(nhanes_small,
                            snakecase::to_snake_case)

#look at the data frame and see if it has changed to lower cases
nhanes_small

# when renaming a column then you write the new name first and the old name afterwards

nhanes_small <- rename(nhanes_small, sex = gender)

nhanes_small


#Piping functions
# these two ways are the same:

colnames(nhanes_small)

    nhanes_small %>%
    colnames()


#renaming using piping:
nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active=phys_active)
nhanes_small
