context("getAgePredictor")

test_coefs <- data.frame(
	"probe" = c("Intercept","cg0000"),
	"coeff"= c(0,1)
)

test_that("getAgePredictor...",{
	expect_is(getAgePredictor(test_coefs),"function")
})
