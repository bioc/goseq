% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getlength.R
\name{getlength}
\alias{getlength}
\title{Retrieves Gene length data}
\usage{
getlength(genes, genome, id)
}
\arguments{
\item{genes}{A vector or list of the genes for which length information is
required.}

\item{genome}{A string identifying the genome that \code{genes} refer to.
For a list of supported organisms run \code{\link{supportedGenomes}}.}

\item{id}{A string identifying the gene identifier used by \code{genes}.
For a list of supported gene IDs run \code{\link{supportedGeneIDs}}.}
}
\value{
Returns a vector of the gene lengths, in the same order as
\code{genes}.  If length data is unavailable for a particular gene NA is
returned in that position.  The returned vector is intended for use with the
\code{bias.data} option of the \code{\link{nullp}} function.
}
\description{
Gets the length of each gene in a vector.
}
\details{
Length data is obtained from data obtained from the UCSC genome browser for
each combination of \code{genome} and \code{id}.  As fetching this data at
runtime is time consuming, a local copy of the length information for common
genomes and gene ID are included in the \pkg{geneLenDataBase} package.  This
function uses this package to fetch the required data.

The length of a gene is taken to be the median length of all its mature,
mRNA, transcripts.  It is always preferable to obtain length information
directly for the gene ID used to summarize your count data, rather than
converting IDs and then using the supplied databases.  Even when two genes
have a one-to-one mapping between different identifier conventions (which is
often not the case), they frequently refer to slightly different regions of
the genome with different lengths.  It is therefore recommended that the
user perform the full analysis in terms of only one gene ID, or manually
obtain their own length data for the identifier used to bin reads by gene.
}
\examples{

genes <- c("ENSG00000124208", 
           "ENSG00000182463", 
           "ENSG00000124201", 
           "ENSG00000124205", 
           "ENSG00000124207")
getlength(genes,'hg19','ensGene')

}
\seealso{
\code{\link{supportedGenomes}}, \code{\link{supportedGeneIDs}},
\code{\link{nullp}}, \pkg{geneLenDataBase}
}
\author{
Matthew D. Young \email{myoung@wehi.edu.au}
}
