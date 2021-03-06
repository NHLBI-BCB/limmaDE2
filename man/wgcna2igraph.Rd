% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wgcna2igraph.R
\name{wgcna2igraph}
\alias{wgcna2igraph}
\title{Generate an igraph object from wgcna output}
\usage{
wgcna2igraph(net, datExpr, top.n.edges = NA, modules2plot = NULL,
  colors2plot = NULL, kME.threshold = 0.75, adjacency.threshold = 0.1,
  adj.power = 6, verbose = T, min.edge = 2, node.size = 0,
  frame.color = NA, node.color = NA, edge.alpha = 0.5, edge.width = 1,
  returnNet = TRUE, ...)
}
\arguments{
\item{net}{WGCNA generated network. Usually from WGCNA::blockwiseModules}

\item{datExpr}{The expression dataset, transposed so that genes are columns
and individuals are rows.}

\item{modules2plot}{The names (usually colors) of the WGCNA modules to plot.
All elements of modules2plot must be in the first element of net.}

\item{colors2plot}{The colors for modules2plot. Must match the length of
modules2plot.}

\item{kME.threshold}{The kME threshold to retain a node}

\item{adjacency.threshold}{The adjacency threshold to retain an edge.}

\item{adj.power}{The power used to calculate the adjacency matrix}

\item{verbose}{The position of the legend. Defaults to the top right.}

\item{node.size}{If >0, plot the nodes with a given size.}

\item{frame.color}{If node.size > 0, can specify the color for node outlines}

\item{node.color}{If node.size > 0, can specify the color for nodes}

\item{edge.alpha}{Numeric [0-1] specifying the transparency of the edges}

\item{returnNet}{Should the network be returned? If FALSE, a list of the
genes and original module colors that were input is returned.}

\item{...}{additional arguments passed on WGCNA::adjacency}
}
\value{
an igraph network
}
\description{
\code{wgcna2igraph} Function to cull and plot WGCNA networks. Requires
igraph and WGCNA to be installed.
}
\details{
More here soon.
}
\examples{
\dontrun{
library(WGCNA)
library(igraph)
data(kidney) #' from simseq
counts<-kidney$counts
counts<-counts[sample(1:nrow(counts),1000),]
info<-with(kidney,
           data.frame(id = paste(replic, treatment, sep = "_"),
                      rep=replic,
                      Treatment=ifelse(treatment == "Tumor","tumor","cntr"),
                      stringsAsFactors=F))
colnames(counts)<-info$id
stats <- pipeLIMMA(counts = counts,
                   info = info,
                   block = NULL,
                   formula = "~ Treatment")

datExpr.1=t(stats$voom$E)
pow=6
net.1 = blockwiseModules(datExpr.1, power = pow,
                         maxBlockSize = 10000, deepSplit = 2,
                         minModuleSize = 10,
                         saveTOMs = FALSE,
                         verbose = F)

graph<-wgcna2igraph(net = net.1, datExpr = datExpr.1,
                    modules2plot = c("blue","green","turquoise","brown"),
                    colors2plot = c("orange","darkred","cyan","cornflowerblue"),
                    kME.threshold = 0.5, adjacency.threshold = 0.1,
                    adj.power = pow, verbose = T,
                    node.size = 0, frame.color = NA, node.color = NA,
                    edge.alpha = .5, edge.width =1)
plot(graph)
}

}

