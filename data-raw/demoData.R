# example data

dat0 <- read.csv("ExampleMethylationData.csv")
rownames(dat0) <- dat0$ProbeID
demoBetas <- dat0[,-1]

demoSampleAnnotation <-read.csv("ExampleSampleAnnotation.csv")

usethis::use_data(demoBetas,demoSampleAnnotation)
