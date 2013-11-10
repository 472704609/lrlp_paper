require(ggplot2)

source('plot_options.R')

shortage <- read.csv('piecewise_shortage_pworst.csv')
shortage$Infrastructure <- ordered(shortage$Infrastructure, c('None','WWTP','IPR','RO'))
p <- qplot(x=Shortage, data=shortage, facets=~Infrastructure, fill=Population) + 
  xlab('Total Shortage (af)') +
  ylab('Count') +
  scale_fill_brewer(palette="Set3") +
  my.theme

ggsave(paste(folder, 'piecewise_shortage_frequency', extension, sep=''), plot=p, width=width, height=0.67*width)

shortage <- read.csv('linear_shortage_pworst.csv')
shortage$Infrastructure <- ordered(shortage$Infrastructure, c('None','WWTP','IPR','RO'))
p <- qplot(x=Shortage, data=shortage, facets=~Infrastructure, fill=Population) + 
  xlab('Total Shortage (af)') +
  ylab('Count') +
  scale_fill_brewer(palette="Set3") +
  my.theme

ggsave(paste(folder, 'linear_shortage_frequency', extension, sep=''), plot=p, width=width, height=0.67*width)


shortage <- read.csv('combined_shortage_pworst.csv')
shortage$Infrastructure <- ordered(shortage$Infrastructure, c('None','WWTP','IPR','RO'))
shortage <- within(shortage,
                   {Type=factor(paste(Population, ' pop, ', gsub('^.*\\.','', Model), ' fit', sep=''))})
p <- qplot(x=Shortage, data=shortage, facets=~Infrastructure, fill=Type) + 
  xlab('Total Shortage (af)') +
  ylab('Count') +
  scale_fill_brewer(palette="Set3") +
  my.theme

ggsave(paste(folder, 'combined_shortage_frequency', extension, sep=''), plot=p, width=width, height=0.5*width)
  