# eSMC
Contains all requirement to run eSMC

Input file :

The input file for eSMC is a "Segregating Matrix". Matrix must have M+1 lines. The M first lines of the Segregating Matrix are the nucleotides of the M haplotypes at all the SNP position (It can be encoded as nucleotide letters or as number). The last line of the matrix contains the position on the sequence of the SNPs. The number of column is thus equal to the number of SNPs. The Segregating Matrix can be build from a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md) or from simulated data as described below. 

How to use eSMC :

Step one : Download the package.

Step two : Download the script to install the package. Make sure the path of the package is correct (You may have to modify the script depending on where the package has been downloaded). Execute script to install package on local machine.

Application to simulated data (For Beginners or Windows user ) : 

Note : This script it based on the original simulator scrm through the R package scrm. Hence, seed banks and self-fertilization cannot be simulated. See next section for simulating data with seed banks and self-fertilization.

Step three : Download the R script easy_test_esmc.R

Step four : Execute the code. It can take some minutes (10 to 30 min depending on your machine)

Application to simulated data (For advanced user or Unix user ) : 

Step three : Download our simulator escrm (https://github.com/TPPSellinger/escrm). Compile the code or use the executable for Unix machine (help to compile can be found on https://github.com/scrm/scrm )

Step 3.5 : If using a different simulator, output file  might be in a different format as the one of ms. Hence, output must be process into a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md) or into a file in the ms format. 

Step four : Download the scrip test_esmc.R. This script is an example on how to run eSMC on simulated data (using the simulator escrm).

Step 4.5 : If using a different simulator than escrm, one must modify the script responsable for simulating the data.

Step five : Make sure the path to the simulator is correct.

Step six : Execute the code. It can it some minutes (10 to 30 min depending on your machine)

Application to real data :

Step three : Download one data file from one of our repository (https://github.com/TPPSellinger/Daphnia_pulex_data or https://github.com/TPPSellinger/Arabidopsis_thaliana_data )

Step four : Download the scrip test_data_esmc.R.

Step five : Add the path to the data file.

Step six : Fill the ecological prior knowledge.

Step seven : Execute the code (10 min to 1 h depending on the selected data, the analysis and your machine)

General Advices : 

Note : Do not worry if the message "unsuccessfull convergence" appears. This message is printed by the package "BB" because we limited the number of itirations when optimizing the likelihood.

Warning : Using more than 10 haplotypes can considerably increase computation time.

Warning : Using more than 80 hidden states can considerably increase computation time.

Warning : Using less than 30 hidden states can lead to poor results.

Warning : Using sequence length smaller than 1 Mb can lead to poor results.

Warning : Using data with less than 1000 SNPs will lead to poor results.

Warning : Our method cannot distinguish self-fertilization from seed bank. Hence one should not simultaneously estimate both parameter without strong prior knowledge. In addition, user should use as result the set of values the germination and self-fertilization can take and not one single set of values.  

