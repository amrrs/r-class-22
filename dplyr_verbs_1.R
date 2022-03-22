#install.packages('palmerpenguins') 

library(palmerpenguins)
library(dplyr)
 
 #browseVignettes('dplyr')

df = palmerpenguins::penguins

dim(df)

names(df)

############### missing value count ########
# get the missing values count

is.na(df$bill_length_mm)

table(is.na(df$bill_length_mm))

#Convert the logical variable into number

df$bill_length_mm %>% 
  is.na() %>% 
  sum()

summary(df)

############### top 5 rows ########

head(df, 5) %>% View()

# with respect to bill length 

df %>% 
  arrange(desc(bill_length_mm)) %>% 
  head(5) %>% 
  View()


######## select the desired columns ########


df %>% 
  select(c('island','bill_length_mm'))

##### filtering a condition ##### 

df_new <- df %>% 
  filter(!is.na(sex))

#dplyr pipeline

df %>% 
  filter(bill_length_mm > 40) %>% 
  filter(island %in% c('Dream','Torgersen') ) %>% 
  arrange(bill_length_mm) %>% 
  select(one_of('year','species','body_mass_g')) %>% 
  View


##### mutate ########

# new column

df %>% 
  mutate(bl_gt_40 = ifelse(bill_length_mm>=40,1,0)) %>% 
  head() %>% 
  View()

# modify an existing column 

df %>% 
  mutate(bill_length_mm = round(bill_length_mm)) %>% 
  head() %>% 
  View()

#### do both

df %>% 
  mutate(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>% 
  mutate(bl_genius = ifelse(bill_length_mm < avg_bill_length,'Idiot','Genius')) %>% 
  filter(bl_genius == 'Genius') %>% 
  arrange(bill_length_mm) %>% 
  head(6) %>% 
  select(one_of('bill_length_mm','species')) %>% 
  View()
  
