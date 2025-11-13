






git clone https://github.com/RcppCore/RcppParallel.git
cd RcppParallel
git switch release/5.1.11

Rscript - <<HERE
covr::package_coverage(
    ".",
    quiet = FALSE
)
HERE


