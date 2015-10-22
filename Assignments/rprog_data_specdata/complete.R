#My third function on R, by @alejandrogarbis , based on the tutorial
#of derekfransk
#github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd


complete <- function(directory, id = 1:332) {
        #Content of the function
        files_list <- list.files(directory, full.names = TRUE)
        #creates a list of files
        dat <- data.frame()
        for (i in id) {
                tmp <- read.csv(files_list[i])
                nobs <- sum(complete.cases(tmp))
                nobs_row <-c(i,nobs)
                dat <- rbind(dat, nobs_row)
        }
        names(dat) <- c("id", "nobs")
        print(dat)
}
