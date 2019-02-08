# beta Checks


#' probeRownames
#'
#' @param betas a potential betas object to check
#' @return boolean
probeRownames <- function(betas) {
	someNames <- rownames(betas)
	any(grepl(pattern = "cg\\d+",someNames))
}

#' probeFirstCol
#'
#' @param betas a potential betas object to check
#' @return boolean
probeFirstCol <- function(betas) {
	someRows <- as.character(betas[,1])
	any(grepl(pattern = "cg\\d+",someRows))
}

#' namesFirstRow
#'
#' @param betas a potential betas object to check
#' @return boolean
namesFirstRow <- function(betas) {
	firstRow <- suppressWarnings(
		as.double(
			as.character(
				unlist(betas[1,])
			)
		)
	)
	all(is.na(firstRow)) |
		any(firstRow > 1.5, na.rm = TRUE) |
		any(firstRow < -0.5, na.rm = TRUE)
}

#' isBetaMatrix
#'
#' @param betas a potential betas object to check
#' @return boolean
isBetaMatrix <- function(betas) {
	converted <-
	unlist(lapply(betas, function(x) {
		suppressWarnings(as.double(as.character(x)))
	}))
	all(
		# found some 'wild' betas outside 0-1
		converted <= 1.5 & converted >= -0.5,
		na.rm = TRUE
	)
}


#' betasOK
#'
#' performs checks on Beta ojects to see if the are of the expected form:
#' a data.frame or matrix with cg probes as rownames and samples names as
#' column names with numeric values between 0 and 1 for the body
#' Checks for common errors such as having probe names in the first row
#' instead of as rownames
#'
#' @param betas a potential betas object to check
#' @return boolean
#' @export
betasOK <- function(betas) {
	pass <- TRUE

	if (is.null(dim(betas))) {
		warning(
			"Your Betas object has no dimensions!\n"
		)
		return(FALSE)
	}

	if (probeRownames(betas) == FALSE) {
		pass <- FALSE
		warning(
			paste0(
				"The rownames of you betas object don't seem to be cg probes\n",
				paste0(head(rownames(betas)),collapse = ", "),"...\n"
			)
		)
	}

	if (probeFirstCol(betas) == TRUE) {
		pass <- FALSE
		warning(
			paste0(
				"Looks Like you have cg probes in the first column",
				" of your betas object, please put probe identifiers",
				" in rownames only\n",
				paste0(head(betas[,1]),collapse = ", "), "...\n"
			)
		)
	}

	if (namesFirstRow(betas) == TRUE) {
		pass <- FALSE
		warning(
			paste0(
				"Looks like first row of your betas object does not contain",
				" beta values, could it be your column names?\n",
				paste0(head(unlist(betas[1,],use.names = FALSE)),collapse = ", "),"...\n"
			)
		)
	}

	if (isBetaMatrix(betas) == FALSE) {
		pass <- FALSE
		warning(
			paste0(
				"Looks like your Betas object has non-numeric values or values",
				" which are greater than 1 or less than 0 (NAs are ignored)\n"
			)
		)
	}

	if (!all(sapply(demoBetas,is.numeric))) {
		pass <- FALSE
		warning(
			paste0(
				"Looks Like your Betas object has non-Numeric column(s)\n"
			)
		)
	}
	return(pass)
}

# betasOK(testBetas)
#(as.character( as.matrix(data.frame("a"=c("0.4","0.5"),"b"=c(1,NA)))) %>% as.double() <=1) %>% all(na.rm = TRUE)
