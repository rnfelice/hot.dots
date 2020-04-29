\name{per_lm_rates}
\alias{per_lm_rates}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  Caclulate per landmark reates
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
per_lm_rates(shape.data, phy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{shape.data}{
%%     ~~Describe \code{shape.data} here~~
}
  \item{phy}{
%%     ~~Describe \code{phy} here~~
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
function (shape.data, phy)
{
    data.2d <- two.d.array(shape.data)
    phy.parts <- geomorph:::phylo.mat(data.2d, phy)
    invC <- geomorph:::phy.parts$invC
    D.mat <- geomorph:::phy.parts$D.mat
    C <- geomorph:::phy.parts$C
    global <- sig.calc(data.2d, invC, D.mat, Subset = TRUE)
    global.array1 <- arrayspecs(global$R, p = dim(shape.data)[1],
        k = 3)
    rates.vector <- colSums(matrix(diag(global$R), nrow = 3))
    cols1 <- colorRampPalette(c("#6e016b", "#0c2c84", "#225ea8",
        "#005a32", "#ffff00", "#fe9929", "#fc4e2a", "red"))
    cols <- cols1(100)
    x = (log10(rates.vector))
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
    ratecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)
    rate_table <- tibble(Per_Lm_Rates = rates.vector, Log_Rates = x,
        Rate_Colors = ratecolors)
    return(rate_table)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
