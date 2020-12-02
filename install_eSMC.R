##########
# Source #
##########
install.packages("devtools")
library(devtools)
path="~Downloads/eSMC_2.0.1.tar.gz" # Path to the dowloaded eSMC package
devtools::install_local(path)
#to install without root permissions (in a local folder) use this command:
withr::with_libpaths(new = "~/R/your_local_dir", install_local("eSMC_2.0.1.tar.gz"))

