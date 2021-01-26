library(dplyr)
library(tidyverse)
library(readxl)
library(ggplot2)
library(rtweet)

# import .csv file to Data Frame
world_data <- read.csv("data/input/gapminder.csv")


#delete values/variable from the environment
#ls(rm("spain"))
#delete all environment
#rm(list = ls(all.names = TRUE))


# Subset negara yang hanya di Benua Asia
asia <- world_data[which(world_data$cont == "Asia"),]
asia

# cari negara dengan GDP tertinggi di benua Asia
richest = asia[which(asia$gdp_cap == max(asia$gdp_cap)),]

# cari negara dengan GDP terendah di benua Asia
poorest = asia[which(asia$gdp_cap == min(asia$gdp_cap)),]

# negara di Asia dengan gdp_cap di atas/sama dengan rata-rata
developed = asia[which(asia$gdp_cap >= mean(asia$gdp_cap)),]

#  negara di Asia dengan gdp_cap dibawah rata-rata
developing = asia[which(asia$gdp_cap < mean(asia$gdp_cap)),]

#plot developed

dim(developed)

plot_developed <- ggplot(data = developed, # specify which dataset to use
       mapping = aes(x = country, # what goes on the x axis?
                     y = gdp_cap, # what's on them y axis?
                     color = country, #gives color based on namaKd
                     size = gdp_cap)) + #size of scatter defined based on jumlahSuara (must be numeric data)
  geom_line(size=4) + geom_point() +
   theme(axis.text.x = element_text(angle = 90, hjust = 1, size=13,color="darkred")) +
labs(x = "Country", y = "GDP Per-Capita")

print(plot_developed)

