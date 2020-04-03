per_lm_rates <- function(shape.data, phy){
data.2d <- two.d.array(shape.data)
phy.parts <- geomorph:::phylo.mat(data.2d, phy)
invC <- geomorph:::phy.parts$invC
D.mat <- geomorph:::phy.parts$D.mat
C <- geomorph:::phy.parts$C

global<-sig.calc(data.2d,invC,D.mat,Subset=TRUE)
###have to get the dim of shape data to replace this ppppppp
global.array1<-arrayspecs(global$R,p=dim(shape.data)[1],k=3)
rates.vector<-colSums(matrix(diag(global$R), nrow=3))


cols1<-colorRampPalette(c("#6e016b","#0c2c84","#225ea8","#005a32","#ffff00","#fe9929","#fc4e2a","red"))

cols<-cols1(100)

#calculate log rates:
x=(log10(rates.vector))
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
ratecolors <- sapply(x, whichColor, cols = cols, breaks = breaks)



rate_table <- tibble("Per_Lm_Rates" = rates.vector, "Log_Rates" = x, "Rate_Colors" = ratecolors)
return(rate_table)
}
