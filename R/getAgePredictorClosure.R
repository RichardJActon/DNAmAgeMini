#' getAgePredictor
#'
#' @export
#'
getAgePredictor <- function(coeffs) {

	rownames(coeffs) <- coeffs$probe
	intercept <- coeffs["Intercept","coeff"]
	weights <- coeffs[
		-which(rownames(coeffs) == "Intercept"),
		"coeff",
		drop=FALSE
		]

	AgePredictor <- function(
		betas,
		performBetaChecks = TRUE,
		trans = NULL,
		...
	) {
		betaCheckPass <- TRUE
		if (performBetaChecks) {
			betaCheckPass <- betasOK(betas)
			if (!betaCheckPass){
				stop("Beta Checks Failed - See warnings for why.")
			}
		}

		preds <- NULL
		if (betaCheckPass) {
			availNames <- rownames(weights)[
				rownames(weights) %in% rownames(betas)
			]
			betas <- betas[availNames,]

			if (length(availNames) < nrow(weights)){
				warning(
					paste0(
						length(availNames)," of ",
						nrow(weights)," clock sites used\n"
					)
				)
			}

			preds <- apply(betas,2,function(beta){
				intercept + sum(beta * weights, na.rm = TRUE)
			})
		}

		if (is.function(trans)) {
			preds <- trans(preds)
		} else if (is.null(trans)) {
			preds <- preds
		}

		return(preds)
	}
	return(AgePredictor)
}
