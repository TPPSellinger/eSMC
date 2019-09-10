###################
# Source function #
###################
library(eSMC)


##############
# Parameters # 
##############


# Please Fill all value

mu=   # Mutation rate per position per generation 
rho=  # ratio recombination/mutation 
M= # Number of haplotypes
###################################
# Set one to TRUE (rest to FALSE) #
###################################
ER= # True to estimate recombination rate
SF= # True to estimate selfing rate
SB= # True to estimate germination rate

  
  
# Set boundaries
    
BoxB=c(0.05,1) #  min and max value of germination rate 
Boxs=c(0,0.99) #  min and max value of selfing rate 

############
# Get data #
############

# example 
path="" # Put character string of path to the multihetsep file
filename ="" # Put character string of the multihetsep file name
data=Get_real_data(path,M,filename)
  
################
# Run analysis #
################

result=eSMC(n=40,rho=rho,data,BoxB=BoxB,Boxs=Boxs,SB=SB,SF=SF,Rho=ER,Check=F) 


################
# Plot results #
################

Plot_esmc_results(result,mu,WP=F,LIST=F,x=c(100,10^7),y=c(2,8))




