# Dr. Susanne Weller, 18/09/2014

#This script calculates intermutational distances from substracted vcf file that contains several samples

filename = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall/allsnvs.csv"
out_rainfallprep = "/home/andreas/suska/work/02_CLLpilot/CLLpilot/trunk/CLL_pilot_mutationsignature_rainfall/out_allmutations.txt"
output = open(out_rainfallprep, "w")

with open(filename, 'rU') as rainfallprep:
        
        #next(rainfallprep) #ommits header
        lastposition = 0 # end coordinate for the first line
        lastchrom = "1" # start chromosome for the first line (string)
        count = 0 #start counter
        lastmutnumber = 0 #start mutationnumber at 0
        lastsample = "Gemini2a_D" # this is the first sample
        lasttumor = 1
        firstrow = True
        
        for row in rainfallprep:
        
                if firstrow:
                        firstrow = False
                        continue #goes back to beginning of iteration
                #split data frame into columns and omit all irrelevant columns:
                f = row.split(",")
                
            
                #variable definition
                sample = f[0]
                tumor = f[1]
                chrom = f[3]
                position = int(f[4])
                variant = f[2]
                
                ref = variant[2]
                alt = variant[4]
                mutnumber = lastmutnumber
                
                #Is it the same sample AND same tumor number?
                #Yes, same sample and same tumor number- add 1 to mutation number
                if sample == lastsample and tumor == lasttumor:
                        mutnumber = lastmutnumber+1
                #No, other sample, set mutation number back to 0:
                else:
                        mutnumber = 0
                #print mutnumber
                f.append(str(mutnumber))
                
                #Is it on the same chromosome?              
                if lastchrom == chrom: 
                        intermutdistance = position-lastposition
                        
                else:
                        intermutdistance=0
                f.append(str(intermutdistance))        
                #print intermutdistance
            
             #This pastes reference and alternative allele together for colouring different types of mutations:
                muttype_proto = str(ref+alt)
                
                if muttype_proto == "TG":
                        muttype="AC"
                else:
                        if muttype_proto == "TC":
                                muttype="AG"
                        else:
                                if muttype_proto == "TA":
                                        muttype="AT"
                                else:
                                        if muttype_proto == "GT":
                                                muttype="CA"
                                        else:
                                                if muttype_proto == "GC":
                                                        muttype="CG"
                                                else:
                                                        if muttype_proto == "GA":
                                                                muttype="CT"
                                                        else:
                                                                muttype=muttype_proto

                f.append(muttype)
        #remove whitespace after "snv"
                f[5]=f[5].rstrip("\n")    
                resultrow = [str(x) for x in f]
                resultrow = "\t".join(f)
                output.write(resultrow+"\n")
           
            #This is the memory for the next round:
                lastsample = sample # memorize current sample for the next row
                lasttumor = tumor
                lastmutnumber = mutnumber
                lastchrom = chrom # memorize current chromosome for the next row
                lastposition = position # memorize current position for the next row
                count +=1 #set counter to next row   
output.close()          
