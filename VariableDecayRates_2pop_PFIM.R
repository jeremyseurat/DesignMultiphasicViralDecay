#####ViralDecay -design eval/optimization PFIM for various decay rates 
##source PFIM file

setwd('C:/Users/Jeremy/Documents/postdoc/DesignProjects/ViralDecay') 
source("PFIMloops/PFIM.r") #load PFIM functions

####EVAL or OPT SIMPLEX / different proportions  and decay rates 

PFIM_EvalOrOpt<-'EVAL' #'EVAL' for design evaluation or 'OPT' for optimization
#########
possible_proportions<-c(0.05,0.25,0.5,0.75,0.95)

possible_decay_rates<-seq(0.02,0.5,0.02)
numberof_errorparams<-1 #assuming a proportionnal error model: 1 error parameter

combination_2decayrates<-combn(possible_decay_rates,2) #all possible combinations with the different decay rates

for (j in 1:length(possible_proportions)){ #loop on initial proportions
proportion_virus1<-possible_proportions[j] #f_a
proportion_virus2<-possible_proportions[length(possible_proportions)-j+1] #f_b

subproject<-paste0(PFIM_EvalOrOpt,'equi0-60_diffc_prop',proportion_virus1,proportion_virus2,'_60d_7t') #name of folder to store result of each run

output_folder<-paste0(getwd(),"/PFIMloops/",subproject) #path of output folder

dir.create(output_folder) 


for (i in 1:ncol(combination_2decayrates)){ #loop on decay rates
   
decayrate_virus1<-combination_2decayrates[1,i] #alpha
decayrate_virus2<-combination_2decayrates[2,i] #beta

#function to call PFIM

##change stdin.R lines 
output_file<-paste0(subproject,"/stdout_cV1-",decayrate_virus1,"_cV2-",decayrate_virus2,".R") #main output file name
output_FIM<-paste0(subproject,"/FIM_cV1-",decayrate_virus1,"_cV2-",decayrate_virus2,".txt") #Fisher information matrix file name
parameter_values<- c(proportion_virus1,decayrate_virus1,proportion_virus2,decayrate_virus2) #vector of parameters

initial_design<-c(0, 10, 20, 30 ,40, 50, 60 ) #initial design or evaluated design (here equispaced)

#in case of optimization

# upper_sampling_time<-ifelse(min(decayrate_virus1,decayrate_virus2)<=0.2,c(60),c(0.2/min(decayrate_virus1,decayrate_virus2)*60)) #can be useful to help simplex optimization
# initial_design<-seq(0,upper_sampling_time,length.out=7) 


#run
try(PFIM()) # try: to continue the loop despite errors due to non invertible fim
# PFIM() #remove try during tests 
}
}
