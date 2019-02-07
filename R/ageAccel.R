# age acceleration

#' ageAccel
#' @export
ageAccel <- function(pred,chron) {
	if (!(is.numeric(pred) & is.vector(pred))){ warning("pred is not a numeric vector")}
	if (!(is.numeric(chron) & is.vector(chron))){ warning("chron is not a numeric vector")}
	pred - chron
}

