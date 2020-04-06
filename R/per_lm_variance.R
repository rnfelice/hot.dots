#' @export
per_lm_variance <- function(shape.data){

  variances<-rowSums(apply(shape.data ,c(1,2),var))


  cols1<-colorRampPalette(c("#6e016b","#0c2c84","#225ea8","#005a32","#ffff00","#fe9929","#fc4e2a","red"))

  cols<-cols1(100)

  #calculate log rates:
  x=(log10(variances))
  xlims<-NULL
  tol <- 1e-06
  xlims <- range(x) + c(-tol, tol)
  nbin=100
  breaks <- 0:nbin/nbin * (xlims[2] - xlims[1]) + xlims[1]
  whichColor <- function(p, cols, breaks) {
    i <- 1
    while (p >= breaks[i] && p > breaks[i + 1]) i <- i +
        1
    cols[i]
  }
  variancecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)



  variance_table <- tibble("Per_Lm_Variance" = variances, "Log_Variance" = x, "Variance_Colors" = variancecolors)
  return(variance_table)
}
