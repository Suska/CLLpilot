# Dr. Susanne Weller
# 13/06/2014
#################################
#CLL pilot - clinical data merge#
#################################
#
#This is to convert individual data tables from the patient data base into
#a suitable format.

#Change the working directory to where your raw files are (from patient database). Make sure you
#get them with the heading, save them as ".csv".
setwd("/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_clinicaldata")

#read your data tables into r:
patientdata <- read.csv("patientdata.csv", sep="\t", header=TRUE, row.names=NULL)
# Convert dates into date format
#This function converts character date collumns into date columns:
dateconverter <- function(x){as.Date(x, "%d/%m/%Y")}
#This summarizes Patient Death Date:
patientdata$PatienDeathDate <- paste(patientdata$PatientDeathDateDay, "/", patientdata$PatientDeathDateMonth, "/",
                                     patientdata$PatientDeathDateYear, sep="")
#This applies the function to all necessary collumns:
patientdata[,c(2, 4, 5, 10, 11)] <- lapply(patientdata[, c(2, 4, 5, 10, 11)], dateconverter)


#TREATMENT DATA
#This data table is particularly tricky as the drugs are not entered in a uniform wau.
#You might have to go over manually and check if they are spelled correctly.
#As a convention, all drug names begin with a capital letter, drugs that were combined go
#in two separate columns (TreatmentName2)!

#ORDERING BY TREATMENT DATE
#First, you have to load your original data file and sort treatments by date:
treatmentdata <- read.table("treatmentdata.csv", header=TRUE, sep="\t")
#Then you convert date columns to the date format using the function above:
treatmentdata[,c(2, 5, 6, 7)] <- lapply(treatmentdata[,c(2, 5, 6, 7)], dateconverter)
#Order the columns according to treatment date
treatmentdata <- treatmentdata[order(treatmentdata$SampleIdentifierIllumina, treatmentdata$TreatmentCancerTreatmentStartDate),]
row.names(treatmentdata) <- NULL

treatmentdata[,c(2, 5, 6, 7)] <- lapply(treatmentdata[,c(2, 5, 6, 7)], as.character)
write.csv(treatmentdata, "treatmentdata_sorted.csv", row.names=FALSE, quote=FALSE)

#This line relys on the python skript CLLpilot_treatmentnumbers.py!
system("python CLLpilot_treatmentnumbers.py")


treatmentdata <- read.table("out_treatmentdata.txt", sep="\t", header=FALSE, strip.white = TRUE)
colnames(treatmentdata) <- c("SampleIdentifierIllumina", "SampleTakenDate", "TreatmentName", "TreatmentName2", "TreatmentCancerTreatmentStartDate", "TreatmentEndDate",
                            "TreatmentProgressionDate", "TreatmentProgressionFreeSurvival", "TreatmentResponse", "Refractorytofludarabine", "TreatmentNumber")
treatmentdata$TreatmentNumber <- as.factor(treatmentdata$TreatmentNumber)

#You need to install ggplot2 to display these results:
library(ggplot2)
ggplot(data=treatmentdata)+geom_bar(aes(x=TreatmentNumber, fill=TreatmentName))+facet_grid(.~Refractorytofludarabine)

