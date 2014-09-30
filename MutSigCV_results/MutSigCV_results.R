# Dr. Susanne Weller
# 09/06/2014

siggenes <- read.table("/home/suska/work/02_CLLpilot/CLLpilot/trunk/MutSigCV_results/CLL_A1_VC1_VF02_S42_mutsigcv.sig_genes.txt", header=TRUE, sep="\t")

subsiggenes <- subset(siggenes, p<1)
library(ggplot2)

pdf("/home/suska/work/02_CLLpilot/CLLpilot/trunk/MutSigCV_results/MutSigCV_overview.pdf",  width=15, height=8.5)
#Overview plot over pvalues
ggplot(subsiggenes, aes(x=reorder(subsiggenes$gene, subsiggenes$p) ,y=p))+
  geom_point(col="darkblue")

#cutoff 0.1 with corrected p-values
subsiggenes_01<- subset(siggenes, p<0.1)
ggplot(subsiggenes_01, aes(x=reorder(subsiggenes_01$gene, subsiggenes_01$p), y=p))+
  geom_point(col="darkblue")+
  geom_point(y=subsiggenes_01$q, col="darkred")+
  ylim(0, 1)+
  theme(axis.text.x=element_text(angle=90))+
  xlab("Gene")

#cutoff 0.2 with corrected p-values
subsiggenes_02 <- subset(siggenes, p<0.2)
ggplot(subsiggenes_02, aes(x=reorder(subsiggenes_02$gene, subsiggenes_02$p), y=p))+
  geom_point(col="darkblue")+
  geom_point(y=subsiggenes_02$q, col="darkred")+
  ylim(0, 1)+
  theme(axis.text.x=element_text(angle=90))+
  xlab("Gene")+
  ggtitle("P-values from MutSigCV, cutoff=0.2")+
  geom_point(data=subset(siggenes, gene=="TP53"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="ATM"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="BIRC3"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="SF3B1"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="BRF1"), aes(x=gene, y=p), colour="purple", size=5)

#cutoff 0.2 without corrected p-values and with genes highlighted
ggplot(subsiggenes_02, aes(x=reorder(subsiggenes_02$gene, subsiggenes_02$p), y=p))+
  geom_point(col="darkblue")+
  geom_point(y=subsiggenes_02$q, col="darkred")+
  ylim(0, 0.22)+
  theme(axis.text.x=element_text(angle=90))+
  xlab("Gene")+
  ggtitle("P-values from MutSigCV, cutoff=0.2")+
  geom_point(data=subset(siggenes, gene=="TP53"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="ATM"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="BIRC3"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="SF3B1"), aes(x=gene, y=p), colour="purple", size=5)+
  geom_point(data=subset(siggenes, gene=="BRF1"), aes(x=gene, y=p), colour="purple", size=5)
 
dev.off()
