\encoding{ISO-8859-2}
\name{complete_network}
\alias{complete_network}
\title{compare two given networks (original and augmented, presented as undirected graphs) using a path analysis}
\description{This function computes the number of paths in each category for all pairs of nodes of the original network.}
\usage{
	complete_network(g1,g2,
					     taxnames,
					     maxdistance=0,
					     maxtime=3600,
					     maxnode=0,
					     verbose=FALSE,
					     file="log.txt",
					    maxcores=1,
					    node1,
					    node2
					) 
}
%\usage{complete_network(g1,g2,taxnames='default',maxdistance=0, maxtime=3600,maxnode=0, verbose=FALSE, filename="log.txt", maxcores=0, node1="default", node2="default") }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{g1}{the original network X}
  \item{g2}{the augmented network Y with additional nodes (all the original nodes from X must be present in the augmented network Y)}
  \item{taxnames}{the taxon name of the nodes added to the original graph (default: we select all nodes that are not in g1)}
  \item{maxnode}{the maximum number of augmented nodes in network Y to take into account (default=0, no maximum number of augmented nodes to take into account. The augmented nodes are sorted by distance to the investigated node pairs by the algorithm.)} 	  
  \item{maxtime}{the maximum search time per pathway (default=3600 seconds)} 
  \item{maxdistance}{the maximum search distance to the added nodes in network Y (default=0, no maximum distance for augmented nodes to take into account)} 	
  \item{verbose}{flag to save into a file additionnal informations regarding the obtained paths (default=FALSE, the file name should be indicated)}
  \item{file}{filename to save the additionnal informations}
  \item{node1}{if node1 is set,we look only for paths starting from node1}
  \item{node2}{if node2 is set, we will only look at the paths starting at node1 and ending at node2}
  \item{maxcores}{maximum number of cores to use (default=1, use 0 to use half of the total cores available )}
}

\value{This function returns the number of paths of each category: \emph{Shortcuts}, \emph{Detours}, \emph{Dead ends}, \emph{Equal} paths and disconnected nodes.\cr \cr If some of the augmented nodes are not visited because of the limits defined by \code{maxnode}, \code{maxtime} or \code{maxdistance}, a path can also be classified as \emph{Detour or Dead End}.}

%\author{Etienne Lord, Margaux Le Cam, Eric Bapteste, Vladimir Makarenkov  and Francois-Joseph Lapointe}

\examples{
## Searching the sample data (containing 11 original nodes and 3 augmented nodes)
data(Sample_1)
result <- complete_network(g1, g2)
print(result)
## Results:
##
##          disconnected nodes shortcuts equals detours dead ends
##user.self                 18         4      5      26         2
##          Dead ends or detour total user time system time real time
##user.self                   0    55     0.997       0.111     2.186
##
## Searching for path x1 -> x2 in the sample data
\dontrun{complete_network(g1, g2,node1="x1", node2="x2")}
##
## Specifying a limit on time (60 seconds) and maximum distance (2) of 
## an original node to an augmented node
\dontrun{complete_network(g1, g2, maxtime=60, maxdistance=2)}
}

%\keyword{ }

