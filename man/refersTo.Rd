% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AspectDependencies.R
\name{refersTo}
\alias{refersTo}
\alias{refersTo.default}
\alias{refersTo.EdgesAspect}
\alias{refersTo.NodeAttributesAspect}
\alias{refersTo.EdgeAttributesAspect}
\alias{refersTo.CartesianLayoutAspect}
\alias{refersTo.CyGroupsAspect}
\alias{refersTo.CyVisualPropertiesAspect}
\alias{refersTo.CySubNetworksAspect}
\title{Name of the property of an aspect that is an ID}
\usage{
refersTo(aspect)

\method{refersTo}{default}(aspect)

\method{refersTo}{EdgesAspect}(aspect)

\method{refersTo}{NodeAttributesAspect}(aspect)

\method{refersTo}{EdgeAttributesAspect}(aspect)

\method{refersTo}{CartesianLayoutAspect}(aspect)

\method{refersTo}{CyGroupsAspect}(aspect)

\method{refersTo}{CyVisualPropertiesAspect}(aspect)

\method{refersTo}{CySubNetworksAspect}(aspect)
}
\arguments{
\item{aspect}{an object of one of the aspect classes (e.g. NodesAspect, EdgesAspect, etc.)}
}
\value{
named list; Name of the refering property and aspect class name.
}
\description{
This function returns the name of the property and the aspect class it refers to.
As example, the aspect \emph{EdgesAspect} has the property \emph{source} that refers to the \emph{ids} of
the \emph{NodesAspect} aspect.
}
\details{
Uses method dispatch, so the default return is \emph{NULL} and only aspect classes that refer to other
aspects are implemented. This way it is easier to extend the data model.
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: of default returns \emph{NULL}

\item \code{EdgesAspect}: of EdgesAspect refers to id by \emph{source} and \emph{target}

\item \code{NodeAttributesAspect}: of NodeAttributesAspect refers to id by \emph{propertyOf} and to id by \emph{subnetworkId}

\item \code{EdgeAttributesAspect}: of EdgeAttributesAspect refers to id by \emph{propertyOf} and to id by \emph{subnetworkId}

\item \code{CartesianLayoutAspect}: of CartesianLayoutAspect refers to id by \emph{node} and to id by \emph{view}

\item \code{CyGroupsAspect}: of CyGroupsAspect refers to id by \emph{nodes} and to id by \emph{externalEdges} and \emph{internalEdges}

\item \code{CyVisualPropertiesAspect}: of CyVisualPropertiesAspect refers to id by \emph{appliesTo} of the sub-aspects

\item \code{CySubNetworksAspect}: of  refers to id by \emph{nodes} and to id by \emph{edges}
}}

\examples{
edges = createEdges(source = c(0,0), target = c(1,2))
refersTo(edges)
}
\seealso{
\code{\link[=hasIds]{hasIds()}}, \code{\link[=idProperty]{idProperty()}}, \code{\link[=referredBy]{referredBy()}}, \code{\link[=maxId]{maxId()}}
}
