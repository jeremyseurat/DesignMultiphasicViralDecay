#########################################################################
##					        		                                               ##
##				            INPUT FILE FOR PFIM 4.0                          ##
#########################################################################


#Name of the project
#--------------------
project<-"viraldecay"

#Name of the file containing the PK or PD model
#----------------------------------------------
file.model<-"model_2cp_Macro_bis.R"

#Name of the output file for the results and for the Fisher information matrix
#---------------------------------------
output<-"Stdout_dryad_D_9pts_2cp_opt.r";
outputFIM<-"FIM_dryad_D_9pts_2cp_opt.txt";

#FIM: Population (P) or Individual (I) or Bayesian (B) Fisher information matrix
#---------------------------------------
FIM<-"I"

#Previous information for population design (FIM<-"P") only:
#If previous information is available, please specify below the file name;
#otherwise leave it as the default
#--------------------------------------------------------
previous.FIM<-""

#RUN:  Evaluation (EVAL) or Optimisation (OPT)
#-------------------------------------------------------
run<-"OPT"

#To display only  graphs of models and/or sensitivity functions before computing the Fisher Information matrix
graph.only<-F

#Block diagonal Fisher information matrix (option<-1) or complete Fisher information matrix (option<-2)
#----------------------------------------------------------
option<-1

#Number of responses
#--------------------------------------------------------------------
nr<-1



################### MODEL OPTION ###########################

#Model form: Differential equations (DE) or analytical form (AF)
#---------------------------------------------------------------

modelform<-"AF"

###### ANALYTICAL MODEL OPTION #############################
############################################################

#Identical dose in each elementary design (Yes=T, No=F)
#-------------------------------------------------------------
dose.identical<-T

# If 'Yes', enter the value of the dose,
# else, enter the vector of the dose values for each elementary design
#--------------------------------------------------------------------
dose<-c(1)

#Vector of the times intervals of each expression
#-----------------------------------------------------------
boundA<-list(c(0,Inf))

#Numerical derivatives  (Yes=T, No=F)
#If 'Yes', specify the model function "form" in the model file
#If 'No', specify the object "form" which is a vector of expressions in the model file
#-----------------------------------------------------------
NUM<-T
# NUM<-F if DE?
###### END ANALYTICAL MODEL OPTION ########################



###### DIFFERENTIAL EQUATION OPTION ##########################
##############################################################

#Initial time for which initial conditions are given
#---------------------------------------------------
time.condinit<-0

#Identical initial conditions in each elementary design (Yes=T, No=F)
#-------------------------------------------------------------
condinit.identical<-T

# If 'Yes', enter once the expression of the initial values of the system at the initial time
# else, enter the vectors of the initial conditions for each elementary design
# If initial values depend on the parameters to be estimated,
# enter this parameter into the expression without any quotation marks
#---------------------------------------------------------
condinit<-expression(c(V0))

# Error tolerance for solving differential equations
#----------------------------------------------------

RtolEQ<-1e-08
AtolEQ<-1e-08
Hmax<-Inf

###### END DIFFERENTIAL EQUATION OPTION #################################



#Name of the fixed effects parameters
#-------------------------------------
parameters<-c("A","alpha","B","beta")

#Fixed effects parameters values
#-------------------------------
beta<-c(6460,0.18,31540,39)

#Some parameters may not be estimated (not estimated = T, estimated = F)
#--------------------------------
beta.fixed<-c(F,F,F,F)

#Number of occasions
#--------------------------------------------------------------------------
n_occ<-1

#Random effect model (1) = additive  (2) = exponential
#------------------------------------------------------------------
Trand<-2;

#Diagonal Matrix of variance for inter-subject random effects:
#---------------------------------------------------
omega<-diag(c(0,0,0,0))

#Diagonal Matrix of variance for inter-occasion random effects:
#---------------------------------------------------
gamma<-diag(c(0,0,0,0))

#Standard deviation of residual error (sig.inter+sig.slope*f)^2:
#------------------------------------------------------------------
sig.interA<-0
sig.slopeA<-0.1


