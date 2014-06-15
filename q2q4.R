q2q4 <- function (conn, lines)
{
  txt <- sapply (readLines (conn), nchar, simplify=TRUE)
  sapply (lines, function (ll) txt[ll])
}