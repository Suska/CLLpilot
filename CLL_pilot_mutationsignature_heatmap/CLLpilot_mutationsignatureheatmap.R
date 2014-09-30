#Dr. Susanne Weller
#21/07/2014
#
########################################
#CLL PILOT - MUTATION SIGNATURE HEATMAP#
########################################
#
#Working directory
setwd("/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_heatmap")
#input file
mutheatmap <- read.table("CLLpilot_mutationsignature.tsv", header=TRUE, sep="\t")
names(mutheatmap)[1] <- "patientID" 
mutheatmap <- subset(mutheatmap, patientID %in% c("gemini2a", "gemini5a", "gemini6a", "gemini7a", "gemini8a",
                                                  "gemini10a", "gemini11a", "gemini14a", "GeminiStar1a",
                                                  "GeminiStar2a", "GeminiStar3a", "GeminiStar4a"))

#Rearrange columns to fit into heatmap scheme
require(reshape2)
mutheatmap <- melt(mutheatmap, id.vars = c("patientID"))
mutheatmap$variable <- as.character(mutheatmap$variable)
#select values that go in 1st columns 
#A>C
mutheatmapcol01 <- subset(mutheatmap, variable %in% c("A.C.AAA", "A.C.AAC", "A.C.AAG", "A.C.AAT"))
names(mutheatmapcol01)[1] <- "patientID.01" 
names(mutheatmapcol01)[2] <- "variable.01"
names(mutheatmapcol01)[3] <- "value.01" 
mutheatmapcol02 <- subset(mutheatmap, variable %in% c("A.C.CAA", "A.C.CAC", "A.C.CAG", "A.C.CAT"))
names(mutheatmapcol02)[1] <- "patientID.02"
names(mutheatmapcol02)[2] <- "variable.02"
names(mutheatmapcol02)[3] <- "value.02" 
mutheatmapcol03 <- subset(mutheatmap, variable %in% c("A.C.GAA", "A.C.GAC", "A.C.GAG", "A.C.GAT"))
names(mutheatmapcol03)[1] <- "patientID.03"
names(mutheatmapcol03)[2] <- "variable.03"
names(mutheatmapcol03)[3] <- "value.03" 
mutheatmapcol04 <- subset(mutheatmap, variable %in% c("A.C.TAA", "A.C.TAC", "A.C.TAG", "A.C.TAT"))
names(mutheatmapcol04)[1] <- "patientID.04"
names(mutheatmapcol04)[2] <- "variable.04"
names(mutheatmapcol04)[3] <- "value.04" 
#A>G
mutheatmapcol05 <- subset(mutheatmap, variable %in% c("A.G.AAA", "A.G.AAC", "A.G.AAG", "A.G.AAT"))
names(mutheatmapcol05)[1] <- "patientID.05"
names(mutheatmapcol05)[2] <- "variable.05"
names(mutheatmapcol05)[3] <- "value.05" 
mutheatmapcol06 <- subset(mutheatmap, variable %in% c("A.G.CAA", "A.G.CAC", "A.G.CAG", "A.G.CAT"))
names(mutheatmapcol06)[1] <- "patientID.06"
names(mutheatmapcol06)[2] <- "variable.06"
names(mutheatmapcol06)[3] <- "value.06" 
mutheatmapcol07 <- subset(mutheatmap, variable %in% c("A.G.GAA", "A.G.GAC", "A.G.GAG", "A.G.GAT"))
names(mutheatmapcol07)[1] <- "patientID.07"
names(mutheatmapcol07)[2] <- "variable.07"
names(mutheatmapcol07)[3] <- "value.07" 
mutheatmapcol08 <- subset(mutheatmap, variable %in% c("A.G.TAA", "A.G.TAC", "A.G.TAG", "A.G.TAT"))
names(mutheatmapcol08)[1] <- "patientID.08"
names(mutheatmapcol08)[2] <- "variable.08"
names(mutheatmapcol08)[3] <- "value.08"
#A>T
mutheatmapcol09 <- subset(mutheatmap, variable %in% c("A.C.AAA", "A.T.AAC", "A.T.AAG", "A.T.AAT"))
names(mutheatmapcol09)[1] <- "patientID.09"
names(mutheatmapcol09)[2] <- "variable.09"
names(mutheatmapcol09)[3] <- "value.09" 
mutheatmapcol10 <- subset(mutheatmap, variable %in% c("A.T.CAA", "A.T.CAC", "A.T.CAG", "A.T.CAT"))
names(mutheatmapcol10)[1] <- "patientID.10"
names(mutheatmapcol10)[2] <- "variable.10"
names(mutheatmapcol10)[3] <- "value.10" 
mutheatmapcol11 <- subset(mutheatmap, variable %in% c("A.T.GAA", "A.T.GAC", "A.T.GAG", "A.T.GAT"))
names(mutheatmapcol11)[1] <- "patientID.11"
names(mutheatmapcol11)[2] <- "variable.11"
names(mutheatmapcol11)[3] <- "value.11" 
mutheatmapcol12 <- subset(mutheatmap, variable %in% c("A.T.TAA", "A.T.TAC", "A.T.TAG", "A.T.TAT"))
names(mutheatmapcol12)[1] <- "patientID.12"
names(mutheatmapcol12)[2] <- "variable.12"
names(mutheatmapcol12)[3] <- "value.12" 
#C>A
mutheatmapcol13 <- subset(mutheatmap, variable %in% c("C.A.ACA", "C.A.ACC", "C.A.ACG", "C.A.ACT"))
names(mutheatmapcol13)[1] <- "patientID.13"
names(mutheatmapcol13)[2] <- "variable.13"
names(mutheatmapcol13)[3] <- "value.13" 
mutheatmapcol14 <- subset(mutheatmap, variable %in% c("C.A.CCA", "C.A.CCC", "C.A.CCG", "C.A.CCT"))
names(mutheatmapcol14)[1] <- "patientID.14"
names(mutheatmapcol14)[2] <- "variable.14"
names(mutheatmapcol14)[3] <- "value.14" 
mutheatmapcol15 <- subset(mutheatmap, variable %in% c("C.A.GCA", "C.A.GCC", "C.A.GCG", "C.A.GCT"))
names(mutheatmapcol15)[1] <- "patientID.15"
names(mutheatmapcol15)[2] <- "variable.15"
names(mutheatmapcol15)[3] <- "value.15" 
mutheatmapcol16 <- subset(mutheatmap, variable %in% c("C.A.TCA", "C.A.TCC", "C.A.TCG", "C.A.TCT"))
names(mutheatmapcol16)[1] <- "patientID.16"
names(mutheatmapcol16)[2] <- "variable.16"
names(mutheatmapcol16)[3] <- "value.16" 
#C>G
mutheatmapcol17 <- subset(mutheatmap, variable %in% c("C.G.ACA", "C.G.ACC", "C.G.ACG", "C.G.ACT"))
names(mutheatmapcol17)[1] <- "patientID.17"
names(mutheatmapcol17)[2] <- "variable.17"
names(mutheatmapcol17)[3] <- "value.17" 
mutheatmapcol18 <- subset(mutheatmap, variable %in% c("C.G.CCA", "C.G.CCC", "C.G.CCG", "C.G.CCT"))
names(mutheatmapcol18)[1] <- "patientID.18"
names(mutheatmapcol18)[2] <- "variable.18"
names(mutheatmapcol18)[3] <- "value.18" 
mutheatmapcol19 <- subset(mutheatmap, variable %in% c("C.G.GCA", "C.G.GCC", "C.G.GCG", "C.G.GCT"))
names(mutheatmapcol19)[1] <- "patientID.19"
names(mutheatmapcol19)[2] <- "variable.19"
names(mutheatmapcol19)[3] <- "value.19" 
mutheatmapcol20 <- subset(mutheatmap, variable %in% c("C.G.TCA", "C.G.TCC", "C.G.TCG", "C.G.TCT"))
names(mutheatmapcol20)[1] <- "patientID.20"
names(mutheatmapcol20)[2] <- "variable.20"
names(mutheatmapcol20)[3] <- "value.20" 
#C>T
mutheatmapcol21 <- subset(mutheatmap, variable %in% c("C.T.ACA", "C.T.ACC", "C.T.ACG", "C.T.ACT"))
names(mutheatmapcol21)[1] <- "patientID.21"
names(mutheatmapcol21)[2] <- "variable.21"
names(mutheatmapcol21)[3] <- "value.21" 
mutheatmapcol22 <- subset(mutheatmap, variable %in% c("C.T.CCA", "C.T.CCC", "C.T.CCG", "C.T.CCT"))
names(mutheatmapcol22)[1] <- "patientID.22"
names(mutheatmapcol22)[2] <- "variable.22"
names(mutheatmapcol22)[3] <- "value.22" 
mutheatmapcol23 <- subset(mutheatmap, variable %in% c("C.T.GCA", "C.T.GCC", "C.T.GCG", "C.T.GCT"))
names(mutheatmapcol23)[1] <- "patientID.23"
names(mutheatmapcol23)[2] <- "variable.23"
names(mutheatmapcol23)[3] <- "value.23" 
mutheatmapcol24 <- subset(mutheatmap, variable %in% c("C.T.TCA", "C.T.TCC", "C.T.TCG", "C.T.TCT"))
names(mutheatmapcol24)[1] <- "patientID.24"
names(mutheatmapcol24)[2] <- "variable.24"
names(mutheatmapcol24)[3] <- "value.24" 

