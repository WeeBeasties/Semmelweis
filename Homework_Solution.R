library(tidyverse)

vienna <- read_csv("data/vienna_yearly.csv")
dublin <- read_csv("data/dublin_yearly.csv")

vienna$Hospital <- "Vienna"
vienna$Rate <- vienna$Deaths/vienna$Births*100

dublin$Hospital <- "Dublin"
dublin$Rate <- dublin$Deaths/dublin$Births*100

plotData <- rbind(vienna,dublin)

ggplot(plotData, aes(x=Year, y=Rate, colour=Hospital)) +
	scale_x_continuous(breaks = seq(1780, 1850, by = 10)) +
	scale_y_continuous(breaks = seq(0, 20, by = 2)) +
	geom_line(size=1.5) +
	labs(x="Date", y="Percent Maternal Deaths per Live Birth") +
	theme_classic() +
	scale_color_manual(values=c("dodgerblue", "firebrick")) +
	geom_vline(xintercept = 1823, linetype = "dotted") +
	annotate("text", x = 1821.5, y = 11, angle = 90, label = "Pathological Anatomy course initiated") +
	geom_vline(xintercept = 1847, linetype = "dotted") +
	annotate("text", x = 1848.2, y = 8.7, angle = 90, label = "Handwashing begun") +
	theme(legend.position = c(0.1, 0.8))

