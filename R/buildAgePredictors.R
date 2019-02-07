# build age predictors

#'HorvathAgePred
#' @include getAgePredictorClosure.R
#' @include transforms.R
#' @include data.R
#' @export
HorvathAgePred <- function(betas, performBetaChecks = TRUE, trans = anti.trafo, ...) {
	getAgePredictor(HorvathCoefficients)(betas, performBetaChecks, trans, ...)
}


data(HannumCoefficients)
#'HannumAgePred
#'
#' @export
HannumAgePred <- getAgePredictor(HannumCoefficients)


data(LevineCoefficients)
#'LevineAgePred
#'
#' @export
LevineAgePred <- getAgePredictor(LevineCoefficients)





