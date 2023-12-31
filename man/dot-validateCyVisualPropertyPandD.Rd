% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Validate.R
\name{.validateCyVisualPropertyPandD}
\alias{.validateCyVisualPropertyPandD}
\alias{.validateListOfCyVisualPropertyPandD}
\title{Cytoscape visual property: List of property and dependency}
\usage{
.validateCyVisualPropertyPandD(aspect, property, verbose = TRUE)

.validateListOfCyVisualPropertyPandD(aspect, property, verbose = TRUE)
}
\arguments{
\item{aspect}{either \link{CyVisualPropertyProperties} or \link{CyVisualPropertyDependencies} object}

\item{property}{character; name of the property}

\item{verbose}{logical; whether to print the test results.}
}
\value{
logical; whether the object passed all tests.
}
\description{
For both properties the checks are the same.
}
\section{Functions}{
\itemize{
\item \code{.validateListOfCyVisualPropertyPandD}: List of property and dependency objects
}}

\note{
Internal function only for convenience
}
\keyword{internal}
