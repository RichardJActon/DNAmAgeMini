# DNAmAgeMini

__WARNING: THIS PACKAGE IS A PRE-RELEASE WORK IN PROGRESS__

An R package to Calculate DNA methylation Age using 'beta' values from Illumina methylation arrays with several models

- Currently available models
	- Horvath 2013
	- Hannum et al. 2013
	- Levine et al. 2018

__Note That at present this package simply computes the prediction from the model coefficients, Normalisation and Imputation steps are note preformed__

$$DNAmAge = a\beta_{probe1} ... b\beta_{n} + intercept$$

Where $a$, $b$ and $intercept$ are model parmeters provided by the authors of the respective DNAm age predictors

(The Hovath2013 model result is subject to an additional transformation as described in the original publication, this transformation __Is__ carried out by this package)

# Installation

```
devtools::install_github("richardjacton/DNAmAgeMini")
```

