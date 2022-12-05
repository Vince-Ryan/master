#Project 1 in R Programming
#Vince Ryan Taghap BSIT 2-A

library(twitteR)
library(dplyr)
library(rtweet)
library(ggplot2)
library(tidytext)
library(RColorBrewer)
library(wordcloud)
library(stringr)
library(tidyr)
library(tm)

CONSUMER_SECRET <- "PvNTAZrNQNUPf655uhQGDvqnBhEkOtdnCUChsPooSBWrMeCdj6"
CONSUMER_KEY <- "0eKM7ywAbJIBhoc6qUtPGZ2gc"
ACCESS_SECRET <- "qSvpFsynx6zadfrSvrTaihnqm4jfZ4XNEI6F6LwmWJ2B7"
ACCESS_TOKEN <- "1594992291864727553-wz6TgceS7HWYmZ7Tvn05kMNFAOBkaw"


setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)

#Get 10000 observations "excluding retweets

WildFlowerTweets <- searchTwitter("Wild Flower -filter:retweets",
                                 n=10000,
                                 since = "2022-11-26",
                                 until = "2022-12-02",
                                 lang = "en",
                                 retryOnRateLimit = 120
                                 )

#Plot the time series from the date created. with legends. 

WildFlowerDF <- twListToDF(WildFlowerTweets)
head(WildFlowerDF$text)[1:5]

save(WildFlowerDF,file = "WildFlowerDF.Rdata")

load(file = "WildFlowerDF.Rdata")

tweetsDF <- WildFlowerDF %>%
  select(screenName,text,created,statusSource)
tweetsDF


ggplot(data = tweetsDF, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

#Plot a graph (any graph you want)  based on the type of device - 
#found in Source - that the user use. Include the legends.
encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  
    "facebook"
  }else {
    "others"
  }
}

tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

tweetsDF$tweetSource = sapply(tweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- tweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 


ggplot(tweetsDF[tweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets")+
  ggtitle("Tweets by Source")


#Create a wordcloud from the screenName

tweet_appScreen <- tweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 


namesCorpus <- Corpus(VectorSource(tweetsDF$screenName))

pal <- brewer.pal(8, "Dark2")
pal <- pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = namesCorpus, scale=c(3,0.5),
          max.words=500,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal)
