% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Json-fromJson.R
\name{jsonToRCX}
\alias{jsonToRCX}
\alias{jsonToRCX.default}
\alias{jsonToRCX.status}
\alias{jsonToRCX.numberVerification}
\alias{jsonToRCX.metaData}
\alias{jsonToRCX.nodes}
\alias{jsonToRCX.edges}
\alias{jsonToRCX.nodeAttributes}
\alias{jsonToRCX.edgeAttributes}
\alias{jsonToRCX.networkAttributes}
\alias{jsonToRCX.cartesianLayout}
\alias{jsonToRCX.cyGroups}
\alias{jsonToRCX.cyHiddenAttributes}
\alias{jsonToRCX.cyNetworkRelations}
\alias{jsonToRCX.cySubNetworks}
\alias{jsonToRCX.cyTableColumn}
\alias{jsonToRCX.cyVisualProperties}
\title{Convert parsed JSON aspects to RCX}
\usage{
jsonToRCX(jsonData, verbose)

\method{jsonToRCX}{default}(jsonData, verbose)

\method{jsonToRCX}{status}(jsonData, verbose)

\method{jsonToRCX}{numberVerification}(jsonData, verbose)

\method{jsonToRCX}{metaData}(jsonData, verbose)

\method{jsonToRCX}{nodes}(jsonData, verbose)

\method{jsonToRCX}{edges}(jsonData, verbose)

\method{jsonToRCX}{nodeAttributes}(jsonData, verbose)

\method{jsonToRCX}{edgeAttributes}(jsonData, verbose)

\method{jsonToRCX}{networkAttributes}(jsonData, verbose)

\method{jsonToRCX}{cartesianLayout}(jsonData, verbose)

\method{jsonToRCX}{cyGroups}(jsonData, verbose)

\method{jsonToRCX}{cyHiddenAttributes}(jsonData, verbose)

\method{jsonToRCX}{cyNetworkRelations}(jsonData, verbose)

\method{jsonToRCX}{cySubNetworks}(jsonData, verbose)

\method{jsonToRCX}{cyTableColumn}(jsonData, verbose)

\method{jsonToRCX}{cyVisualProperties}(jsonData, verbose)
}
\arguments{
\item{jsonData}{nested list from parsed JSON}

\item{verbose}{logical; whether to print what is happening}
}
\value{
created aspect or \code{NULL}
}
\description{
Functions to handle parsed JSON for the different aspects.
}
\details{
These functions will be used in \code{\link{processCX}} to process the JSON data for every aspect.
Each aspect is accessible in the CX-JSON by a particular accession name (i.e. its aspect name; see NDEx documentation:
\url{https://home.ndexbio.org/data-model/}).
This name is used as class to handle different aspects by method dispatch.
This simplifies the extension of RCX for non-standard or self-defined aspects.

The CX-JSON is parsed to R data types using the \link{jsonlite} package as follows:

\code{jsonlite::fromJSON(cx, simplifyVector = FALSE)}

This results in a list of lists (of lists...) to avoid automatic data type conversions, which affect the correctness and
usability of the data. Simplified JSON data for example \link{NodeAttributes} would be coerced into a data.frame,
therefore the \code{value} column looses the format for data types other than \code{string}.

The \emph{jsonData} will be a list with only one element named by the aspect:
\verb{jsonData$<accessionName>}

To access the parsed data for example nodes, this can be done by \code{jsonData$nodes}.
The single aspects are then created using the corresponding \strong{create} functions and combined to an \link[=RCX-object]{RCX}
object using the corresponding \strong{update} functions.
}
\examples{
nodesJD = list(nodes=list(list("@id"=6, name="EGFR"),
                          list("@id"=7, name="CDK3")))
class(nodesJD) = c("nodes", class(nodesJD))

jsonToRCX(nodesJD, verbose=TRUE)
}
\seealso{
\link{rcxToJson}, \link{toCX}, \link{readCX}, \link{writeCX}
}
