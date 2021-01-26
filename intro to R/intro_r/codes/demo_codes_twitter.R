#Installing packages and called the library

# tweeter package in R
#install.packages("rtweet")
#called the package
library(rtweet)
#install httpuv package (to help authentication of IPA twitter through web browser)
#install.packages("httpuv")
library(httpuv)
#install.packages("readr") #this package to help the twitter token readeable
library(readr)
#install.packages("dplyr")
library(dplyr) #this dplyr package is an important and powerful package for management data
#intslall.packages("glue") #(a package attached to dplyr)
library(glue)
#install.packages("tidyverse") #powerful package for data management & manipulations
library(tidyverse)
#install.packages("backports") # a package attached to tidyverse. please choose "NO" if pop ups appears when installing this package
library(backports)

#______________________________________________________________________________________

# stream tweets from the recent TWITTER POSTS using stream_tweets() "(randomly or with query)"
stream_tweets("")  #maximum the last 7 days, with 1% sample of total tweets. max 1800 list of rows

#put some arguments to the function to see specific words/hashtag/information that we want to extract from twitter
tweets_corona <- search_tweets("#corona", n = 500, include_rts = TRUE, lang = "id")
head(tweets_corona)

#lihat aktivitas pada timeline salah satu pengguna twitter, gunakan get_timeline() -- max n=3200
jokowi_timeline <- get_timeline("@jokowi", n = 100)
head(jokowi_timeline)

# melihat informasi mengenai twitter users menggunakan lookup_users() 

pemerintah <- lookup_users(c("jokowi", "Menlu_RI", "mohmahfudmd"))

# cek berapa followers dari masing2 user tersebut
sc_name_followers <- pemerintah[, c("screen_name", "followers_count")]
sc_name_followers


