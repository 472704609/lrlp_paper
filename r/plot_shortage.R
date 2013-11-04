require(ggplot2)

source('plot_options.R')

shortage <- read.csv('shortages.csv')
shortage$Infrastructure <- ordered(shortage$Infrastructure, c('None','WWTP','IPR','RO'))
p <- qplot(x=Shortage, data=shortage, facets=~Infrastructure, fill=Population) + 
  xlab('Total Shortage (af)') +
  ylab('Count') +
  my.theme

ggsave(paste(folder, 'shortage_frequency', extension, sep=''), plot=p, width=width, height=0.67*width)