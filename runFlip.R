
# This is code to simulate a coin flip. If running on local machine, set
# nflip to number of flips you want to record. If running on HPCC, set
# nflip to 1.


#### Simulation Parameters ####

nflip <- 3       # How many times to flip the code in this local simulation

sleepTime <- 0.1  # Extra sleep time to emulate more complicated simulation


#### Coin flip loop ####

# Loop not the most efficient approach, but helps show the process
# for a more complicated simulation.

for(i in 1:nflip){

  #### Flip the coin ####
  
  # Changing n will repeat the experiment n times (the equivolent of
  # parallel processing). Size is just the number of times to flip the
  # coin -- once for bernoulli distribution. Prob is the probability of
  # flipping a head.
  isHead <- rbinom(n = 1, 
                   size = 1, 
                   prob = 0.5)
  
  # SystemSleep to emulate longer running script...
  Sys.sleep(time = 0.1)
  
  
  #### Generate Output File Info ####
  
  # Generate name for output file; use date & time + random number so that
  # the file paths from multiple simulations are not overwritten
  
  # get and format the system time
  time <- Sys.time()
  timeString <- format(x = time, 
                       format = "%Y-%m-%d-%H-%M-%S")
  
  # generate a (rounde) random number to append to reduce overlap
  randomNumber <- round(runif(n = 1, 
                              min = 1e3, 
                              max = 1e4-1),
                        digits = 0)
  
  # Generate a file name and output file path for the result text file
  outFileName <- paste0(timeString, '_', randomNumber, '.txt')
  outPath <- file.path('results', outFileName)
  
  
  #### Create output file ####
  
  cat(isHead, file = outPath)
  
}


