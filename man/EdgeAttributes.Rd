% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RCX-NodeEdgeNetworkAttributes.R
\name{EdgeAttributes}
\alias{EdgeAttributes}
\alias{createEdgeAttributes}
\title{Edge attributes}
\usage{
createEdgeAttributes(
  propertyOf,
  name,
  value,
  dataType = NULL,
  isList = NULL,
  subnetworkId = NULL
)
}
\arguments{
\item{propertyOf}{integer; reference to \link[=Edges]{edge ids}}

\item{name}{character; key of the attribute}

\item{value}{character; value of the attribute}

\item{dataType}{character (optional); data type of the attribute}

\item{isList}{logical (optional); a value should be considered as list}

\item{subnetworkId}{integer (optional); reference to \link[=CySubNetworks]{subnetwork id}}
}
\value{
\emph{EdgeAttributesAspect} object
}
\description{
This function creates an aspect for additional attributes of edges.
}
\details{
Edges may have additional attributes besides a name and a representation. Those additional attributes reference a edge by its id and
are defined in a key-value like manner, with the name of the attribute as key. The same attribute can also be defined for different
\link[=CySubNetworks]{subnetworks} with different values.
The values itself may also differ in their data types, therefore it is necessary to provide the values
as a list of the single values instead of a vector.

With \emph{isList} it can be set, if a value should be considered as a list. This is of minor significance while working solely with
\link[=RCX-object]{RCX} objects, unless it will be transformed to JSON. For some attributes it might be necessary that the values are encoded as
lists, even if they contain only one element (or even zero elements). To force an element to be encoded correctly, this parameter can
be used, for example: \verb{name="A", value=a, isList=T} will be encoded in JSON as \verb{A=["a"]}.
}
\note{
The \emph{propertyOf} parameter references the edge ids to which the attributes belong to. When adding an EdgeAttributesAspect object
to an \link[=RCX-object]{RCX} object, those ids must be present in the \code{\link{Edges}} aspect, otherwise an error is raised.
}
\examples{
## a minimal example
edgeAttributes = createEdgeAttributes(
  propertyOf=1, 
  name="A", 
  value="a"
)

## defining several properties at once
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1), 
  name=c("A", "B"), 
  value=c("a","b")
)

## with characters and numbers mixed
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1),
  name=c("A","B"),
  value=list("a",3.14)
)

## force the number to be characters
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1),
  name=c("A","B"),
  value=list("a",3.14),
  dataType=c("character","character")
)

## with a list as input for one value
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1),
  name=c("A","B"),
  value=list(c("a1","a2"),
             "b")
)

## force "B" to be a list as well
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1),
  name=c("A","B"),
  value=list(c("a1","a2"),
             "b"),
  isList=c(TRUE,TRUE)
)

## with a subnetwork
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1),
  name=c("A","A"),
  value=c("a","a with subnetwork"),
  subnetworkId=c(NA,1)
)

## with all parameters
edgeAttributes = createEdgeAttributes(
  propertyOf=c(1,1,1,1),
  name=c("A","A","B","B"),
  value=list(c("a1","a2"),
             "a with subnetwork",
             "b",
             "b with subnetwork"),
  isList=c(TRUE,FALSE,TRUE,FALSE),
  subnetworkId=c(NA,1,NA,1)
)
}
\seealso{
\code{\link{updateEdgeAttributes}}
}