## merge all data frames by patient ID
mutheatmapnew <- cbind(mutheatmapcol01, mutheatmapcol02, mutheatmapcol03, mutheatmapcol04, mutheatmapcol05, mutheatmapcol06,
mutheatmapcol07, mutheatmapcol08, mutheatmapcol09, mutheatmapcol10, mutheatmapcol11, mutheatmapcol12,
mutheatmapcol13, mutheatmapcol14, mutheatmapcol15, mutheatmapcol16, mutheatmapcol17, mutheatmapcol18,
mutheatmapcol19, mutheatmapcol20, mutheatmapcol21, mutheatmapcol22, mutheatmapcol23, mutheatmapcol24)
mutheatmapnew <- mutheatmapnew[order(mutheatmapnew$patientID.01),]

#Extract all values
values <- seq(from=3, to=72, by=3)
mutheatmapvalues <- mutheatmapnew[,values]
#prime5 <- rep(c("A", "C", "G", "T"), times=12)
# row.names(mutheatmapvalues) <- NULL
row.names(mutheatmapvalues) <- 1:48

#normalization:


patientrow <- seq(from=4, to=48, by=4)
normalisedmutheatmap <- matrix(,nrow=48, ncol=24)
for (i in 1:12){
  
  meanpatientrows <- mean(as.matrix(mutheatmapvalues[(patientrow[i]-3):patientrow[i],]))
  sdpatientrows <- sd(as.matrix(mutheatmapvalues[(patientrow[i]-3):patientrow[i],]))
  
  normalise <- function(x){
    (x-meanpatientrows)/sdpatientrows
  }
  
  
normalisedmutheatmap[(patientrow[i]-3):patientrow[i],] <- apply(mutheatmapvalues[(patientrow[i]-3):patientrow[i],],  
                                                                c(1, 2), normalise)
}


#heatmap
#Make own colour scheme
library("RColorBrewer")
library("gplots")
mutationspectrumcolours <- colorRampPalette(c("yellow", "indianred", "magenta"))
rowsep <- seq(from=4, to=188, by=4)
colsep <- seq(from=4, to=24, by=4)
svg(filename="mutationspectrumexample.svg")
heatmap.2((as.matrix(normalisedmutheatmap, rownames.force=TRUE)), scale="none", col="mutationspectrumcolours",
          key=TRUE, keysize=0.5, symkey=FALSE, density.info="none", dendrogram="none", Rowv=FALSE, Colv=FALSE, trace="none",
          cexRow=1, cexCol=1, sepwidth=c(0.05,0.05), sepcolor="black", rowsep=rowsep, colsep=colsep)
          #xlab="individuals",
         # ylab="genes", keysize=0.5)
dev.off()

