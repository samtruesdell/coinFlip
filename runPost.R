
# runPost.R reads in the results files created by runFlip.R, concatonates
# them into a vector and outputs a barplot.

# a change

#### Read in the output files and create a vector of coin flip results ####

# list files in results directory

resultFileNames <- list.files('results')


# Read in the results as a list

nResults <- length(resultFileNames)     # number of files to read in
resultsList <- list()                   # create empty list

for(i in 1:nResults){
  
  # determine the path for the individual file
  path <- file.path('results', resultFileNames[i])
  
  # read the individual file and save in the list
  resultsList[[i]] <- scan(file = path)
  
}

# Convert the results into a vector from a list
resultsVec <- unlist(resultsList)

# tabulate the results vector
resultsTab <- table(resultsVec)


#### Create a barplot of the results ####

# open a jpeg file
jpeg(filename = 'coinFlipBarPlot.jpg')

  par(mar = c(5,5,4,1))
  
  # plot the tabulated results
  barplot(height = resultsTab, 
          xlab = '',
          ylab = '',
          names.arg = c('Tails', 'Heads'),
          cex.names = 2,
          las = 1,
          cex.axis = 1.5)
  mtext(side = c(1,2,3),
        line = c(3.5, 3, 2),
        cex = 2.5,
        text = c('Coin reading', 'Frequency', 'Tabulated Results'))

# close the jpeg file
dev.off()



