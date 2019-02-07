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
#'

data(HannumCoefficients)
HannumAgePred <- getAgePredictor(HannumCoefficients)

#'LevineAgePred
#'
#' @export
data(LevineCoefficients)
LevineAgePred <- getAgePredictor(LevineCoefficients)





