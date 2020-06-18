install.packages("highcharter")
library("highcharter")
library("dplyr")
library("plyr")
library(readr)

cols <- c("#c5c5c5", "#ff5858")

#Load the data
df <-
  read_csv(
    "https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv"
  )
#Gather the disciplines under the name Additional to compare as one series with the targeted discipline
df$sport <-
  revalue(
    df$sport,
    c(
      "Canoe" = "Additional",
      "Hockey" = "Additional",
      "Modern Pentathlon" = "Additional"
    )
  )
#Remove the unnecessary data such as nationality, date of birth, name, and age
df = subset(df, select = -c(nationality, date_of_birth, name, age))
#Filter only the targeted and additional disciplines using the discipline names and sex (male in this case)
my_data <-
  df %>% filter((sport == "Gymnastics" &
                   sex == "male") |  (sport == "Additional" & sex == "male"))
#Remove the redundant data
my_data = subset(my_data, select = -c(sex))
#Create the chart
hchart(my_data, "scatter", hcaes(x = height, y = weight, group = sport)) %>%
  hc_title(text = "Gymnastics") %>%
  hc_xAxis(title = list(text = ""),
           labels = list(format = "{value} m")) %>%
  hc_yAxis(title = list(text = ""),
           labels = list(format = "{value} kg")) %>%
  hc_tooltip(useHTML = TRUE,
             headerFormat = "<b>{series.name}</b><br/>Height: {point.x} m<br/> Weight: {point.y} kg",
             pointFormat = "") %>%
  hc_colors(cols)


#Upload the Olympics2012.csv
df <- read_csv("https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv")
df$sport <- revalue(df$sport, c("Gymnastics" = "Additional", "Hockey" = "Additional", "Modern Pentathlon" = "Additional"))
df=subset(df, select = -c(nationality, date_of_birth, name, age))
my_data <- df %>%filter((sport=="Canoe" & sex =="male") |  (sport=="Additional" & sex =="male"))
my_data=subset(my_data, select = -c(sex))
hchart(my_data, "scatter", hcaes(x = height, y = weight, group = sport))%>%
  hc_title(text = "Canoe") %>% 
  hc_xAxis(title = list(text = ""),labels = list(format = "{value} m")) %>% 
  hc_yAxis(title = list(text = ""),labels = list(format = "{value} kg")) %>%
  hc_tooltip(useHTML = TRUE, headerFormat = "<b>{series.name}</b><br/>Height: {point.x} m<br/> Weight: {point.y} kg", 
             pointFormat="") %>%
  hc_colors(cols)

#Upload the Olympics2012.csv
df <- read_csv("https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv")
df$sport <- revalue(df$sport, c("Canoe" = "Additional", "Gymnastics" = "Additional", "Modern Pentathlon" = "Additional"))
df=subset(df, select = -c(nationality, date_of_birth, name, age))
my_data <- df %>%filter((sport=="Hockey" & sex =="male") |  (sport=="Additional" & sex =="male"))
my_data=subset(my_data, select = -c(sex))
hchart(my_data, "scatter", hcaes(x = height, y = weight, group = sport))%>%
  hc_title(text = "Hockey") %>% 
  hc_xAxis(title = list(text = ""),labels = list(format = "{value} m")) %>% 
  hc_yAxis(title = list(text = ""),labels = list(format = "{value} kg")) %>%
  hc_tooltip(useHTML = TRUE, headerFormat = "<b>{series.name}</b><br/>Height: {point.x} m<br/> Weight: {point.y} kg", 
             pointFormat="") %>%
  hc_colors(cols)


#Upload the Olympics2012.csv
df <- read_csv("https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv")
df$sport <- revalue(df$sport, c("Gymnastics" = "Additional", "Hockey" = "Additional", "Canoe" = "Additional"))
df=subset(df, select = -c(nationality, date_of_birth, name, age))
my_data <- df %>%filter((sport=="Modern Pentathlon" & sex =="male") |  (sport=="Additional" & sex =="male"))
my_data=subset(my_data, select = -c(sex))
hchart(my_data, "scatter", hcaes(x = height, y = weight, group = sport))%>%
  hc_title(text = "Modern Pentathlon") %>% 
  hc_xAxis(title = list(text = ""),labels = list(format = "{value} m")) %>% 
  hc_yAxis(title = list(text = ""),labels = list(format = "{value} kg")) %>%
  hc_tooltip(useHTML = TRUE, headerFormat = "<b>{series.name}</b><br/>Height: {point.x} m<br/> Weight: {point.y} kg", 
             pointFormat="") %>%
  hc_colors(cols)





