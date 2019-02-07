# build age predictors

#'HorvathAgePred
#' @include getAgePredictorClosure.R
#' @include transforms.R
#' @include data.R
#' @export
HorvathAgePred <- function(betas, performBetaChecks = TRUE, trans = anti.trafo, ...) {
	getAgePredictor(HorvathCoefficients)(betas, performBetaChecks, trans, ...)
}

#'HannumAgePred
#'
#' @export
HannumAgePred <- getAgePredictor(HannumCoefficients)

#'LevineAgePred
#'
#' @export
LevineAgePred <- getAgePredictor(LevineCoefficients)





