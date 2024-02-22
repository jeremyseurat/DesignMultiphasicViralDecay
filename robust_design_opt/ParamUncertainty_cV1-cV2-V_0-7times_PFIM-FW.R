###########Robustdesign optimization - PARAM UNCERTAINTY###############

source("C:/Users/Jeremy/Documents/postdoc/DesignProjects/ViralDecay/RobustDesign/HClnD/PFIM.r")

working_folder<-"C:/Users/Jeremy/Documents/postdoc/DesignProjects/ViralDecay/RobustDesign/HClnD/3params/"

PFIM_EvalOrOpt<-'OPT'

#Number of parameter scenarios m (if 5th and 95th perc investigated) = 2^q with q number of param with uncertainty 
#HClnD = sum[i=1_to_m]  ( (1/m*q) * ln (det(FIM)))

#######Parameters
parameters_with_uncertainties<-3

#setup the percentiles that you want to investigate
quartiles_virus1<-c(0.068,0.19025) #for alpha
percentiles_virus1<-c(0.05,0.95) #for f_a, with f_b=1-f_a
percentiles_decayrate2<-c(0.037,0.3475) #for beta

#build hypercube of parameters
possible_parameter_vectors<- data.frame()
for (i in 1:length(percentiles_virus1)){
  for (j in 1:length(percentiles_decayrate2)){
    for (k in 1:length(quartiles_virus1))
    possible_parameter_vectors<-rbind(possible_parameter_vectors,c(percentiles_virus1[i], quartiles_virus1[k], 1-percentiles_virus1[i] ,percentiles_decayrate2[j]))                                    
}
}
nb_errorparams<-1 #proportional error: only 1 error parameter
NumberOfParameters<-ncol(possible_parameter_vectors)+nb_errorparams 
matelines_perdesign<-NumberOfParameters+3 #will be used to ease read an output file 

#######Design
MaxDuration<-60
NumberOfSamplingTimes<-7

optimizer<-'FW' #to make all the combination and produce the matelem file containing all FIMs
allowed_times<-c(seq(0,5,1),seq(6,10,2),13,16,seq(20,40,4),45,50,60) #possible sampling times
initial_design<-c(0,10,20,28,40,50,60) #take one initial design among all the possible designs

fixed_times<-c(0) #a sampling time at time=0 day will be in all possible designs
NumberOfDesigns<-ncol(combn(length(allowed_times)-length(fixed_times),NumberOfSamplingTimes-length(fixed_times)))
NumberOfDesigns #check this number (it will be the number of evaluated designs, if very big for instance > 1e6, it will be time-consuming)

#######PFIM runs
for (j in 1:nrow(possible_parameter_vectors)){

parameter_values<-as.matrix(unname(possible_parameter_vectors))[j,]
#naming and storing outputs
subproject<-paste0(PFIM_EvalOrOpt,'_Robust_V1_0_',parameter_values[1],'cV1_',parameter_values[2],'cV2_',parameter_values[4],'_60d_7t')
output_folder<-paste0(working_folder,subproject)

dir.create(output_folder)

output_file<-paste0(subproject,"/stdout_Robust_V1_0_",parameter_values[1],'cV1_',parameter_values[2],"cV2_",parameter_values[4],".R")
output_FIM<-paste0(subproject,"/FIM_Robust_V1_0_",parameter_values[1],'cV1_',parameter_values[2],"cV2_",parameter_values[4],".txt")

PFIM()
file.copy(paste0(working_folder,"matelem.tmp"), output_folder, overwrite = T) #matelem file to be stored in each corresponding folder

}

require(data.table) #install this package before require

df_FIMs<-data.frame()

#######Reading and managing matelem
for  (j in 1:nrow(possible_parameter_vectors)){
  print(j)
  parameter_values<-as.matrix(unname(possible_parameter_vectors))[j,]

  subproject<-paste0(PFIM_EvalOrOpt,'_Robust_V1_0_',parameter_values[1],'cV1_',parameter_values[2],"cV2_",parameter_values[4],'_60d_7t')
  output_folder<-paste0(working_folder,subproject)
  
matelem_raw<-readLines(paste0(output_folder,'/matelem.tmp'))

#looping on all protocols
for (design_i in 1:NumberOfDesigns){
 
  protocol_index<-as.numeric(matelem_raw[1+((design_i-1)*matelines_perdesign)])
  sampling_times<-as.numeric(strsplit(matelem_raw[3+((design_i-1)*matelines_perdesign)], " ")[[1]])
  FIM_vector<-as.numeric(unlist(strsplit(matelem_raw[4:matelines_perdesign+((design_i-1)*matelines_perdesign)], " ")))
  FIM<-matrix(FIM_vector,ncol=NumberOfParameters) #isolate the FIM of this design, and for this parameter vector
  logdetFIM<-log(det(FIM))
  
  df_FIMs<-rbindlist(list(df_FIMs,as.list(c(j,protocol_index,sampling_times,FIM_vector,logdetFIM)))) #store all the important FIMs element in a global data frame
  
  if (design_i %% 1000 == 0) print(design_i) #just to check if the loop works
}
assign(paste0('df_FIMs_',j),df_FIMs)
df_FIMs<-data.frame()
}
#grep call and bind dfFims
Pattern_dfFIMs<-grep("df_FIMs_",names(.GlobalEnv),value=TRUE)
df_FIMs<-rbindlist(do.call("list",mget(Pattern_dfFIMs)))


colnames(df_FIMs)<-c("combin_index","protocol_index",paste0("t",1:NumberOfSamplingTimes),paste0("FIMelem",1:(NumberOfParameters**2)),'lndetFIM')
head(df_FIMs);tail(df_FIMs) #check if the management of results is going well

###weighted sum by protocol
df_criterion<-data.frame()
for (design_i in 1:NumberOfDesigns){
sampling_times<-as.numeric(strsplit(matelem_raw[3+((design_i-1)*matelines_perdesign)], " ")[[1]])
lndetFIMs_vector<-df_FIMs[df_FIMs$protocol_index==design_i,]$lndetFIM
HClnD<-sum((1/(nrow(possible_parameter_vectors)*NumberOfParameters))*lndetFIMs_vector) #calculate robust criterion
df_criterion<-rbindlist(list(df_criterion,as.list(c(design_i,sampling_times,HClnD))))
}
colnames(df_criterion)<-c("protocol_index",paste0("t",1:NumberOfSamplingTimes),'HClnD')
which.max(df_criterion$HClnD)
as.numeric(strsplit(matelem_raw[3+((which.max(df_criterion$HClnD)-1)*matelines_perdesign)], " ")[[1]]) #give the robust design (higher HClnD)
#This design can be evaluated with different parameter values using the other R file for evaluation or simplex optimization

####Save
save(list = ls(all.names = TRUE), file = paste0(working_folder,"Robust_ThreeParams.RData"), envir = .GlobalEnv) #recommended to save all the Rdata

# load( file = paste0(working_folder,"Robust_TwoParams.RData"), envir = .GlobalEnv)

