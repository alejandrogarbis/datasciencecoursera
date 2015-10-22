#My second function on R, by @alejandrogarbis , based on the tutorial
#of derekfransk
#github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd


pollutantmean <- function(directory, pollutant, id = 1:332) {
        #Content of the function
        files_list <- list.files(directory, full.names = TRUE)
               #creates a list of files
        dat <- data.frame()
        for (i in id) {
                dat <- rbind(dat, read.csv(files_list[i]))
                #loops through the files, rbinding them together
        }
        #subsets the rows that match the 'day' argument
        mean(dat[,pollutant], na.rm = TRUE)
        #identifies the median weight while stripping out the NAs
}