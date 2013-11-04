# Set up basic plotting options

# Location of saved files
folder <- '../images/'
# .pdf images may be better for a paper, but can take a while to load for a talk
extension <- '.pdf'

color <- 'darkolivegreen4'
linecolor <- 'darkred'

# Size fixing options
aspectratio <- 2/(1+sqrt(5))
width <- (8.5-2*1) # Paper width with 1" margins
height <- 0.75*width
my.theme <- theme_bw(base_size=12) + 
            theme(aspect.ratio = aspectratio )