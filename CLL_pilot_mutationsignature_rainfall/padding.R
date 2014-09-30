#Dr. Susanne Weller
#22/07/2014

#This function pads chromosome number from vcf files
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