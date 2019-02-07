# transforms

#' trafo
#'
trafo <- function(x, adult.age = 20) {
	x <- (x + 1)/(1 + adult.age)
	y <- ifelse(x <= 1, log(x), x - 1)
	y
}

#' anti.trafo
#'
anti.trafo <- function(x, adult.age=20) {
	ifelse(
		x < 0,
		(1 + adult.age) * exp(x) - 1,
		(1 + adult.age) * x + adult.age
	)
}
