context("Beta Checks")
library(DNAmAgeMini)

goodbetas <- demoBetas

badBetas_rownames <-
	data.frame(
		row.names = LETTERS[1:10],
		"a" = runif(10,0,1),
		"b" = runif(10,0,1)
	)

badBetas_probeCol <-
	data.frame(
		row.names = paste0("cg",sample(1000:2000,10)),
		"a" = paste0("cg",sample(1000:2000,10)),
		"b" = runif(10,0,1)
	)

badBetas_namesRow <-
	data.frame(
		row.names = c("",paste0("cg",sample(1000:2000,9))),
		"V1" = c("Sample_A",runif(9,0,1)),
		"V2" = c("Sample_B",runif(9,0,1))
	)

badBetas_range <-
	data.frame(
		row.names = paste0("cg",sample(1000:2000,10)),
		"a" = runif(10,-5,5),
		"b" = c(runif(9,1,6),NA)
	)

badBetas_numeric <-
	data.frame(
		row.names = paste0("cg",sample(1000:2000,10)),
		"a" = as.character(runif(10,0,1)),
		"b" = as.character(c(runif(5,0,1),rep("cheese!",5)))
	)

test_that("probeRownames...",{
	expect_type(probeRownames(goodbetas),"logical")
	expect_true(probeRownames(goodbetas))
	expect_false(probeRownames(badBetas_rownames))
})

test_that("probeFirstCol...",{
	expect_type(probeFirstCol(goodbetas),"logical")
	expect_false(probeFirstCol(goodbetas))
	expect_true(probeFirstCol(badBetas_probeCol))
})

test_that("namesFirstRow...",{
	expect_type(namesFirstRow(goodbetas),"logical")
	expect_false(namesFirstRow(goodbetas))
	expect_true(namesFirstRow(badBetas_namesRow))
})

test_that("isBetaMatrix...",{
	expect_type(isBetaMatrix(goodbetas),"logical")
	expect_true(isBetaMatrix(goodbetas))
	expect_false(isBetaMatrix(badBetas_range))
})



test_that("betasOK...",{
	expect_type(betasOK(goodbetas),"logical")
	expect_true(betasOK(goodbetas))

	expect_warning(state <- betasOK(badBetas_rownames),"The rownames")
	expect_false(state)
	state <- NULL

	expect_warning(state <- betasOK(badBetas_probeCol),"cg probes in the first column")
	expect_false(state)
	state <- NULL

	expect_warning(state <- betasOK(badBetas_namesRow),"first row")
	expect_false(state)
	state <- NULL

	expect_warning(state <- betasOK(badBetas_range),"greater than")
	expect_false(state)
	state <- NULL

	expect_warning(state <- betasOK("onions"),"no dimensions")
	expect_false(state)
	state <- NULL

	expect_warning(state <- betasOK(badBetas_numeric),"non-numeric column")
	expect_false(state)
	state <- NULL
})

#betasOK

#expect_warning(probeRownames(badBetas_rownames),"")
