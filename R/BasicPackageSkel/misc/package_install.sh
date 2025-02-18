


### Build and install the package

R CMD build .
mv mypkg_1.0.tar.gz local
R CMD INSTALL -l local/install local/mypkg*.tar.gz

Rscript -e '
.libPaths(paste0(getwd(), "/local/install"))
library(mypkg)
fun1(2, 2)
fun2(4, 4)
'


