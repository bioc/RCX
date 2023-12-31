% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Validate.R
\name{validate}
\alias{validate}
\alias{validate.default}
\alias{validate.NodesAspect}
\alias{validate.EdgesAspect}
\alias{validate.NodeAttributesAspect}
\alias{validate.EdgeAttributesAspect}
\alias{validate.NetworkAttributesAspect}
\alias{validate.CartesianLayoutAspect}
\alias{validate.CyGroupsAspect}
\alias{validate.CyVisualPropertiesAspect}
\alias{validate.CyVisualProperty}
\alias{validate.CyVisualPropertyProperties}
\alias{validate.CyVisualPropertyDependencies}
\alias{validate.CyVisualPropertyMappings}
\alias{validate.CyHiddenAttributesAspect}
\alias{validate.CyNetworkRelationsAspect}
\alias{validate.CySubNetworksAspect}
\alias{validate.CyTableColumnAspect}
\alias{validate.RCX}
\title{Validate RCX and its aspects}
\usage{
validate(x, verbose = TRUE)

\method{validate}{default}(x, verbose = TRUE)

\method{validate}{NodesAspect}(x, verbose = TRUE)

\method{validate}{EdgesAspect}(x, verbose = TRUE)

\method{validate}{NodeAttributesAspect}(x, verbose = TRUE)

\method{validate}{EdgeAttributesAspect}(x, verbose = TRUE)

\method{validate}{NetworkAttributesAspect}(x, verbose = TRUE)

\method{validate}{CartesianLayoutAspect}(x, verbose = TRUE)

\method{validate}{CyGroupsAspect}(x, verbose = TRUE)

\method{validate}{CyVisualPropertiesAspect}(x, verbose = TRUE)

\method{validate}{CyVisualProperty}(x, verbose = TRUE)

\method{validate}{CyVisualPropertyProperties}(x, verbose = TRUE)

\method{validate}{CyVisualPropertyDependencies}(x, verbose = TRUE)

\method{validate}{CyVisualPropertyMappings}(x, verbose = TRUE)

\method{validate}{CyHiddenAttributesAspect}(x, verbose = TRUE)

\method{validate}{CyNetworkRelationsAspect}(x, verbose = TRUE)

\method{validate}{CySubNetworksAspect}(x, verbose = TRUE)

\method{validate}{CyTableColumnAspect}(x, verbose = TRUE)

\method{validate}{RCX}(x, verbose = TRUE)
}
\arguments{
\item{x}{object to validate; \link[=RCX-object]{RCX} object or an aspect}

\item{verbose}{logical; whether to print the test results.}
}
\value{
logical; whether the object passed all tests.
}
\description{
Validate RCX objects and its aspects.
}
\details{
Different tests are performed on aspects and the RCX network.
This includes checks of the correct aspect structure, data types, uniqueness of IDs and attribute names,
presence of NA values, and references between the aspects.
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: Default

\item \code{NodesAspect}: Nodes

\item \code{EdgesAspect}: Edges

\item \code{NodeAttributesAspect}: Node attributes

\item \code{EdgeAttributesAspect}: Edge attributes

\item \code{NetworkAttributesAspect}: Network attributes

\item \code{CartesianLayoutAspect}: Cartesian layout

\item \code{CyGroupsAspect}: Cytoscape Groups

\item \code{CyVisualPropertiesAspect}: Cytoscape Visual Properties

\item \code{CyVisualProperty}: Cytoscape Visual Properties

\item \code{CyVisualPropertyProperties}: Cytoscape visual property: Properties

\item \code{CyVisualPropertyDependencies}: Cytoscape visual property: Dependencies

\item \code{CyVisualPropertyMappings}: Cytoscape visual property: Mappings

\item \code{CyHiddenAttributesAspect}: Cytoscape hidden attributes

\item \code{CyNetworkRelationsAspect}: Cytoscape network relations

\item \code{CySubNetworksAspect}: Cytoscape sub-networks

\item \code{CyTableColumnAspect}: Cytoscape table column aspect

\item \code{RCX}: The whole RCX object with all its aspects
}}

\examples{
## Read from a CX file
## reading the provided example network of the package
cxFile <- system.file(
 "extdata", 
 "Imatinib-Inhibition-of-BCR-ABL-66a902f5-2022-11e9-bb6a-0ac135e8bacf.cx", 
 package = "RCX"
)

rcx = readCX(cxFile)

## validate the network
validate(rcx)

## validate a single aspect
validate(rcx$nodes)
}
