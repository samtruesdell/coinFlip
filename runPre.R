


### The code below is meant to set up the environment for the run. It  
### creates a new uniquely named directory for the results.


# Create new results directory tagged with date/time

# get and format the system time
time <- Sys.time()
timeString <- format(x = time, 
                     format = "%Y-%m-%d-%H-%M-%S")

# define a directory name
dirName <- paste('results', timeString, sep='_')
dir.create(dirName)

