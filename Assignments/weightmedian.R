#My very first function on R, by @alejandrogarbis , based on the tutorial
#of derekfransk
#github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd


weightmedian <- function(directory, day) {
        #Content of the function
        files_list <- list.files(directory, full.names = TRUE)
        files_number <- length(files_list)
        #creates a list of files
        dat <- data.frame()
        for (i in 1:files_number) {
                dat <- rbind(dat, read.csv(files_list[i]))
                #loops through the files, rbinding them together
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]
        #subsets the rows that match the 'day' argument
        median(dat_subset[,"Weight"], na.rm = TRUE)
        #identifies the median weight while stripping out the NAs
}

