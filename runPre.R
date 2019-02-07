

# runPre.R file to be executed before runFlip.R. This deletes all files in
# the results directory and creates a new directory for the results.


# Remove old results files if they exist
unlink('results', recursive = TRUE)

# Create new results directory if it does not exist
dir.create('results')


