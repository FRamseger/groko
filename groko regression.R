setwd("C:/Users/framseger/Documents/groko")
library(xlsx)

#df <- read.csv(file="potential_correlates_unstacked_4.csv", header=TRUE, sep=",")

#training data
ministerien<- read.xlsx(file='bundestagswahlergebnisse.xlsx',sheetName = 'Ministerien (2)')
wahlergebnisse <- read.xlsx(file='bundestagswahlergebnisse.xlsx',sheetName = 'wahlergebnisse')
df <- merge(x=ministerien,y=wahlergebnisse, by.x=c("Wahl","Partei"), by.y=c("Wahl","Partei"))
df2 <- df[c(5:29)]

#forecasting data
ministerien_2018<- read.xlsx(file='bundestagswahlergebnisse.xlsx',sheetName = 'forecasting')
wahlergebnisse_2017 <- read.xlsx(file='bundestagswahlergebnisse.xlsx',sheetName = 'wahlergebnisse2017')
df2018 <- merge(x=ministerien_2018,y=wahlergebnisse_2017, by.x=c("Wahl","Partei"), by.y=c("Wahl","Partei"))
df2018_2 <- df2018[c(5:29)]

mod1 <- lm(Anteil.Wahlergebniss~.,df2)


prediction <- predict(mod1, newdata = df2018_2)
prediction*0.5344

#training data b

df2_b <- df[c(5:19,29)]

#forecasting data b

df2018_2_b <- df2018[c(5:19,29)]

mod1_b <- lm(Anteil.Wahlergebniss~.,df2_b)

prediction_b <- predict(mod1_b, newdata = df2018_2_b)
prediction_b*0.5344

