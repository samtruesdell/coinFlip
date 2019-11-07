

# This script combines runPre, runFlip and runPost into a single file.
# Useful to have them all together for demonstration purposes since that's
# how we often write scripts. Didn't just copy and paste into a new document
# because this way any changes that are made in the files are preserved.


# Read in each of the files
rPre <- readLines('runPre.R')
rFlip <- readLines('runFlip.R')
rPost <- readLines('runPost.R')


# Create an object combining the three scripts
runAllObj <- c(rPre, rFlip, rPost)

# Write out the new R file
writeLines(runAllObj, con = 'runAll.R')




