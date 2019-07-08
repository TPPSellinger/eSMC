##########
# Source #
##########
library(eSMC)
##########
# Script # 
##########

L=10 # Length en Mb de la séquence
M=3 # nb haplotype
L=L*1000000
nsim=10 # Nb repetition
Pop=10^4 # taille de la population
theta=500 # theta waterson per Mb
theta=(theta*L/1000000)
rho=0.2 # ratio recombinaison / mutation
total=list()
sigma=0 # selfing rate
beta=1 # germination rate
theta_o=theta
rho_o=rho*theta
mu <- theta/(2*Pop*L)
################################
# Building Demographic history #
################################
sum=0
count=0
mat_t=vector()
for(i in seq(1,6,1)){
    if((i %% 2) == 0) {
      time_e=(10^i)/(2*Pop)
      time_e_1=((10^i)+0.5*(10^i))/(2*Pop)
      v_t=c(time_e,log(0.2)/abs(time_e-time_e_1))
      
      mat_t=rbind(mat_t,v_t)
      time_e=((10^i)+0.5*(10^i))/(2*Pop)
      time_e_1=((10^(i+1)))/(2*Pop)
      v_t=c(time_e,log(5)/abs(time_e-time_e_1))
      mat_t=rbind(mat_t, v_t)
    } else {
      time_e=(10^i)/(2*Pop)
      time_e_1=((10^i)+0.5*(10^i))/(2*Pop)
      v_t=c(time_e,log(5)/abs(time_e-time_e_1))
      
      mat_t=rbind(mat_t,v_t)
      time_e=((10^i)+0.5*(10^i))/(2*Pop)
      time_e_1=((10^(i+1)))/(2*Pop)
      v_t=c(time_e,log(0.2)/abs(time_e-time_e_1))
      mat_t=rbind(mat_t, v_t)
    }
  }
v_t=c((10^(i+1))/(2*Pop),1)
mat_t=rbind(mat_t, v_t)
########################
# Simulating sequences #
########################
setwd("~/escrm") # Path to the simulator
command_simu=paste("./scrm",M,nsim,"-t",theta_o,"-r",rho_o,L,sep=" ")
for(i in 1:(dim(mat_t)[1]-1)){
  command_simu=paste(command_simu,"-eG",mat_t[i,1],mat_t[i,2],sep=" ")  
}
command_simu=paste(command_simu,"-eN",mat_t[dim(mat_t)[1],1],mat_t[dim(mat_t)[1],2],sep=" ")  
command_simu=paste(command_simu," -B 1",beta," -S 1",sigma,"> check_simu.txt",sep=" ")  
system(command_simu)
path="~/escrm/check_simu.txt"
O_total=Get_sim_data(path,L,M,nsim)

################
# Run analysis #
################

for(x in 1:nsim){
  # esmc
  test=eSMC(n=40,rho=1,O_total[[x]],maxit =20,symbol_number=30,BoxB=c(0.05,1),BoxP=c(3,3),Boxr=c(1,1),Boxs=c(0,0.97),pop=F,SB=F,SF=F,Rho=T,Check=F,BW=F,NC=1,path_simu ="~/escrm" ) 
  total[[(1+length(total))]]=test
}

################
# Plot results #
################

Plot_esmc_results(total,mu,WP=F,NC=nsim,x=c(100,10^5),y=c(2,6))
      
    
  
  



























