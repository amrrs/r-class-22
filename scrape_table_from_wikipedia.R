library(rvest) #loaded the library \

#rvest documentation - https://rvest.tidyverse.org/articles/rvest.html?q=table#tables

# define the URL from where we want to scrape
url = 'https://en.wikipedia.org/wiki/World_population'

# read the html content from the url 
html = read_html(url)

# take the first table from the page  and store it as a dataframe
df = html %>% 
  html_node('table') %>% 
  html_table()

# save the data frame as a csv
write.csv(df, 'world_pop.csv', row.names = FALSE)
