#The created learning sessions of students is used as input for this code. This R code create process flow of transition between learning actions. 
#Then, the transition probability is used as input of Expectated Maximisation to cluster sessions into learning tactics. 
#You may need change number of clusters and the columns' names.
#Importing librarires 
library(pMineR);
library('reshape2')
library(bupaR)
library(seqClustR)
library(pMineR);
library(ggplot2)
#---------------------------------------------------------------------------------
#Setting random variable
set.seed(1) 
#Loading sequence data
obj.L<-dataLoader();   # create a Loader
df <- read.csv2("Address\\output_final.csv",sep=',', stringsAsFactors = FALSE)
df<- format(df, scientific = F)
df$ID <- as.character(df$ID)
df <- df[order(df$time, decreasing = FALSE), ]
#----------------------------------------------------------------------------------
#Creating an object from the loaded data. 
#In our data ID is the unique session id, action is the column contains actions, and time is the datetime that the action happened. You may need change these names.
obj.L$load.data.frame(df,
                      IDName = "ID",
                      EVENTName = "action",
                      dateColumnName = "time")

dati <- obj.L$getData()
#-----------------------------------------------------------------------------------
#Running the FOMM
FOMM <- firstOrderMarkovModel(
  parameters.list = list("threshold"=0.0001))
# load the data
FOMM$loadDataset(dataList = dati)
# train a model
FOMM$trainModel()
# generate 10 new processes (nb: if the
# threshold is too low, it can fail...)
aaa <- FOMM$play(numberOfPlays = 10)
# get the transition matrix
TranMatrix <- FOMM$getModel(kindOfOutput = "MMatrix.perc")
# plot the model
FOMM$plot()
#==========================================
#Running EM
obj.clEM<- cluster_expectationMaximization();
obj.clEM$loadDataset( obj.L$getData() );
# set number of cluster as 4. You may need changing this value
obj.clEM$calculateClusters(num = 4, typeOfModel = "firstOrderMarkovModel");
a <- obj.clEM$getClusters();
dfres <- data.frame(unique(df$ID), a[["PtoClust"]])
names(dfres)[1] <- "ID"
# Change name of 2nd column of df
names(dfres)[2] <- "cluster"
dfres$ID <- as.character(dfres$ID)
dfres<- format(dfres, scientific = F)
table(dfres)
m_df <- merge(df, dfres, by.x = "ID", by.y = "ID")
#------------------------------------------------------------------------------------
#Creating plots. You need to customise these lines according to your results and data.
linch <-  max(strwidth(names(table(m_df[m_df$cluster==1,'action'])), "inch")+0.4, na.rm = TRUE)
par(mai=c(1.5,1.5,0.5,2))
p1 <- barplot(table(m_df[m_df$cluster==1,'action']),las=2, col=c("#011f4b","#005b96","#6497b1",'#c9df8a','#234d20','#36802d','#ecb939','#6f0000','#ff7b7b','#ffbaba','#d11141','#bf0000','#ff77bc'),
              xlab="",las = 3,
              ylab="Frequency", 
              main="a : Elaboration", cex.names=1.3, cex.axis=1,cex.main=1.5)

p2 <- barplot(table(m_df[m_df$cluster==2,'action']),las=2, col=c("#011f4b","#005b96","#6497b1",'#c9df8a','#234d20','#36802d','#ecb939','#6f0000','#ff7b7b','#ffbaba','#d11141','#bf0000','#ff77bc'),
              xlab="",las = 3,
              ylab="Frequency", 
              main="b : Programming and Problem-solving",  cex.names=1.3, cex.axis=1,cex.main=1.5)


p3 <- barplot(table(m_df[m_df$cluster==3,'action']),las=2, col=c("#011f4b","#005b96","#6497b1",'#c9df8a','#234d20','#36802d','#ecb939','#6f0000','#ff7b7b','#ffbaba','#d11141','#bf0000','#ff77bc'),
              xlab="",las = 3,
              ylab="Frequency", 
              main="c : Peer-learning",cex.names=1.3, cex.axis=1,cex.main=1.5 )

p4 <- barplot(table(m_df[m_df$cluster==4,'action']),las=2, col=c("#011f4b","#005b96","#6497b1",'#c9df8a','#234d20','#ecb939','#6f0000','#ff7b7b','#ffbaba','#d11141','#bf0000','#ff77bc'),
              xlab="",las = 3,
              ylab="Frequency", 
              main="d : Rehearsal", cex.names=1.3, cex.axis=1,cex.main=1.5)

#--------------------------------------------------------------------------------------
dfres$ID <- unique(df$ID)
#Saving the output showing cluster of each learning session
write.csv(m_df, 'LearningTacticsClusters.csv')
m_df$cluster
length(m_df[m_df$cluster==1,'action'])/all
length(m_df[m_df$cluster==2,'action'])/all
length(m_df[m_df$cluster==3,'action'])/all
length(m_df[m_df$cluster==4,'action'])/all
all <- length(m_df[m_df$cluster==1,'action'])+length(m_df[m_df$cluster==2,'action'])+length(m_df[m_df$cluster==3,'action'])+length(m_df[m_df$cluster==4,'action'])

