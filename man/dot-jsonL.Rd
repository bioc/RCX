% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utils-json.R
\name{.jsonL}
\alias{.jsonL}
\title{Return data as a list from a JSON list}
\usage{
.jsonL(
  data,
  acc,
  default = as.character(NA),
  unList = TRUE,
  returnAllDefault = TRUE
)
}
\arguments{
\item{data}{json list}

\item{acc}{accession name}

\item{default}{default return value}

\item{unList}{logical; whether to unlist the list elements (e.g. for a list of lists return a list of vectors)}

\item{returnAllDefault}{whether to return the vector if all values are the default value (or \code{NULL} instead)}
}
\value{
list
}
\description{
Return data as a list from a JSON list
}
\note{
Internal function only for convenience
}
\examples{
testData = list(list(n="CDKN1B"),
                list(n="ROCK1", r="BLA"),
                list(n="SHC1", r="BLUBB"),
                list(n="IRS1"))
RCX:::.jsonL(testData, "r")
}
\keyword{internal}
