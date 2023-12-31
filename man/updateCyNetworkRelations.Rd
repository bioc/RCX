% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RCX-Cytoscape-NetworkRelations.R
\name{updateCyNetworkRelations}
\alias{updateCyNetworkRelations}
\alias{updateCyNetworkRelations.CyNetworkRelationsAspect}
\alias{updateCyNetworkRelations.RCX}
\title{Update Cytoscape network relations}
\usage{
updateCyNetworkRelations(
  x,
  cyNetworkRelations,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  ...
)

\method{updateCyNetworkRelations}{CyNetworkRelationsAspect}(
  x,
  cyNetworkRelations,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  ...
)

\method{updateCyNetworkRelations}{RCX}(
  x,
  cyNetworkRelations,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  checkReferences = TRUE,
  ...
)
}
\arguments{
\item{x}{\link[=RCX-object]{RCX} or \code{\link{CySubNetworks}} object; (to which the new network relations will be added)}

\item{cyNetworkRelations}{\code{\link{CySubNetworks}} object; (the network relations, that will be added)}

\item{replace}{logical; if existing values are updated (or ignored)}

\item{stopOnDuplicates}{logical; whether to stop, if duplicates in the \emph{child} column are found}

\item{...}{additional parameters}

\item{checkReferences}{logical; whether to check if references to other aspects are present in the \link[=RCX-object]{RCX} object}
}
\value{
\code{\link{CyNetworkRelations}} or \link[=RCX-object]{RCX} object with added network relations
}
\description{
This functions add network relations in the form of a \code{\link{CyNetworkRelations}} object to an other \code{\link{CyNetworkRelations}} or an
\link[=RCX-object]{RCX} object.
}
\details{
Cytoscape subnetworks allow to group a set of nodes and corresponding edges together, and network relations define the relations between those
networks.
\code{\link{CyNetworkRelations}} objects can be added to an \link[=RCX-object]{RCX} or an other \code{\link{CyNetworkRelations}} object.

When network relations are added to a \code{\link{CyNetworkRelations}} or a \link[=RCX-object]{RCX} object some conflicts may rise, since the aspects
might use the same child IDs.
If the aspects do not share any child IDs, the two aspects are simply combined, otherwise, the properties of the child are updated.
If that is not wanted, the updating can be prevented by setting \emph{replace} to \code{FALSE}.
Furthermore, if duplicated properties are considered as a preventable mistake, an error can be raised by setting \emph{stopOnDuplicates}
to \code{TRUE}. This forces the function to stop and raise an error, if duplicated child IDs are present.
}
\examples{
## For CyNetworkRelationsAspects: 
## prepare some aspects:
cyNetworkRelations1 = createCyNetworkRelations(
  child = c(1,2),
  parent = c(NA,1),
  name = c("Network A",
           "View A"),
  isView = c(FALSE, TRUE)
)

cyNetworkRelations2 = createCyNetworkRelations(
  child = 2,
  name = "View B",
  isView = TRUE
)

## update the duplicated child
cyNetworkRelations3 = updateCyNetworkRelations(cyNetworkRelations1, 
                                               cyNetworkRelations2)

## keep old child values
cyNetworkRelations3 = updateCyNetworkRelations(cyNetworkRelations1, 
                                               cyNetworkRelations2,
                                               replace=FALSE)

## Raise an error if duplicate keys are present
try(updateCyNetworkRelations(cyNetworkRelations1, 
                             cyNetworkRelations2,
                             stopOnDuplicates=TRUE))
## =>ERROR: 
## Elements of "child" (in updateCyNetworkRelations) 
## must not contain duplicates!

## For RCX
## prepare RCX object:
nodes = createNodes(name = c("a","b","c","d","e","f"))
edges = createEdges(source=c(1,2,0,0,0,2), 
                    target=c(2,3,1,2,5,4))
rcx = createRCX(nodes, edges)
cySubNetworks = createCySubNetworks(
  id = c(1,2),
  nodes = list("all", c(1,2,3)),
  edges = list("all", c(0,2))                    
)
rcx = updateCySubNetworks(rcx, cySubNetworks)

## add a network relation
rcx = updateCyNetworkRelations(rcx, cyNetworkRelations1)

## add an additional relation (View A is replaced by B)
rcx = updateCyNetworkRelations(rcx, cyNetworkRelations2)

## create a relation with a not existing subnetwork...
cyNetworkRelations3 = createCyNetworkRelations(
  child = 9
)

## ...and try to add them
try(updateCyNetworkRelations(rcx, cyNetworkRelations3))
## =>ERROR: 
## Provided IDs of "additionalNetworkRelations$child" (in addCyNetworkRelations) 
## don't exist in "rcx$cySubNetworks$id"

## create a relation with a not existing parent subnetwork...
cyNetworkRelations4 = createCyNetworkRelations(
  child = 1,
  parent = 9
)

## ...and try to add them
try(updateCyNetworkRelations(rcx, cyNetworkRelations4))
## =>ERROR: 
## Provided IDs of "additionalNetworkRelations$parent" (in addCyNetworkRelations) 
## don't exist in "rcx$cySubNetworks$id"
}
