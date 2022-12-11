#Project 2 in R Programming
#Vince Ryan Taghap BSIT 2-A

library(twitteR)
library(dplyr)
library(rtweet)
library(ggplot2)
library(tidytext)
library(RColorBrewer)
library(tm)
library(plotly)

CONSUMER_SECRET <- "PvNTAZrNQNUPf655uhQGDvqnBhEkOtdnCUChsPooSBWrMeCdj6"
CONSUMER_KEY <- "0eKM7ywAbJIBhoc6qUtPGZ2gc"
ACCESS_SECRET <- "qSvpFsynx6zadfrSvrTaihnqm4jfZ4XNEI6F6LwmWJ2B7"
ACCESS_TOKEN <- "1594992291864727553-wz6TgceS7HWYmZ7Tvn05kMNFAOBkaw"


setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#Extract 10000 tweets from Twitter using twitteR package including retweets

NBAtweets <- searchTwitter("NBA",
                      n=10000,
                      since = "2022-12-05",
                      until = "2022-12-11",
                      lang = "en",
                      retryOnRateLimit = 120
                      )

#Convert into Data Frame
NBAdf <- twListToDF(NBAtweets)
head(NBAdf$text)[1:5]

#Saving and loading the Data Frame
save(NBAdf,file = "NBAdf.Rdata")
load(file = "NBAdf.Rdata")

#Original Tweets

#Subsetting original tweets

tweetsNBA <- NBAdf %>%
  select(screenName,text,created,isRetweet) %>% filter(isRetweet == FALSE)
tweetsNBA

#Saving and loading Original Tweets

save(tweetsNBA,file = "Original_Tweetsdf.Rdata")
load(file = "Original_Tweetsdf.Rdata")

#Grouping the data created
tweetsNBA %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

data1 <- tweetsNBA %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
data1

mn <- tweetsNBA %>% pull(created) %>% min()
mn 
mx <- tweetsNBA %>% pull(created) %>% max()
mx

# Plot on original tweets by time.
Orig_plot <- ggplot(data1, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

Orig_plot %>% ggplotly()

#==============================================================================

#ReTweets

NBA_retweets <- NBAdf %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
NBA_retweets

#Saving and loading ReTweets

save(NBA_retweets,file = "ReTweetsdf.Rdata")
load(file = "ReTweetsdf.Rdata")

#Grouping the data created
NBA_retweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

data2 <- NBA_retweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
data2

mn <- NBA_retweets %>% pull(created) %>% min()
mn 
mx <- NBA_retweets %>% pull(created) %>% max()
mx

# Plot on retweets by time
reTweet_plot <- ggplot(data2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of ReTweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

reTweet_plot %>% ggplotly()
