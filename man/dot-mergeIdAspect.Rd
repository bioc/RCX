% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Utils-general.R
\name{.mergeIdAspect}
\alias{.mergeIdAspect}
\title{Merge two aspects (data.frames)}
\usage{
.mergeIdAspect(
  firstAspect,
  secondAspect,
  idCol,
  uniqCols,
  stopOnDuplicates = FALSE,
  saveOldIds = TRUE,
  .log = c()
)
}
\arguments{
\item{firstAspect}{data.frame; first aspect.}

\item{secondAspect}{data.frame; second aspect.}

\item{idCol}{character; name of the column to merge on.}

\item{uniqCols}{character; name of the column to be checked for uniqueness.}

\item{stopOnDuplicates}{boolean (default=FALSE); whether to stop, if duplicates in \code{uniqCols} column are found.}

\item{saveOldIds}{boolean (default=TRUE); whether to keep the IDs from \code{secondAspect}, if duplicates in \code{uniqCols} column are found.}

\item{.log}{character (optional); name of the calling function used in logging}
}
\value{
data.frame of the merged aspects.
}
\description{
Merges two aspects, that are both data.frames and of the same aspect class.
If the \code{idCol} contains duplicates new ids (for \code{secondAspect}) are created (ids of \code{firstAspect} are kept),
unless it is spezified otherwise by \code{saveOldIds}.
}
\note{
The two aspects must be the same type of aspect (same aspect class)!

Internal function only for convenience
}
\examples{
NULL
}
\seealso{
\code{\link{.mergeAttributesAspect}}, \code{\link{.createAttributeAspect}}
}
\keyword{internal}
