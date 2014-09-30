#Dr. Susanne Weller
#31/07/2014
#Multiple univariate analysis

#This function takes in one factor as predictor and one response variable and computes the p-value
univariate.pvalue <- function(factorpredictor, responsevariable, data) {
    
  #Chi-square test for factor variables
if (class(responsevariable) == "factor"){
  table <-table(responsevariable, factorpredictor)
  
  fisher <- fisher.test(table)
  pvalue <- fisher$p.value
  return(pvalue)
  return(table)
}
else{ 
  #Wilcoxon test for continuous variables
  wil <-wilcox.test(responsevariable ~ factorpredictor, data=data)
  pvalue <- wil$p.value
  return(pvalue)
}
}

#This is the same function for our special data set (CLLuni):

univariate.pvalue.CLLuni <- function(predictorvariable) {
  
  #Fischers Exact test for factor variables
  if (class(predictorvariable) == "factor"){
    
    wil <-wilcox.test(CLLuni$Overall_Survival_Days ~ predictorvariable, data=CLLuni, na.action=na.omit)
    pvalue <- wil$p.value
    return(pvalue)
  
  }
  if (class(predictorvariable)== "integer"){
    #Wilcoxon test for continuous variables
    cor <-cor.test(predictorvariable, CLLuni$Overall_Survival_Days, data=CLLuni)
    pvalue <- cor$p.value
    return(pvalue)
  }
}

#This function just returns the test that was used:

univariate.testused <- function(responsevariable) {

  if (class(responsevariable) == "factor"){
    return("Fisher's Exact Test")
  }
  else{ 
    return("Wilcoxon Test")
  }
}
#This function returns the significance level:
significance <- function(pvalue){
  if(pvalue <=  0.05 & pvalue > 0.01){
    return("*")
  }
  if(pvalue <= 0.01 & pvalue > 0.001){
    return("**")
  }
  if(pvalue <= 0.001){
    return("***")
  }
  if(pvalue <= 0.1 & pvalue > 0.05){
    return("trend")
  }
  else{
    return("n.s.")
  }
}

#These functions return number of observations in each class
#for genclinv6
#MRD neg and 0
univariate.n.MRDneg.0 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, genclinv6$MRD) 
    return(table[1])
  }
  else{ 
    return("NA")
  }
}
#MRD pos and 0
univariate.n.MRDpos.0 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, genclinv6$MRD) 
    return(table[3])
  }
  else{ 
    return("NA")
  }
}
#MRD neg and 1
univariate.n.MRDneg.1 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, genclinv6$MRD) 
    return(table[2])
  }
  else{ 
    return("NA")
  }
}
#MRD neg and 1
univariate.n.MRDpos.1 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, genclinv6$MRD) 
    return(table[4])
  }
  else{ 
    return("NA")
  }
}
#These functions return number of observations in each class
#for model.genclinv6
#MRD neg and 0
model.univariate.n.MRDneg.0 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, model.genclinv6$MRD) 
    return(table[1])
  }
  else{ 
    return("NA")
  }
}
#MRD pos and 0
model.univariate.n.MRDpos.0 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, model.genclinv6$MRD) 
    return(table[3])
  }
  else{ 
    return("NA")
  }
}
#MRD neg and 1
model.univariate.n.MRDneg.1 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, model.genclinv6$MRD) 
    return(table[2])
  }
  else{ 
    return("NA")
  }
}
#MRD neg and 1
model.univariate.n.MRDpos.1 <- function(responsevariable) {
  #Fischers Exact test for factor variables
  if (class(responsevariable) == "factor"){
    table <-table(responsevariable, model.genclinv6$MRD) 
    return(table[4])
  }
  else{ 
    return("NA")
  }
}