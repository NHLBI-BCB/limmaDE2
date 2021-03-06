% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/counts2Venn.R
\name{counts2Venn}
\alias{counts2Venn}
\title{Make venn diagrams based on significance classification}
\usage{
counts2Venn(x, cols, names, colors = "black", type = "both", legx = 0,
  legy = 0, ...)
}
\arguments{
\item{x}{A dataframe or matrix containing the binary significance calls
(1=significant, 0=NS)}

\item{cols}{A vector with the column names or numbers to use for plots.
Must be of length <=4.}

\item{names}{A vector of names for each of the venn circles.}

\item{colors}{A vector of colors to use for each cirlce.}

\item{type}{The type of diagram to plot. Euler = size of circles is
weighted. Both = both types. Any other call gives typical venn diagrams.}

\item{legx, legy}{Position of legend for plot type "limma" or "both"}

\item{...}{additional arguments passed to plot.}
}
\value{
generates a plot. Does not return anything
}
\description{
\code{counts2Venn} Take a binary significance classification matrix and
produce two types of venn diagrams.
}
\details{
given a binary significance classification matrix, run functions to
produce venn diagrams.
if scaled, runs venneuler::venneuler venn diagrams. Otherwise, runs
limma::vennCounts/vennDiagram
}
\examples{
\dontrun{
data(kidney) # from simseq
counts<-kidney$counts
counts<-counts[sample(1:nrow(counts),1000),]
info<-data.frame(rep=kidney$replic,
                 treatment=kidney$treatment)
stats<-pipeLIMMA(counts=counts, info=info,
   formula = " ~ treatment", block=NULL)
sig<-makeBinarySig(x= stats$stats, what="Pvalue")
counts2Venn(x=sig, cols=c(1), names=c("treatment"),
   colors=c("blue"),type="limma", legx=-3.3,legy=-3)
}
}

