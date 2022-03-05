library(rvest) #loaded the library \

#rvest documentation - https://rvest.tidyverse.org/articles/rvest.html?q=table#tables

# define the URL from where we want to scrape
url = 'https://en.wikipedia.org/wiki/List_of_Indian_states_and_union_territories_by_GDP'

# read the html content from the url 
html = read_html(url)

# take the all the tables from the page  and store it as a dataframe
tables = html %>% 
  html_table()

# pick the second table
final_df = tables[[2]]

# save the data frame as a csv
write.csv(final_df, 'ind_states_gdp.csv', row.names = FALSE)
