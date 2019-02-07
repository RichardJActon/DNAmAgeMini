# making coefficient tables

library(dplyr)

###############################################################################
#
###############################################################################

datClock <- read.csv("./inst/extdata/Horvath2013.csv")

datClock <- datClock %>%
	select(probe = CpGmarker, coeff = CoefficientTraining) %>%
	mutate(probe = as.character(probe))
datClock[1,1] <- "Intercept"

HorvathCoefficients <- datClock

###############################################################################
#
###############################################################################

phenoAgeProbeDetails <-
	read.csv(file = "./data-raw/Levine2018.csv")

LevineCoefficients <-
	phenoAgeProbeDetails %>%
	select(probe = CpG, coeff = Weight) %>%
	mutate(probe = as.character(probe))

###############################################################################
#
###############################################################################

hannumClockData <-
	read.table(
		"./data-raw/Hannum2013.csv",
		header = TRUE,
		sep="\t"
	)

hannumClockData <-
	hannumClockData %>%
	select(probe = Marker, coeff = Coefficient) %>%
	mutate(probe = as.character(probe))

HannumCoefficients <-
	bind_rows(
		data.frame(
			"probe" = c("Intercept"),
			"coeff" = c(0),
			stringsAsFactors = FALSE
		),
		hannumClockData
	)

usethis::use_data(
	HorvathCoefficients,
	HannumCoefficients,
	LevineCoefficients,
	overwrite = TRUE#,
	#internal = TRUE
)
