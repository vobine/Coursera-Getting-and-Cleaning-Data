q2q5 <- function (x)
{
  fixies <- c (15, 4, 9, 4, 9, 4, 9, 4, 9, 4)
  stuff <- read.fwf (x, fixies, skip=4)
  sum (stuff[[4]])
}