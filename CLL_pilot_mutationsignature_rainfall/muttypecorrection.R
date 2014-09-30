#Dr. Susanne Weller
#23/07/2014

#This function aggregates matching mutation types (in VCF files)
muttypecorrection <- function(x){
  x <- as.character(x)
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