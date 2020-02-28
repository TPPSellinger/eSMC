# eSMC
Contains the R-package to run eSMC, as well as script examples and a dataset (Daphnia pulex data) on which to run them. A detailed description of the method can be found here: https://doi.org/10.1101/701185

Input file:

The input file for eSMC is a "Segregating Matrix". The matrix must have M+1 lines (M is the number of haplotypes). The first M lines of the Segregating Matrix are the nucleotides of the M haplotypes at all the SNP positions (it can be encoded as nucleotide letters or as numbers). The last line of the matrix contains the position on the sequence of the SNPs. The number of columns is thus equal to the number of SNPs. The Segregating Matrix can be built from a multihetsep file (https://github.com/stschiff/msmc/blob/master/guide.md) or from simulated data through functions of the package. 

How to use eSMC:

Step one: Download or clone the repository eSMC (We recommand the use of the latest version). Extract the zip file.

Step two: Open the script install_eSMC.R in Rstudio or a text editor. Make sure the path of the package (eSMC_0.3.0.tar.gz) is correct (line 6). If the package is in a different folder, modify the path to the correct folder. Execute the script to install the package on your local machine (by selecting everything and then clicking run in Rstudio).

Depending on what data (simulated or real) you will be using instructions starting from "Step three" may vary. Below we provide the steps to follow if you are using simulated data using the original scrm R package, our escrm simulator (for advanced users), or real data.

Application to simulated data from scrm package: 

Note: This script is based on the original scrm simulator, using R package scrm. Using this simulator implies that seed banks (beta) and self-fertilization (sigma) cannot be taken into account. See the next section (Application to simulated data for advanced users) for simulating data with seed banks and self-fertilization.

Step three: Open the downloaded R script easy_test_esmc.R using Rstudio.

Step four: Execute the script. This may take some time (10 to 30 minutes depending on the local machine used). This script simulates data under a saw-tooth demographic scenario (see https://doi.org/10.1101/701185). When the analysis is finished, the estimated demographic history is automatically ploted with the estimated recombination rate over mutation rate (r/mu) shown in the legend. Note: Do not worry if the message "unsuccessful convergence" appears. This message is printed by the package "BB" because we limited the number of itirations when optimizing the likelihood.


Application to simulated data using our escrm simulator (for advanced users): 

Step three: Download our simulator escrm (https://github.com/TPPSellinger/escrm). Compile the code or use the executable for Unix machines (help to compile can be found on https://github.com/scrm/scrm). If you choose to use a different simulator, the output file may require reformatting. In this case, output must be processed into one of three formats: a multihetsep file (for this format see https://github.com/stschiff/msmc/blob/master/guide.md), a ms file, or a segregating matrix. 

Step four: Download the script test_esmc.R. This script is an example on how to run eSMC on simulated data (using the simulator escrm). If using a different simulator than escrm, one must modify the script used to simulate the data (line 29 to 69 line in test_esmc.R). Note: Make sure the path to the simulator on line 61 of the script is the right one.

Step five: Execute the code. This might take a little bit of time (10 to 30 min depending on the machine you are using). When the analysis is finished, the estimated demographic history is automatically ploted, and the self-fertilization rate (sigma) and the germination rate (beta) can be found in the legend. Note: Do not worry if the message "unsuccessful convergence" appears. This message is printed by the package "BB" because we limited the number of itirations when optimizing the likelihood.


Application to real data:

Step three: We provide a small dataset from Daphnia pulex to test eSMC. To test the method on the datasets used in the paper, the data files are available for download at https://github.com/TPPSellinger/Daphnia_pulex_data and https://github.com/TPPSellinger/Arabidopsis_thaliana_data

Step four: Open the R script test_data_esmc.R.

Step five: Extract the zip file containing the data and modify the path on line 37 of the test_data_esmc.R script and, if necessary, change the names of the files used (there is a "for" loop from line 38 to 44, that automatically generates the file names, and this must be modified accordingly).

Step six: Modify the prior knowledge parameters of the ecological variables (bounding and priors of variables to be estimated) if working on a different data set (lines 12 to 27 of the script).

Step seven: Execute the code (1 to 2 hours of run time, depending on the data set, the analysis run and the machine used). To reduce computation time one can reduce the number of hidden states (n) and reduce the number of analysed scaffolds (line 34 of the script). Note: Do not worry if the message "unsuccessful convergence" appears. This message is printed by the package "BB" because we limited the number of itirations when optimizing the likelihood.


Warnings: 

Computation time can be increased considerably if:
- more than one chromosome in one analysis is used
- more than 10 haplotypes are simultaneously analyzed
- more than 80 hidden states are used

If the following statements are true, poor results are to be expected:
- using less than 30 hidden states
- using sequence lengths smaller than 1 Mb
- using data with less than 1000 SNPs
- depending on the ecological parameters, the recombination rate can be undersetimated if, per base pair, the recombination rate is higher than the mutation rate 

It is important to note:
- Our method cannot distinguish self-fertilization from seed banks. Simultaneously estimating both varaibles without strong prior knowledge is not advised. 

