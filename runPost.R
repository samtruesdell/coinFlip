
### The code below reads in the results files created by the flipping loop, 
### concatonates them into a vector and outputs a barplot.



#### Read in the output files and create a vector of coin flip results ####

# Identify which folder to store the results in. Assuming runPre was just
# executed (it should have been!), identify the results folder that was
# most recently created.
resNames <- grep(pattern = 'results', # look for files containing this
                 x = list.files(),    # all files in the working directory
                 value = TRUE)        # pring out the actual folder names

folder2use <- tail(sort(resNames), 1) # ID the most recent folder

# list files in results directory
resultFileNames <- list.files(folder2use)


# Read in the results as a list
nResults <- length(resultFileNames)     # number of files to read in
resultsList <- list()                   # create empty list ... efficiency-wise
                                        # should use numeric(nResults) here, 
                                        # but list() is often better for 
                                        # general applications.

for(i in 1:nResults){
  
  # determine the path for the individual file
  path <- file.path(folder2use, resultFileNames[i])
  
  # read the individual file and save in the list
  resultsList[[i]] <- scan(file = path, quiet = TRUE)
  
}

# Convert the results into a vector from a list
resultsVec <- unlist(resultsList)

# tabulate the results vector
resultsTab <- table(resultsVec)



#### Create a barplot of the results ####

# open a jpeg file
jpeg(filename = file.path(folder2use, 'coinFlipBarPlot.jpg'))

  par(mar = c(5,5,4,1))
  
  # plot the tabulated results
  barplot(height = resultsTab, 
          xlab = '',
          ylab = '',
          names.arg = c('Tails', 'Heads'),
          cex.names = 2,
          las = 1,
          cex.axis = 1.5)
  mtext(side = c(1, 2, 3),
        line = c(3.5, 3, 2),
        cex = 2.5,
        text = c('Coin reading', 'Frequency', 'Tabulated Results'))

# close the jpeg file
dev.off()

cat('><> ><> -- coin flip program complete -- <>< <><', '\n')

