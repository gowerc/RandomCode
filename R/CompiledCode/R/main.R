
#' @export
funny <-  function() print("hi")


#' @useDynLib mypkg
#' @export
fun2 <- function(x, y) {
    .Call("add_numbers_call", x, y, PACKAGE = "mypkg")
}

#' @export
fun3 <- function(x, y) {
    .Call("add_numbers_cpp", x , y, PACKAGE = "mypkg")
}