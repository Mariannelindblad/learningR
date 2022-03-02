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
nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, BPDiaAve, Education)

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


#Excercise 6.9

nhanes_small %>%
    select(bp_sys_ave, education)

#renaming bp sys ave:
nhanes_small %>%
    rename(bp_sys = BPSysAve,
           bp_dia = BPDiaAve)

#rewrite this code using the pipe operator: select(nhanes_small, bmi, contains("age"))

nhanes_small %>% select(BMI, contains("age"))


#4. rewrite with pipe: Making a new function using piping: the old version: blood_pressure <- select(nhanes_small, starts_with("bp_"))
# rename(blood_pressure, bp_systolic = bp_sys)

blood_pressure <- nhanes_small %>% select(starts_with("BP")) %>% rename(bp_systolic = BPSysAve)


?filter

#Excercise 6.13

# Excercise 6.13 ----------------------------------------------------------


# 1. BMI between 20 and 40 with diabetes
nhanes_small %>%
    # Format should follow: variable >= number or character
    filter(BMI >= 20 & 40 <= BMI & Diabetes == "Yes")



# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>%
    mutate(filter(BMI >= 20 & 40 <= BMI & Diabetes == "Yes")

 # 2. Calculate mean arterial pressure
        mean_arterial_pressure = ((2 * BPDiaAve) + BpSysAve) / 3),


# 3. Create young_child variable using a condition
nhanes_small %>%
    mutate(young_child = if_else(Age=6, "Yes", "No")
    nhanes_modified


    nhanes_modified <- nhanes_small %>% # dataset
        mutate(
            mean_arterial_pressure = ((2 * BPDiaAve) + BPSysAve) / 3,
            young_child = if_else(Age < 6, "Yes", "No"))

#Calculate the max value of BMI

nhanes_small %>%
    summarise(max_bmi=max(BMI, na.rm = TRUE)) ,
            min_bmi=min(BMI, na.rm = TRUE))


nhanes_small %>%
    filter(!is.na(Diabetes)) %>%
    group_by(Diabetes, PhysActive) %>%
    summarise(mean_age=mean(Age, na.rm = TRUE) ,
              mean_bmi=mean(BMI, na.rm = TRUE)) %>%
    ungroup()

