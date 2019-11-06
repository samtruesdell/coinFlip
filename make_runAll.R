

# This script combines runPre, runFlip and runPost into a single file.
# Useful to have them all together for demonstration purposes since that's
# how we often write scripts. Didn't just copy and paste into a new document
# because this way any changes that are made in the files are preserved.

# Note that nFlip and sleepTime in runFlip.R are overwritten by this code
# when translating to runAll.R


# How many times to flip the code in this local simulation
nFlipUpdate <- 4

# Extra sleep time to emulate more complicated simulation (larger for
# HPCC example)
sleepTimeUpdate <- 30

# Read in each of the files
rPre <- readLines('runPre.R')
rFlip <- readLines('runFlip.R')
rPost <- readLines('runPost.R')


## edit the nFlip and sleepTime variables

# Identify the text used for assignment
nFlipAssign <- 'nFlip <- '
sleepTimeAssign <- 'sleepTime <- '

# find the indices
nFlipIdx <- grep(pattern = nFlipAssign, x = rFlip)
sleepTimeIdx <- grep(pattern = sleepTimeAssign, x = rFlip)

# make the change
rFlip[nFlipIdx] <- paste(nFlipAssign, nFlipUpdate)
rFlip[sleepTimeIdx] <- paste(sleepTimeAssign, sleepTimeUpdate)


# Create an object combining the three scripts
runAllObj <- c(rPre, rFlip, rPost)

# Write out the new R file
writeLines(runAllObj, con = 'runAll.R')




