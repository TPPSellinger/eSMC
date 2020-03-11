###################
# Source function #
###################
library(eSMC)

##############
# Parameters # 
##############

# Please Fill all value

mu=4.33*10^(-9)   # Mutation rate per position per generation 
r=8*10^(-8)   # recombination rate per position per generation 
rho=r/mu # ratio recombination/mutation 
M=2 # Number of haplotypes
  ###################################
# Set one to TRUE (rest to FALSE) #
###################################
ER=F # True to estimate recombination rate
SF=F # True to estimate selfing rate
SB=T # True to estimate germination rate
  
  
# Set boundaries
  
BoxB=c(0.05,1) #  min and max value of germination rate 
Boxs=c(0,0.99) #  min and max value of selfing rate 

############
# Get data #
############

# example 
NC=19 # Number of analysed scaffold
full_data=list()
# We build the data of the 19 scaffold
path="~/Documents/eSMC-master/Daphnia_p_SRR5004865" # Put character string of path to the multihetsep file
for(scaffold in 1:19){
  if(scaffold>=10){
    scaffold_n=as.character(scaffold)
  }else{
    scaffold_n=paste("0",as.character(scaffold),sep="")
  }
  filename=paste("SRR5004865.FLTH010000",scaffold_n,".multihetsep.txt",sep="") # Put character string of the multihetsep file name
  data=Get_real_data(path,M,filename)
  full_data[[scaffold]]=data
}



################
# Run analysis #
################

result=eSMC(n=30,rho=rho,full_data,BoxB=BoxB,Boxs=Boxs,SB=SB,SF=SF,Rho=ER,Check=F,NC=NC,symbol_number=25) 


################
# Plot results #
################

Plot_esmc_results(result,mu,WP=F,LIST=F,x=c(10^4,10^7),y=c(3,6))
