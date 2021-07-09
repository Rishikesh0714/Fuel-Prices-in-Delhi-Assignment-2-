library(readr)
library(lubridate)
library(dplyr)
library(reshape2)


df <- read_csv("Data/fuel_prices.csv")
df$date <- dmy(df$date)
fuel <-
        melt(df,
             id = "date",
             measure.vars = c("petrol_price", "diesel_price"))


library(plotly)
fig <-
        plot_ly(
                data = fuel,
                x = ~ date,
                y =  ~ value,
                color = ~ variable,
                colors = c("#e82088", "#400c99"),
                mode = "line"
        )
fig <-
        fig %>% layout(
                title = "Fuel Prices in Delhi from Jan 2020 to May 2021",
                xaxis = list(title = 'Date'),
                yaxis = list(title = 'Prices (India Rupees Rs.)')
        )
fig 