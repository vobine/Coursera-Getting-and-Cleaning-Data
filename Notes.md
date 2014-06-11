Getting and Cleaning Data
===========================

Provenance and documentation

- Raw data
- Tidy data
- Code book / metadata
- Explicit procedure to go from raw to tidy

Raw means raw: no software run, not manipulated, nothing removed.

Tidy:
- Each variable in one column
- Each observation in one row
- One table for each "kind" of variable
- Multiple tables need an ID column on which to join.

Code book annotates the tidy data and the process that produced it.

The procedure should be implemented and documented with an eye to reproducibility.

Downloading data
----------------

download.file()
On Mac, method="curl" for https?!
Timestamp your downloads.
  fileURL <- "the URL"
  download.file (fileURL, destfile="where to put it", method="curl")
  date ()

Loading local files
-------------------

For delimited text, use read.table(), mostly, and its descendants read.csv() and read.csv2().

Beware of quotation marks embedded in data; use quote=""

library(xlsx) read.xlsx() for Excel files.

Reading XML
----------------

library(XML)
doc <- xmlTreeParse(url)
rootNode <- 

xmlSApply

XPath
http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf
xpathSApply

HTML
http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens
htmlTreeParse ()

Numerous tutorials and links in the doobly-do

Readon JSON
----------------

e.g., https://api.github.com/users/jtleek/repos

library(jsonlite)
jsonData < fromJSON(url)

myjson <- toJSON(iris)
produces a text representation of, in this case, the iris data frame.

data.table
----------------

Inherits from data.frame; similar API, but much faster

tables() lists tables currently in memory

Subsetting columns doesn't work as with data.frame. Parameter after the comma is an *expression*: e.g., 
DT[,list(mean(x),sum(z))]
where x and z are columns of DT

or add a new column
DT[,w:=z^2]

Warning: variables are references!
DT2 <- DT
DT2[, y:=2]
this will modify DT as well.

"plyr-like operations"
DT[ , a:=x>0]
DT[,b:= mean(x+2), by=a]

setkey(DT, x)
fast subset, sort
merge data.tables on keys

MySQL
--------

UCSC Genomics database
genome.ucsc.edu

ucscDb <- dbConnect (MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")

Always disconnect!
dbDisconnect(ucscDb)

dbListTables ()
hg19 database has 10949 tables. Yikes.
dbListFields ()
dbReadTable ()
dbSendQuery ()
fetch ()  n=#rows
dbClearResult ()

RMySQL vignette
http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf

