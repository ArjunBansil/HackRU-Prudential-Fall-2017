library(dplyr)
library(OIsurv)
library(RColorBrewer)
library(neuralnet)

train_data=read.csv("train.csv")
test_data=read.csv("test.csv")

tdf = as.data.frame(train_data)
test_df = as.data.frame(test_data)

set.seed(200)

apply(test_df,2,function(x) sum(is.na(x)))

n<-names(tdf)
f<-as.formula(paste("LowestRisk ~",paste(n[!n %in% "LowestRisk"], collapse = " + ")))
nn<-neuralnet(f,data=tdf,hidden=c(5,3), linear.output = T)


