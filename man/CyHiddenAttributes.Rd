% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RCX-Cytoscape-HiddenAttributes.R
\name{CyHiddenAttributes}
\alias{CyHiddenAttributes}
\alias{createCyHiddenAttributes}
\title{Cytoscape hidden attributes}
\usage{
createCyHiddenAttributes(
  name,
  value,
  dataType = NULL,
  isList = NULL,
  subnetworkId = NULL
)
}
\arguments{
\item{name}{character; key of the attribute}

\item{value}{character or list of character; value of the attribute}

\item{dataType}{character (optional); data type of the attribute}

\item{isList}{logical (optional); a value should be considered as list}

\item{subnetworkId}{integer (optional); refers to the IDs of a subnetwork aspect, but left blank (or \code{NA}) if root-network}
}
\value{
\emph{CyHiddenAttributesAspect} object
}
\description{
This function is used to create Cytoscape hidden attributes aspects.
}
\details{
Cytoscape contributes aspects that organize subnetworks, attribute tables, and visual attributes for use by its own layout and
analysis tools. Furthermore are the aspects used in web-based visualizations like within the NDEx platform.

Besides network attributes, networks may have additional describing attributes originated from and used by Cytoscape.
They are also defined in a key-value like manner, with the name of the attribute as key.
The same attribute can also be defined for different \link[=CySubNetworks]{subnetworks} with different values.
The values itself may differ in their data types, therefore it is necessary to provide the values as a list of the single values
instead of a vector.

With \emph{isList} it can be set, if a value should be considered as a list. This is of minor significance while working solely with
\link[=RCX-object]{RCX} objects, unless it will be transformed to JSON. For some attributes it might be necessary that the values are encoded as
lists, even if they contain only one element (or even zero elements). To force an element to be encoded correctly, this parameter can
be used, for example: \verb{name="A", value=a, isList=T} will be encoded in JSON as \verb{A=["a"]}.
}
\examples{
## a minimal example
hiddenAttributes = createCyHiddenAttributes(
  name="A", 
  value="a"
)

## defining several properties at once
hiddenAttributes = createCyHiddenAttributes(
  name=c("A", "B"), 
  value=c("a","b")
)

## with characters and numbers mixed
hiddenAttributes = createCyHiddenAttributes(
  name=c("A","B"),
  value=list("a",3.14)
)

## force the number to be characters
hiddenAttributes = createCyHiddenAttributes(
  name=c("A","B"),
  value=list("a",3.14),
  dataType=c("character","character")
)

## with a list as input for one value
hiddenAttributes = createCyHiddenAttributes(
  name=c("A","B"),
  value=list(c("a1","a2"),
             "b")
)

## force "B" to be a list as well
hiddenAttributes = createCyHiddenAttributes(
  name=c("A","B"),
  value=list(c("a1","a2"),
             "b"),
  isList=c(TRUE,TRUE)
)

## with a subnetwork
hiddenAttributes = createCyHiddenAttributes(
  name=c("A","A"),
  value=c("a","a with subnetwork"),
  subnetworkId=c(NA,1)
)

## with all parameters
hiddenAttributes = createCyHiddenAttributes(
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
\code{\link{updateCyHiddenAttributes}};
}
