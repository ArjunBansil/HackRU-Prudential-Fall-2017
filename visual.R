library(dplyr)
library(OIsurv)
library(RColorBrewer)
library(neuralnet)
#Visualizing the files 

train_data=read.csv("train.csv")
test_data=read.csv("test.csv")

train_df= as.data.frame(train_data)
# Makes data frame column usable as variables 
attach(train_df)

#Taking the means of similar parameters to get average value and plotting them against risk 
train_df$InInfo<-rowMeans(subset(train_df, select=c(InsuredInfo_1,InsuredInfo_2,InsuredInfo_3,InsuredInfo_4,InsuredInfo_5,InsuredInfo_6,InsuredInfo_7)),na.rm=TRUE)
apply(train_df,2,function(x) sum(is.na(x)))
train_df$familyHistTotal <- rowMeans(subset(train_df, select=c(Family_Hist_1, Family_Hist_2, Family_Hist_3, Family_Hist_4, Family_Hist_5)), na.rm=TRUE)
plot(x=train_df$familyHistTotal, y=train_df$Approved)
train_df$medHist <- rowMeans(subset(train_df, select=c(Medical_History_1,Medical_History_2,Medical_History_3,Medical_History_4,Medical_History_5,Medical_History_6,
                                                       Medical_History_7,Medical_History_8,Medical_History_9,Medical_History_10,Medical_History_11,Medical_History_12,
                                                       Medical_History_13,Medical_History_14,Medical_History_15,Medical_History_16,Medical_History_17,Medical_History_18,
                                                       Medical_History_19,Medical_History_20,Medical_History_21,Medical_History_22,Medical_History_23,Medical_History_24,
                                                       Medical_History_25,Medical_History_26,Medical_History_27,Medical_History_28,Medical_History_29,Medical_History_30,
                                                       Medical_History_31,Medical_History_32,Medical_History_33,Medical_History_34,Medical_History_35,Medical_History_36,
                                                       Medical_History_37,Medical_History_38,Medical_History_39,Medical_History_40,Medical_History_41)),na.rm=TRUE)
plot(x=train_df$medHist, y=train_df$Approved)



