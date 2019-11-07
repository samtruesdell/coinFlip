


source('make_runAll.R')
rAll <- readLines('runAll.R')



# Parallel front matter

pfm <- c('','','','',
         '### The code below initializes a \"cluster\" that uses multiple cores',
         '',
         '# Install necessary libraries for parallel processing',
         'library(doParallel)',
         'library(foreach)',
         '',
         '# How many cores does the machine have?',
         'ncore <- detectCores()',
         '',
         '# Create a cluster, which means "a set of copies of R running in ',
         '# parallel and communicating over sockets". Leave one core available',
         '# for doing other things. The PSOCK cluster creates completely new instances',
         '# of R whereas the "FORK" version copies the environment up to that point.',
         'clust <- makeCluster(ncore-1, type = \'PSOCK\')',
         '',
         '# Tell the foreach packages about the cluster you just made',
         'registerDoParallel(clust)')



# Replace for loop
rAll <- sub(pattern = 'for\\(i in 1:nFlip\\)\\{', 
                    replacement = 'foreach(1:nFlip) %dopar% {',
                    x = rAll)


# Replace loop progress indicator (can't use 'i' here)
rAll <- sub(pattern = 'cat\\(\'Completed rep\', i',
               replacement = '# cat\\(\'Completed rep\', i',
               x = rAll)


# Create an object combining the scripts
runRClusterObj <- c(pfm, rAll)

# Write out the new R file
writeLines(runRClusterObj, con = 'runRCluster.R')


