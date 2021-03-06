#Dr. Susanne Weller
#23/07/2014
#
################################################################
#CLL pilot - mutation signatures - RAINFALL PLOT - ALL SAMPLES #
################################################################

#This plot investigates if specific mutations are clustered within the genome
#Input file is a substracted vcf

#read file
setwd("/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall")
allmutations <- read.table("all_samples_CLL_A1_VC1_VF01_S42.tsv", header=TRUE, sep="\t")
#select one sample as test object
mutCLL003 <- subset(allmutations, sample=="Gemini2a-Gemini2b_sox")

#pad chromosome numbers
source("padding.R")
allmutations$chrom <- as.character(allmutations$chrom)
allmutations$chrom <- sapply(allmutations$chrom, padding)

allmutations <- allmutations[order(allmutations$sample, allmutations$chrom, allmutations$pos),]
write.csv(allmutations, "allmutations.tsv", quote=FALSE, sep="\t", row.names=FALSE)

#This python script calculates the intermutational distances within the chromosomes
system("python rainfallprep.py")

allmutationdist <- read.table("out_allmutations.txt", stringsAsFactors = FALSE)
colnames(allmutationdist) <- c("sample", "chromosome", "position", "ref", "alt",
                             "mut.number", "intermut.dist", "mut.type")

#This function aggregates matching mutation types:
source("muttypecorrection.R") 
allmutationdist$mut.type2 <- as.factor(sapply(allmutationdist$mut.type, muttypecorrection)) 


# Overview plot for all samples
library(ggplot2)
library(scales)
theme_set(theme_bw())

ggplot()+geom_point(data=allmutationdist,aes(x=mut.number, y=intermut.dist, col=mut.type2), size=1)+
scale_colour_manual(values=c("purple", "yellow", "green", "blue", "black", "red"))+
scale_y_log10(labels=comma)+
#geom_vline(aes(xintercept=xintercept), alpha=0.4, linetype=3)+
ylab("Intermutational distance (bp)")+
xlab("Mutation number")+
ggtitle("Mutations for 42 samples\n Note how clusters decrease with chromosome size")

#Produce one plot per sample

#list of samples
rainfallplot(sampledata)


samplelist <- unique(allmutationdist$sample)
source("rainfallplot.R")

Xinterceptlist <- vector("list", 42)
for(i in 1:42){
  #subset whole dataframe for the ith sample from the sample list
  sampledata <- subset(allmutationdist, sample==samplelist[i])
  #calculate x-intercepts:
  Xintercept <- subset(sampledata, intermut.dist==0)[6]
  Xinterceptlist[[i]] <- Xintercept
}

rainfallplotlist <- vector("list", 42)
# sampledata <- vector("list", 42)
# Xintercept <- vector("list", 42)
for(i in 1:42){
  #subset whole dataframe for the ith sample from the sample list
  sampledata <- subset(allmutationdist, sample==samplelist[i])
  rainfallplotlist[[i]] <- rainfallplot(sampledata)
}

source("/home/andreas/suska/work/X_usefulcode/Rfunctions/multiplotfunction.R")

pdf("/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall/individualrainfall.pdf", width=11.7,
    height=8.3)
multiplot(plotlist=rainfallplotlist[1:6], cols=2)
multiplot(plotlist=rainfallplotlist[7:12], cols=2)
multiplot(plotlist=rainfallplotlist[13:18], cols=2)
multiplot(plotlist=rainfallplotlist[19:24], cols=2)
multiplot(plotlist=rainfallplotlist[25:30], cols=2)
multiplot(plotlist=rainfallplotlist[31:36], cols=2)
multiplot(plotlist=rainfallplotlist[37:42], cols=2)
dev.off()
