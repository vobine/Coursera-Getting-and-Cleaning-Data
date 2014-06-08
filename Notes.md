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

