% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RCX-NodeEdgeNetworkAttributes.R
\name{updateNodeAttributes}
\alias{updateNodeAttributes}
\alias{updateNodeAttributes.NodeAttributesAspect}
\alias{updateNodeAttributes.RCX}
\title{Update node attributes}
\usage{
updateNodeAttributes(
  x,
  nodeAttributes,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  ...
)

\method{updateNodeAttributes}{NodeAttributesAspect}(
  x,
  nodeAttributes,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  ...
)

\method{updateNodeAttributes}{RCX}(
  x,
  nodeAttributes,
  replace = TRUE,
  stopOnDuplicates = FALSE,
  checkReferences = TRUE,
  ...
)
}
\arguments{
\item{x}{\link[=RCX-object]{RCX} or \code{\link{NodeAttributes}} object; (to which the new node attributes will be added)}

\item{nodeAttributes}{\code{\link{NodeAttributes}} object; (the new aspect, that will be added)}

\item{replace}{logical; if existing values are updated (or ignored)}

\item{stopOnDuplicates}{logical; whether to stop, if duplicates in \emph{propertyOf} and \emph{name} (and \emph{subnetworkId} if present) columns are found}

\item{...}{additional parameters}

\item{checkReferences}{logical; whether to check if references to other aspects are present in the \link[=RCX-object]{RCX} object}
}
\value{
\code{\link{NodeAttributes}} or \link[=RCX-object]{RCX} object with added node attributes
}
\description{
This functions add node attributes in the form of a \code{\link{NodeAttributes}} object to an \link[=RCX-object]{RCX} or an other
\code{\link{NodeAttributes}} object.
}
\details{
Nodes may have additional attributes besides a name and a representation, and are represented as \code{\link{NodeAttributes}} objects.
\code{\link{NodeAttributes}} objects can be added to an \link[=RCX-object]{RCX} object or an other \code{\link{NodeAttributes}} object.
The \emph{propertyOf} parameter references the node IDs to which the attributes belong to. When adding an \code{\link{NodeAttributes}} object
to an \link[=RCX-object]{RCX} object, those IDs must be present in the \code{\link{Nodes}} aspect, otherwise an error is raised.

In the case, that a \code{\link{NodeAttributes}} object is added to an other, or the \link[=RCX-object]{RCX} object already contains a
\code{\link{NodeAttributes}} object, some attributes might be present in both. By default, the attributes are updated with the values
of the latest one. This can prevented setting the \emph{replace} parameter to \code{FALSE}, in that case only new attributes are added and
the existing attributes remain untouched.

Furthermore, if duplicated attributes are considered as a preventable mistake, an error can be raised by setting \emph{stopOnDuplicates}
to \code{TRUE}. This forces the function to stop and raise an error, if duplicated attributes are present.
}
\examples{
## For NodeAttributesAspects: 
## prepare some aspects:
nodeAttributes1 = createNodeAttributes(
  propertyOf=c(1,1,1,1),
  name=c("A","A","B","B"),
  value=list(c("a1","a2"),
             "a with subnetwork",
             "b",
             "b with subnetwork"),
  isList=c(TRUE,FALSE,TRUE,FALSE),
  subnetworkId=c(NA,1,NA,1)
)

## A is updated, C is new 
nodeAttributes2 = createNodeAttributes(
  propertyOf=c(1,1,1),
  name=c("A","A","C"),
  value=list("new a",
             "new a with subnetwork",
             c(1,2)),
  subnetworkId=c(NA,1,NA)
)

## Simply update with new values
nodeAttributes3 = updateNodeAttributes(nodeAttributes1, nodeAttributes2)

## Ignore already present keys
nodeAttributes4 = updateNodeAttributes(nodeAttributes1, nodeAttributes2, 
                                       replace=FALSE)

## Raise an error if duplicate keys are present
try(updateNodeAttributes(nodeAttributes1, nodeAttributes2, 
                         stopOnDuplicates=TRUE))
## =>ERROR: 
## Elements of "propertyOf", "name" and "subnetworkId" (in addNodeAttributes)
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

## add the node attributes, even if no subnetworks are present
rcx = updateNodeAttributes(rcx, nodeAttributes1, checkReferences=FALSE)

## add the node attributes
rcx = updateNodeAttributes(rcx, nodeAttributes1)

## add additional node attributes and update existing
rcx = updateNodeAttributes(rcx, nodeAttributes2)

## create node attributes for a not existing node...
nodeAttributes3 = createNodeAttributes(propertyOf=9, 
                                       name="A", 
                                       value="a")
## ...and try to add them
try(updateNodeAttributes(rcx, nodeAttributes3))
## =>ERROR: 
## Provided IDs of "additionalAttributes$propertyOf" (in addNodeAttributes)
## don't exist in "rcx$nodes$id"
}
\seealso{
\code{\link{EdgeAttributes}}, \code{\link{NetworkAttributes}}
}
