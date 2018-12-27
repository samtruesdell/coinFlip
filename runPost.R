
# runPost.R reads in the results files created by runFlip.R, concatonates
# them into a vector and outputs a barplot.



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
jpeg(filename = 'results/coinFlipBarPlot.jpg')

  # plot the tabulated results
  barplot(height = resultsTab, 
          main = 'Tabulated Results',
          xlab = 'Coin reading',
          ylab = 'Frequency',
          names.arg = c('Tails', 'Heads'))

# close the jpeg file
dev.off()



