% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RCX.R
\name{RCX-object}
\alias{RCX-object}
\alias{createRCX}
\title{Create an RCX object from aspects}
\usage{
createRCX(
  nodes,
  edges,
  nodeAttributes,
  edgeAttributes,
  networkAttributes,
  cartesianLayout,
  cyGroups,
  cyVisualProperties,
  cyHiddenAttributes,
  cyNetworkRelations,
  cySubNetworks,
  cyTableColumn,
  checkReferences = TRUE
)
}
\arguments{
\item{nodes}{\code{\link{Nodes}} aspect;}

\item{edges}{\code{\link{Edges}} aspect (optional);}

\item{nodeAttributes}{\code{\link{NodeAttributes}} aspect (optional);}

\item{edgeAttributes}{\code{\link{EdgeAttributes}} aspect (optional);}

\item{networkAttributes}{\code{\link{NetworkAttributes}} aspect (optional);}

\item{cartesianLayout}{\code{\link{CartesianLayout}} aspect (optional);}

\item{cyGroups}{\code{\link{CyGroups}} aspect (optional);}

\item{cyVisualProperties}{\code{\link{CyVisualProperties}} aspect (optional);}

\item{cyHiddenAttributes}{\code{\link{CyHiddenAttributes}} aspect (optional);}

\item{cyNetworkRelations}{\code{\link{CyNetworkRelations}} aspect (optional);}

\item{cySubNetworks}{\code{\link{CySubNetworks}} aspect (optional);}

\item{cyTableColumn}{\code{\link{CyTableColumn}} aspect (optional);}

\item{checkReferences}{logical; whether to check if references to other aspects are present in the \link[=RCX-object]{RCX} object}
}
\value{
RCX object
}
\description{
An RCX object consists of several aspects, but at least one node in the \link[=Nodes]{nodes} aspect.
The network can either created by creating every single aspect first and the create the network
with all aspects present, or by creating the aspect only with the nodes and adding the remaining
aspects one by one.
}
\details{
\code{vignette("01. RCX - an R package implementing the Cytoscape Exchange (CX) format", package = "RCX")}
\code{vignette("02. Creating RCX from scratch", package = "RCX")}
\code{vignette("Appendix: The RCX and CX Data Model", package = "RCX")}
}
\examples{
## minimal example
rcx = createRCX(createNodes())

## create by aspect
nodes = createNodes(name = c("a","b","c"))
edges = createEdges(source=c(0,0), target=c(1,2))

nodeAttributes = createNodeAttributes(
  propertyOf=c(1,1),
  name=c("A","B"),
  value=c("a","b")
)

edgeAttributes = createEdgeAttributes(
  propertyOf=c(0,0), 
  name=c("A", "B"), 
  value=c("a","b")
)

networkAttributes = createNetworkAttributes(
  name=c("A","B"),
  value=list("a",3.14)
)

cartesianLayout = createCartesianLayout(
  node=c(0, 1),
  x=c(5.5, 110.1), 
  y=c(200.3, 210.2)
)

cyGroups = createCyGroups(
  name = c("Group One", "Group Two"),
  nodes = list(c(0,1), 0)                   
)

vpPropertyP = createCyVisualPropertyProperties(c(NODE_BORDER_STROKE="SOLID"))
vpPropertyD = createCyVisualPropertyDependencies(c(nodeSizeLocked="false"))
vpPropertyM = createCyVisualPropertyMappings(c(NODE_FILL_COLOR="CONTINUOUS"), 
                                             "COL=directed,T=boolean,K=0=true,V=0=ARROW")
vpProperty = createCyVisualProperty(properties=vpPropertyP, 
                                    dependencies=vpPropertyD, 
                                    mappings=vpPropertyM)

cyVisualProperties = createCyVisualProperties(nodes=vpProperty)

cyHiddenAttributes = createCyHiddenAttributes(
  name=c("A","B"),
  value=list(c("a1","a2"), "b")
)

cyNetworkRelations = createCyNetworkRelations(
  child = c(0,1),
  name = c("Network A", NA)
)

cySubNetworks = createCySubNetworks(
  nodes = list("all", c(0,1,2)),
  edges = list("all", c(0,1))                    
)

cyTableColumn = createCyTableColumn(
  appliesTo=c("nodes","edges","networks"),
  name=c("weight","weight","collapsed"),
  dataType=c("double","double","boolean")
)

rcx = createRCX(nodes, edges,
                nodeAttributes, edgeAttributes,
                networkAttributes, 
                cartesianLayout,
                cyGroups, 
                cyVisualProperties, 
                cyHiddenAttributes, 
                cyNetworkRelations, 
                cySubNetworks, 
                cyTableColumn)

## create all at once
rcx = createRCX(
  createNodes(name = c("a","b","c")), 
  createEdges(source=c(0,0), target=c(1,2)),
  createNodeAttributes(
    propertyOf=c(1,1),
    name=c("A","B"),
    value=c("a","b")
  ), 
  createEdgeAttributes(
    propertyOf=c(0,0), 
    name=c("A", "B"), 
    value=c("a","b")
  ),
  networkAttributes = createNetworkAttributes(
    name=c("A","B"),
    value=list("a",3.14)
  ), 
  cartesianLayout = createCartesianLayout(
    node=c(0, 1),
    x=c(5.5, 110.1), 
    y=c(200.3, 210.2)
  ),
  createCyGroups(
    name = c("Group One", "Group Two"),
    nodes = list(c(0,1), 0)                   
  ), 
  createCyVisualProperties(
    nodes=createCyVisualProperty(
      properties=createCyVisualPropertyProperties(
        c(NODE_BORDER_STROKE="SOLID")
      ), 
      dependencies=createCyVisualPropertyDependencies(
        c(nodeSizeLocked="false")
      ), 
      mappings=createCyVisualPropertyMappings(
        c(NODE_FILL_COLOR="CONTINUOUS"), 
        "COL=directed,T=boolean,K=0=true,V=0=ARROW")
    )
  ), 
  createCyHiddenAttributes(
    name=c("A","B"),
    value=list(c("a1","a2"), "b")
  ), 
  createCyNetworkRelations(
    child = c(0,1),
    name = c("Network A", NA)
  ), 
  createCySubNetworks(
    nodes = list("all", c(0,1,2)),
    edges = list("all", c(0,1))                    
  ), 
  createCyTableColumn(
    appliesTo=c("nodes","edges","networks"),
    name=c("weight","weight","collapsed"),
    dataType=c("double","double","boolean")
  )
)
}