#List of the vectors of sampling times for each elementary design
#You can specify that a group has no sampling time by writing NULL
#(ONLY if you have several response)
#-----------------------------------------------------------------
protA<-list(c( 0.00 ,0.04, 0.12 ,0.17, 0.33,0.67, 1,2,3))
# protA<-list(c(0,0.2,0.4,0.64,0.88,1.12,1.36,1<.48,1.7,2))


#Vector of initial proportions or numbers of subjects for each elementary design
#--------------------------------------------------------------
subjects<-c(1)

#Subjects input: (1) for number of subjects (2) for proportions of subjects
#---------------------------------------------------------------------------
subjects.input<-1

#If 'proportions of subjects' give the total number of samples
#-------------------------------------------------------------
#Ntot<-40

###################################################################
#                                                                 #
#                        Covariate model                          #
#                                                                 #
###################################################################

##########################################
# Covariates not changing with occasion  # 
##########################################

#Add covariate to the model  (Yes==T No==F)
#---------------------------------------------------------------------------
covariate.model<-F

#Vector of covariates
#---------------------------------------------------------------------
covariate.name<-list(c("Sex"))

#Categories for each covariate (the first category is the reference)
#-----------------------------------------------------------------------
covariate.category<-list(Sex=c("M","F"))

#Proportions of subjects in each category
#-------------------------------------------------------------------------
covariate.proportions<-list(Sex=c(0.5,0.5))

#Parameter(s) associated with each covariate
#-------------------------------------------------------------------------
parameter.associated<-list(Sex=c("V"))

# Values of covariate parameters in covariate model 
# (values of parameters for all other categories than the reference category (for which beta=0) 
# covariate is additive on parameter if additive random effect model (Trand=1)
# covariate is additive on log parameters if exponential random effect model (Trand=2)
#-----------------------------------------------------------------------
beta.covariate<-list(Sex=list(c(log(1.5))))



#####################################
#Covariates changing with occasion  # 
#####################################


#Add covariate to the model   (Yes==T No==F)
#---------------------------------------------------------------------------
covariate_occ.model<-F

#Vector of covariates depending on the occasion
#---------------------------------------------------------------------
covariate_occ.name<-list(  c("Treat") )

#Categories for each covariate (the first category is the reference)
#-----------------------------------------------------------------------
covariate_occ.category<-list(  Treat=c("A","B") )

#Sequences of values of covariates at each occasion 
#Specify as many values in each sequence as number of occasions (n_occ) for each covariate
#-------------------------------------------------------------------------------------------------------

covariate_occ.sequence<-list(  Treat=list(c("A","B"),c("B","A"))  )

#Proportions of elementary designs corresponding to each sequence of covariate values
#Specify as many values of proportion as number of sequences defined in covariate_occ.sequence for each covariate
#-----------------------------------------------------------------------------------------------------------------
covariate_occ.proportions<-list(  Treat=c(0.5,0.5)  )

#Parameter(s) associated with each covariate
#-------------------------------------------------------------------------
parameter_occ.associated<-list(  Treat=c("Cl")  )

# Values of covariate parameters in covariate model 
# (values of parameters for all other categories than the reference category (for which beta=0) 
# covariate is additive on parameter if additive random effect model (Trand=1)
# covariate is additive on log parameters if exponential random effect model (Trand=2)
#-----------------------------------------------------------------------
beta.covariate_occ<-list(  Treat=list(c(log(1.5)))  )


#############################################
# Power and number of subjects              #
#############################################

#Type one error alpha 
#-----------------------------------------------------------------------------
alpha<-0.05

#Compute expected power for comparison test (Yes=T, No=F)
#---------------------------------------------------------------------------
compute.power<-F

#Compute the number of subjects needed for a given power for comparison test(Yes=T, No=F)
#----------------------------------------------------------------------------
compute.nni<-F

#Equivalence interval
interval_eq<-c(log(0.8),log(1.25))

