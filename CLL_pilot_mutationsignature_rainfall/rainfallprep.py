# Dr. Susanne Weller, 23/07/2014

#This script calculates intermutational distances from substracted vcf file that contains several samples

filename = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall/allmutations.tsv"
out_rainfallprep = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall/out_allmutations.txt"
output = open(out_rainfallprep, "w")

with open(filename, 'rU') as rainfallprep:
        
        #next(rainfallprep) #ommits header
        lastposition = 0 # end coordinate for the first line
        lastchrom = "0" # start chromosome for the first line (string)
        count = 0 #start counter
        lastmutnumber = 0 #start mutationnumber at 0
        lastsample = "Gemini2a-Gemini2b_sox" # this is the first sample
        firstrow = True
        
        for row in rainfallprep:
        
                if firstrow:
                        firstrow = False
                        continue #goes back to beginning of iteration
                #split data frame into columns and omit all irrelevant columns:
                f = row.split(",")
                f = f[:5]
            
                #variable definition
                sample=f[0]
                chrom=f[1]
                position=int(f[2])
                ref=f[3]
                alt=f[4]
                mutnumber=lastmutnumber
                
                #Is it the same sample?
                #Yes, same sample - add 1 to mutation number
                if sample == lastsample:
                        mutnumber=lastmutnumber+1
                #No, other sample, set mutation number back to 0:
                else:
                        mutnumber=0
                f.append(str(mutnumber))
                
                #Is it on the same chromosome?              
                if lastchrom == chrom: 
                        intermutdistance = position-lastposition
                        f.append(str(intermutdistance))
                else:
                        f.append("0")
             
             #This pastes reference and alternative allele together for colouring different types of mutations:
                muttype = str(ref+alt)
                f.append(muttype)

                resultrow = [str(x) for x in f]
                resultrow = "\t".join(f[0:8])
                output.write(resultrow + "\n")
           
            #This is the memory for the next round:
                lastsample = f[0] # memorize current sample for the next row
                lastmutnumber = mutnumber
                lastchrom = f[1] # memorize current chromosome for the next row
                lastposition = int(f[2]) # memorize current position for the next row
                count +=1 #set counter to next row   
output.close()          
