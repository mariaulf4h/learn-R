#install.packages("jsonlite")
library(jsonlite)
library(tidyverse)
library(dplyr)
library(ggplot2)



#json execution
kpu_result <- fromJSON("https://pilkada2017.kpu.go.id/api/1/hasil.json") #data hasil pilkada serentak 2017
kpu_result

#view in table form
view(kpu_result)

head(kpu_result)


#only show election in DKI Jakarta
select_DKI <- subset(kpu_result, subset = namaPropinsi=="DKI JAKARTA")

#provincial election (governor)
DKI_governor <- subset(select_DKI, subset = namaWilayah=="DKI JAKARTA")
DKI_governor

#total vote governor
total_vote_DKI <- sum(DKI_governor["jumlahSuara"])
total_vote_DKI


#eg basic scatter plot for governor votings
scatterplot_DKI <- ggplot(data = DKI_governor, # specify which dataset to use
                                    mapping = aes(x = namaKd, # what goes on the x axis?
                                                  y = jumlahSuara, # what's on them y axis?
                                                  color = namaKd, #gives color based on namaKd
                                                  size = jumlahSuara)) + #size of scatter defined based on jumlahSuara (must be numeric data)
  geom_line(size=0.8) + geom_point() + # with which geometric object should the data be displayed (type of plot)?
  theme(axis.text.x = element_text(angle = 30, hjust = 1, size=5,color="darkred"))


print(scatterplot_DKI)

   