#Compute expected power for equivalence test (Yes=T, No=F)
#---------------------------------------------------------------------------
compute.power_eq<-F

#Compute the number of subjects needed for a given power for equivalence test (Yes=T, No=F)
#----------------------------------------------------------------------------
compute.nni_eq<-F

#Set value the given power
#---------------------------------------------------------------------------
given.power<-0.9



############ONLY FOR OPTIMISATION ###############################

#Identical sampling times for each response
# (only if you do not have sampling times==NULL)
#-------------------------------------------------------------------------------------
identical.times<-T

######## OPTIMISATION ALGORITHM OPTION ###############

#Character string for choice of the optimisation algorithm: 
#	"FW" for the Fedorov-Wynn algorithm 
#	"SIMP" for the Simplex algorithm
#------------------------------------------

algo.option<-"FW"


########################
#SIMPLEX SPECIFICATION #
########################

#Optimisation of the proportions of subjects: (Yes=T, No=F)
#--------------------------------------------------------------

subjects.opt<-T

#Vector of lower and upper admissible sampling times
#---------------------------------------------------


lowerA<-c(0) 
upperA<-c(3)

#lowerB<-c(0)
#upperB<-c(24)

#Minimum delay between two sampling times
#-------------------------------------------

delta.time<-0.04

#Print iteration step (Yes=T, No=F)
#---------------------------------

iter.print<-T


#Parameter for initial simplex building (%)
#------------------------------------------

simplex.parameter<-20


#Maximum iteration number
#------------------------

Max.iter<-5000


#Relative convergence tolerance
#------------------------------ 
Rctol<-1e-6



#############################
#FEDOROV-WYNN SPECIFICATION #
#############################


#Number of sampling windows
#--------------------------
nwindA<-1
# nwindB<-1


#List of vector of the allowed sampling times for each sampling window
#--------------------------------------------------------------------

sampwinA<-list(c(0, 0.04, 0.08, 0.12, 0.17, 0.21, 0.25, 0.29,
                 0.33, 0.67, 0.71, 0.75, 0.79, 0.83, 0.88, 0.92, 0.96, 1, 2, 3))
# sampwinB<-list(c(0, 0.5, 1, 2, 6, 9, 12, 24, 36, 48, 72, 96, 120))


#Fixed times (times which will be in all evaluated protocols, corresponding to fixed constraints)
#--------------------------------------------------------------------
fixed.timesA<-c(0,1,2,3)
# fixed.timesB<-c()


#List of vector of allowed number of points to be taken from each sampling window
#------------------------------------------------------------------------------

nsampA<-list(c(9))
# nsampB<-list(c(5))

#Maximum total number of sampling times per subject
#--------------------------------------------------

nmaxptsA<-9
# nmaxptsB<-5

#Minimum total number of sampling times per subject
#--------------------------------------------------

nminptsA<-9
# nminptsB<-5
############# END OF OPTIMISATION ALGORITHM OPTION ###############






############## GRAPH SPECIFICATION OPTION ###############

#graphical representation of the model (Yes=T, No=F)
#-------------------------------------
graph.logical<-T

#graphical representation of sensitivity functions (Yes=T, No=F)
#-------------------------------------
graphsensi.logical<-F


#Vector of Names on X axes for each response
#---------------------------------
names.datax<-c("Time")

#Vector of Names on Y axes for each response
#---------------------------------
names.datay<-c("V")

#Controls logarithmic axes for the graphical representation of the model
#Values "xy", "x", or "y" produce log-log or log-x or log-y axes.
#(For standard graphic, log.logical<-F)
#--------------------------------------------------------------
log.logical<-'y'
#log.logical<-'y'

#Vector of lower and upper sampling times for the graphical representations
#-------------------------------------------------------------------------
graph.infA<-c(0)
graph.supA<-c(3)

#Vector of lower and upper concentration for the graphical representations
#------------------------------------------------------------------------
y.rangeA<-NULL # default range
#y.rangeA<-c(1,10)

############# END OF GRAPH SPECIFICATION OPTION ###############



