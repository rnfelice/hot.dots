\name{per_lm_variance}
\alias{per_lm_variance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
per_lm_variance(shape.data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{shape.data}{
%%     ~~Describe \code{shape.data} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (shape.data)
{
    variances <- rowSums(apply(shape.data, c(1, 2), var))
    cols1 <- colorRampPalette(c("#6e016b", "#0c2c84", "#225ea8",
        "#005a32", "#ffff00", "#fe9929", "#fc4e2a", "red"))
    cols <- cols1(100)
    x = (log10(variances))
    xlims <- NULL
    tol <- 1e-06
    xlims <- range(x) + c(-tol, tol)
    nbin = 100
    breaks <- 0:nbin/nbin * (xlims[2] - xlims[1]) + xlims[1]
    whichColor <- function(p, cols, breaks) {
        i <- 1
        while (p >= breaks[i] && p > breaks[i + 1]) i <- i +
            1
        cols[i]
    }
    variancecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)
    variance_table <- tibble(Per_Lm_Variance = variances, Log_Variance = x,
        Variance_Colors = variancecolors)
    return(variance_table)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
