#Dr. Susanne Weller
#18/09/2014

#Rainfall plot

#Input: data frame with intermutational distance, mutation number, mutation type

rainfallplot_sequ <- function(dataframe){
  library(ggplot2)
  library(scales)
  theme_set(theme_bw())
  
  #get sample name
  samplename <- unique(dataframe$sample_plot)
  
  #calculate x-intercepts:
  xinterceptdata <- subset(dataframe, intermut.dist==0)
  
 
  #produce plot
  rainfall <- ggplot()+
    geom_point(data=dataframe, aes(x=mut.number, y=intermut.dist, col=mut.type), size=3)+
    scale_colour_manual(values=c("purple", "yellow", "green", "blue", "black", "red"))+
    scale_y_log10(labels=comma)+
    geom_vline(data=xinterceptdata, aes(xintercept=mut.number), alpha=0.4, linetype=3)+
    ylab("Intermutational distance (bp)")+
    xlab("Mutation number")+
    ggtitle(paste("Sample: ", samplename))

return(rainfall)
}

