################
# Install scrm #
################


install.packages("scrm")

##########
# Source #
##########

library(scrm)
library(eSMC)


##############
# Parameters # 
##############

L=10 # Length in Mb of the sequences
M=2 # nb haplotype
L=L*1000000
nsim=1 # Number of simulation
Pop=10^4 # Population size
mu=2.5*10^-8  # Mutation rate per position per generation 
theta=(mu*L*4*Pop) # theta waterson per Mb
rho=0.5 # ratio r/mu
total=list()
theta_o=theta
rho_o=rho*theta

################################
# Building Demographic history #
################################
sum=0
count=0
mat_t=vector()
# Builds the saw-tooth scenario
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
command_simu=paste(M,nsim,"-t",theta_o,"-r",rho_o,L,sep=" ")
for(i in 1:(dim(mat_t)[1]-1)){
  command_simu=paste(command_simu,"-eG",mat_t[i,1],mat_t[i,2],sep=" ")  
}
command_simu=paste(command_simu,"-eN",mat_t[dim(mat_t)[1],1],mat_t[dim(mat_t)[1],2],sep=" ")  
Data=scrm(command_simu)
O_total=get_data_R_scrm(Data,M=M,L=L)

################
# Run analysis #
################
rec=vector()
for(x in 1:nsim){
  # esmc
  result=eSMC(n=40,rho=1,O_total[[x]],maxit =20,BoxB=c(0.05,1),BoxP=c(3,3),Boxr=c(1,1),Boxs=c(0,0.97),pop=F,SB=F,SF=F,Rho=T,Check=F,BW=F,NC=1,pop_vect =rep(2,20)) 
  total[[(1+length(total))]]=result
  rec=c(rec,(result$rho/result$mu))
}

################
# Plot results #
################

Plot_esmc_results(total,mu,WP=F,LIST=TRUE,x=c(100,10^5),y=c(2,6))
Lines<-  list(bquote("r/mu*:" ~ .(round(mean(rec),digits = 2))))
legend("topright",legend =do.call(expression, Lines), lty = 1,col="red")



