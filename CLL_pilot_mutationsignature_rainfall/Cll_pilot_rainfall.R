#Dr. Susanne Weller
#22/07/2014
#
########################################################################
#CLL pilot - mutation signatures - RAINFALL PLOT - TEST with one sample#
########################################################################

#This plot investigates if specific mutations are clustered within the genome
#Input file is a substracted vcf

#read file
setwd("/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall")
allmutations <- read.table("all_samples_CLL_A1_VC1_VF01_S42.tsv", header=TRUE, sep="\t")
#select one sample as test object
mutCLL003 <- subset(allmutations, sample=="Gemini2a-Gemini2b_sox")

#pad chromosome numbers

library(stringr)
padding <- function(x){
  if (nchar(x)==5){
  return(x)
  }
  else{
    chromnumber <- str_sub(x, -1)
    newchrom <- paste("chr0", chromnumber, sep="")
    return(newchrom)
  }
} 
mutCLL003$chrom <- as.character(mutCLL003$chrom)
mutCLL003$chrom <- sapply(mutCLL003$chrom, padding)

mutCLL003 <- mutCLL003[order(mutCLL003$chrom, mutCLL003$pos),]
write.csv(mutCLL003, "mutCLL003.tsv", quote=FALSE, sep="\t", row.names=FALSE)

#This python script calculates the intermutational distances within the chromosomes
system("python rainfallprep.py")

mutCLL003dist <- read.table("out_mutCLL003.txt")
colnames(mutCLL003dist) <- c("sample", "chromosome", "position", "ref", "alt",
                             "mut.number", "intermut.dist", "mut.type")
#This function aggregates matching mutation types:
muttypecorrection <- function(x){
  if(x=="GT"){
    return("CA")
  }
  if(x=="GC"){
    return("CG")
  }
  if(x=="GA"){
    return("CT")  
  }
  if(x=="TA"){
   return("AT") 
  }
  if(x=="TC"){
    return("AG")
  }
  if(x=="TG"){
    return("AC")
  }
  else{
    return(x)
  }
}
mutCLL003dist$mut.type <- as.character(mutCLL003dist$mut.type)
mutCLL003dist$mut.type2 <- sapply(mutCLL003dist$mut.type, muttypecorrection) 
library(ggplot2)
library(scales)
#calculate x-intercepts:
theme_set(theme_bw())
xintercept <- subset(mutCLL003dist, intermut.dist==0)
xintercept <- xintercept$mut.number
ggplot()+geom_point(data=mutCLL003dist,aes(x=mut.number, y=intermut.dist, col=mut.type2), size=4)+
scale_colour_manual(values=c("purple", "yellow", "green", "blue", "black", "red"))+
scale_y_reverse()+
scale_y_log10(labels=comma)+
geom_vline(aes(xintercept=xintercept), alpha=0.4, linetype=3)+
ylab("Intermutational distance (bp)")+
xlab("Mutation number")
