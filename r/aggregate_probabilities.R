# Aggregate some probability results from the computations

p <- read.csv('piecewise_shortage_pworst.csv')

p <- within(p,
            {
              Climate.Model <- factor(sub(pattern='\\.1\\.rcp..$',
                                          replacement='' ,p$Model))
              Emissions <- factor(sub(pattern='.*?(rcp..?).*$',
                                      replacement='\\1' ,p$Model))
            }
           )
levels(p$Climate.Model) <- list('CSIRO mk3.6'='csiro.mk3.6.0', 'GFDL-CM3'='gfdl.cm3',
                                'GFDL-ESM2M'='gfdl.esm2m', 'HadGEM2-ES'='hadgem2.es',
                                'MIROC5'='miroc5', 'MIROC-ESM-CHEM'='miroc.esm.chem')
levels(p$Emissions) <- list('RCP2.6'='rcp26', 'RCP4.5'='rcp45',
                            'RCP6.0'='rcp60', 'RCP8.5'='rcp85')

# Ensure they sum to exactly 1
sum.p <- aggregate(pworst.kl ~ Infrastructure, data=p, FUN=sum)
for(ii in sum.p$Infrastructure)
{
  p$pworst.kl[p$Infrastructure==ii] <- p$pworst.kl[p$Infrastructure==ii] / 
    sum.p[sum.p$Infrastructure==ii, 2]
}
rm(sum.p)

long.pmodel <- aggregate(pworst.kl ~ Infrastructure + Climate.Model + Emissions, data=p, FUN=sum)
pmodel <- dcast(long.pmodel[long.pmodel$Infrastructure=='IPR', ],
                Climate.Model ~ Emissions, value.var='pworst.kl',
                margins=TRUE, fun.aggregate=sum)
pmodel[,-1] <- round(pmodel[,-1], 4)
names(pmodel)[1] <- ''
print(pmodel)
write.table(pmodel, file='../tables/pworst_model_kl.tex',
            row.names=FALSE, quote=FALSE,
            sep=' & ', eol=' \\\\\n')

long.smodel <- aggregate(Shortage ~ Infrastructure + Climate.Model + Emissions, data=p, FUN=max)
smodel <- dcast(long.smodel[long.pmodel$Infrastructure=='IPR', ],
                Climate.Model ~ Emissions, value.var='Shortage')
names(smodel)[1] <- ''
print(smodel)
write.table(smodel, file='../tables/shortage_model_kl.tex',
            row.names=FALSE, quote=FALSE,
            sep=' & ', eol=' \\\\\n')