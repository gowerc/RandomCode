


### Build and install the package

R CMD build .
mv mypkg_1.0.tar.gz local
mkdir local/install
R CMD INSTALL -l local/install local/mypkg*.tar.gz

Rscript - <<HERE
.libPaths("~/Desktop/Work/test-r-pkg/local/install")
library(mypkg)
fun2(2, 2)
fun3(4, 4)
HERE


