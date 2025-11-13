





rm misc/standalone/*.o misc/standalone/*.so



# Need to cd into the directory to pick up the Makevars file
cd misc/standalone && R CMD SHLIB \
    /example_1.c \
    misc/standalone/example_2.cpp



