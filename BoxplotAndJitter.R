install.packages("devtools")
library(devtools)
devtools::install_github("jbkunst/highcharter")
library("highcharter")
library("dplyr")
library(readr)

packageVersion("highcharter")

#Load the data
df <-
  read_csv(
    "https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv"
  )
#Remove the unnecessary data such as nationality, date of birth, name, and age
df = subset(df, select = -c(nationality, date_of_birth, name, age))
# Compare the data set using the descipine name and sex
my_data <-
  df %>% filter((sport == "Gymnastics" &
                   sex == "male")  |
                  (sport == "Canoe" &
                     sex == "male") |
                  (sport == "Hockey" &
                     sex == "male") |
                  (sport == "Modern Pentathlon" & sex == "male")
  )
#Remove the redundant data
my_data = subset(my_data, select = -c(sex))
#Create the chart
hcboxplot(
  outliers = FALSE,
  x = my_data$height,
  var = my_data$sport,
  name = "Length"
) %>%
  hc_title(text = "Male height by descipline (Olympic 2012)") %>%
  hc_yAxis(title = list(text = "Height in metre")) %>%
  hc_chart(type = "column")







#Load the data
df <-
  read_csv(
    "https://raw.githubusercontent.com/mekhatria/demo_highcharts/master/Olympics2012CapitalLetter.csv"
  )
#Remove the unnecessary data such as nationality, date of birth, name, and age
df = subset(df, select = -c(nationality, date_of_birth, name, age))
# Comparing two data set using the sport name and sex
my_data <-
  df %>% filter((sport == "Gymnastics" &
                   sex == "male")  |
                  (sport == "Canoe" &
                     sex == "male") |
                  (sport == "Hockey" &
                     sex == "male") | (sport == "Modern Pentathlon" & sex == "male")
  )
#Remove the redundant data
my_data = subset(my_data, select = -c(sex))
#Create the chart
hcboxplot(
  x = my_data$height,
  var = my_data$sport,
  name = "Length",
  color = "#2980b9",
  outliers = TRUE
) %>% 
  hc_chart(type = "column") %>%
  hc_title(text = "Male height by descipline (Olympic 2012)") %>%
  hc_yAxis(title = list(text = "Height in metre")) %>%
  hc_add_series(
    data = my_data,
    type = "scatter",
    hcaes(x = "sport", y = "my_data$height", group = "sport")
  ) %>%
  hc_plotOptions(scatter = list(
    color = "red",
    marker = list(
      radius = 2,
      symbol = "circle",
      lineWidth = 1
    )
  ))  %>%
  hc_plotOptions(scatter = list(jitter = list(x = .1, y = 0)))










# Comparing two data set using the sport name and sex
my_data <- df %>%filter((sport=="Gymnastics"& sex =="female")  |  (sport=="Canoe" & sex =="female")| (sport=="Hockey" & sex =="female")| (sport=="Modern Pentathlon" & sex =="female"))
my_data
hcboxplot(x = my_data$height, var = my_data$sport,
          name = "Length", color = "#2980b9", outliers = TRUE) %>% 
  hc_chart(type = "column") %>%
  hc_title(text= "Male height by descipline (Olympic 2012)") %>%
  hc_yAxis(title = list(text = "Height in metter")) %>%
  hc_add_series(
    data = my_data,
    type = "scatter",
    hcaes(x = "sport", y = "my_data$height", group = "sport")
  ) %>%
  hc_plotOptions(scatter = list(color = "blue",
                                marker = list(
                                  radius=2
                                )
  ))  %>%
  hc_plotOptions(scatter = list(jitter = list(x = .1, y = 0)))


hcboxplot(x = df$height, var = df$sport,
          name = "Length", color = "#2980b9") %>% 
  hc_chart(type = "column") %>%
  hc_add_series(
    data =df,
    type = "scatter",
    hcaes(x = "sport", y = "df$height", group = "sport")
  ) %>%
  hc_plotOptions(scatter = list(color = "blue",
                                marker = list(
                                  radius=2
                                )
  ))  %>%
  hc_plotOptions(scatter = list(jitter = list(x = .1, y = 0)))





