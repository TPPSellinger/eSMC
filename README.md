# eSMC
Contains all requirement to run eSMC. A detailed description of the method can be found here: https://doi.org/10.1101/701185

Input file :

The input file for eSMC is a "Segregating Matrix". Matrix must have M+1 lines (M is the number of haplotypes). The first M lines of the Segregating Matrix are the nucleotides of the M haplotypes at all the SNP positions (It can be encoded as nucleotide letters or as numbers). The last line of the matrix contains the position on the sequence of the SNPs. The number of columns is thus equal to the number of SNPs. The Segregating Matrix can be build from a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md) or from simulated data through functions of the package. 

How to use eSMC :

Step one : Download or clone the repository eSMC. Extract the zip file.

Step two : Open the script : install_eSMC.R in Rstudio or a text editor. Make sure the path of the package (eSMC_0.2.0.tar.gz) is correct (line 6). If the package is in a different folder, modify the path to the correct folder. Execute the script to install the package on your local machine (by selecting everything and then clicking run in Rstudio).

Application to simulated data (For beginning users on Unix and Windows users) : 

Note : This script is based on the original simulator scrm through the R package scrm. Hence, seed banks (beta) and self-fertilization (sigma) cannot be simulated. See the next section for simulating data with seed banks and self-fertilization.

Step three : Open the downloaded R script easy_test_esmc.R

Step four : Execute the script. This may take some time (10 to 30 minutes depending on your machine). This script simulates data under a saw-tooth demographic scenario. When analysis is finished, the estimated demographic history is ploted with the estimated recombination rate over mutation rate (r/mu) .

Application to simulated data (For advanced users on Unix user ) : 

Step three : Download our simulator escrm (https://github.com/TPPSellinger/escrm). Compile the code or use the executable for Unix machine (help to compile can be found on https://github.com/scrm/scrm )

Step 3.5 : If using a different simulator, output file might be in a different format. Hence, output must be processed into a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md), into a file in the ms format or a segregating matrix. 

Step four : Download the script test_esmc.R. This script is an example on how to run eSMC on simulated data (using the simulator escrm).

Step 4.5 : If using a different simulator than escrm, one must modify the script responsable for simulating the data (line 29 to 69 line ).

Step five : Make sure the path to the simulator is correct (line 61) .

Step six : Execute the code. This might take a little bit of time (10 to 30 min depending on your machine). When the analysis is finished, the estimated demographic history is ploted, as well as the self-fertilization rate (sigma) and the germination rate  (beta).

Application to real data :

Step three : In the repository, there is Daphnia pulex data. To test the method on different or more data set, one can download  data files from one of our repository (https://github.com/TPPSellinger/Daphnia_pulex_data or https://github.com/TPPSellinger/Arabidopsis_thaliana_data )

Step four : Open the R script test_data_esmc.R.

Step five : Modify the path to the data file (line 36) if the file is in a different folder.

Step six : Modify the ecological prior knowledge if working on a different data set (line 14 to 36 ).

Step seven : Execute the code (10 min to 1 h depending on the data set, the analysis and your machine)

General Advice : 

Note : Do not worry if the message "unsuccessfull convergence" appears. This message is printed by the package "BB" because we limited the number of itirations when optimizing the likelihood.

Warning : Using more than 10 haplotypes can considerably increase computation time.

Warning : Using more than 80 hidden states can considerably increase computation time.

Warning : Using less than 30 hidden states can lead to poor results.

Warning : Using sequence length smaller than 1 Mb can lead to poor results.

Warning : Using data with less than 1000 SNPs will lead to poor results.

Warning : Our method cannot distinguish self-fertilization from seed bank. Hence one should not simultaneously estimate both parameter without strong prior knowledge. In addition, user should use as result the set of values the germination and self-fertilization can take and not one single set of values.

Warning : If there are more recombinations than mutations, the model can underestimate the recombination rate.

