



library(rlang)
library(lobstr)


#####################
#
#
#     Expressions
# 
#
#####################

## Expressions and Quosures


rlang::expr(x + 1)  

capture_it <- function(x) rlang::enexpr(x)
capture_it(a + b + c)


z <- quo(x + 2)

rlang::quo_get_env(z)
rlang::quo_get_expr(z)


## Eval


eval(rlang::expr(x + y), env(x = 1, y = 2))

# Use dataset bare names
eval(rlang::expr(Sepal.Length + Sepal.Width), list2env(iris))


string_math <- function(x) {
    e <- new.env(
        parent = parent.frame()
    )
    e$`+` = function(x, y) paste0(x, y)
    e$`*` = function(x, y) strrep(x, y)
    eval(enexpr(x), e)
}

name <- "Hadley"
string_math("Hello " + name)
#> [1] "Hello Hadley"

string_math(("x" * 2 + "-y ") * 3)
#> [1] "xx-y xx-y xx-y"




## AST

lobstr::ast( foo(bar(x), 12) + 13)



expr_type <- function(x) {
    if (rlang::is_syntactic_literal(x)) {
        "constant"
    } else if (is.symbol(x)) {
        "symbol"
    } else if (is.call(x)) {
        "call"
    } else if (is.pairlist(x)) {
        "pairlist"
    } else {
        typeof(x)
    }
}

switch_expr <- function(x, ...) {
    switch(expr_type(x),
           ...,
           stop("Don't know how to handle type ", typeof(x), call. = FALSE)
    )
}

switch_expr(x,
            constant = FALSE,
            symbol = as_string(x) %in% c("F", "T")
)





## Symbols

as.name("x")
rlang::expr(x)
rlang::sym("x")



## Calls

x <- lobstr::ast(read.table("important.csv", row.names = FALSE))

call("mean", x = as.name("x"), na.rm = TRUE)
rlang::call2("mean", x = rlang::expr(x), na.rm = TRUE)


call("base::mean", x = as.name("x"), na.rm = TRUE)
rlang::call2(rlang::expr(base::mean), x = rlang::expr(x), na.rm = TRUE)


call("<-", as.symbol("x"), 10)
rlang::call2("<-", rlang::expr(x), 10)



## Parsing / Deparsing

epr <- parse(text = "x + 1")   #  string -> expressions (returns an expression-list)
deparse(epr[[1]])              #  expression -> string





## Missing vectors

# Only produced by expression() and parse()

expression(x + 1, y + 2)





#####################
#
#
#   Quasiquotation
# 
#
#####################


x <- base::expression(x + 1)[[1]]
y <- base::quote(x + 1)
identical(x, y)


rlang::sym(myvar)
rlang::syms()
rlang::ensym()
rland::ensyms()


myfun <- function(x) {
    print(rlang::ensym(x))
}
myfun(myvar)
# myvar


# 19.3.3 With base R 


