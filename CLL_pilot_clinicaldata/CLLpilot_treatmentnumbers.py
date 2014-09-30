# Dr. Susanne Weller, 04/09/2014

filename = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_clinicaldata/treatmentdata_sorted.csv"
out_treatmentdata = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_clinicaldata/out_treatmentdata.txt"
output = open(out_treatmentdata, "w")

with open(filename, 'rU') as treatmentdata:
        
        firstrow = True
        lasttreatmentcount = 0
        lastSample = "SS2001401" #Taken from the first line in the file.This is necessary to compare the next row with it!
        lastTreatmentDate = "2010-05-21"
        for row in treatmentdata:
                
                if firstrow:
                        firstrow = False
                        continue #goes back to beginning of iteration    
            
                f = row.split(",")
                f[9] = f[9].rstrip('\n')
                
                #Variable definition
                Sample = f[0]
                SampleTakenDate = f[1]
                TreatmentName = f[2]
                TreatmentName2 = f[3]
                TreatmentDate = f[4]
                
                #TREATMENT COUNT
                #Are we looking at the same sample than the last row?
                if lastSample == Sample:
                        #Are we looking at the same treatment date?
                        if TreatmentDate == lastTreatmentDate:
                                treatmentcount = lasttreatmentcount
                        else:
                                treatmentcount = lasttreatmentcount+1        
                else: 
                        treatmentcount = 1
                
                
                #APPEND TREATMENT NAME AND DATE
                
                treatmentcount_res=str(treatmentcount)+"\n"
                f.append(treatmentcount_res)

                resultrow = [str(x) for x in f]
                resultrow = "\t".join(f)
                output.write(resultrow)
#           
            #this is the memory for the next round:
                lasttreatmentcount=treatmentcount
                lastSample = f[0]
                lastTreatmentDate = TreatmentDate
    
output.close()          
