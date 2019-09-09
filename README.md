# eSMC
Contains all requirement to run eSMC

Step one : Download the package.

Step two : Download the script to install the package. Make sure the path of the package is correct (You may have to modify the script depending on where the package has been downloaded). Execute script to install package on local machine.


For application to simulated data : 

Step three : Download a simulator like ms, scrm (or our modified version escrm) or msprime.

Step 3.5 : If simulator output file is in a different format as the one of ms, output must be process into a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md) or into a file in the ms format. 

Step four : Download the scrip test_esmc.R. This script is an example on how to run eSMC on simulated data.

Step five : Make sure the path to the simulator is correct.

Step 6 : Execute the code. It can it some minutes (10 to 30 min depending of your machine)

For application to real data :

Step three : Download one data file from one of our repository (https://github.com/TPPSellinger/Daphnia_pulex_data or https://github.com/TPPSellinger/Arabidopsis_thaliana_data )




Warning : Do not worry if the message "unsuccessfull convergence" appear. This message is printed by the package "BB" which optimizes the likelihood. We limited the number of itirations to optimize the likelihood to speed up the algorithm (since convergence speed decreases). 


