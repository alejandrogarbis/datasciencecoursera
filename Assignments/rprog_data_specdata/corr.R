#My 4th on R, by @alejandrogarbis , based on the tutorial
#of derekfransk
#github.com/rdpeng/practice_assignment/blob/master/practice_assignment.rmd


corr <- function (directory, threshold = 0) {
        files_list <- list.files(directory, full.names = TRUE)
        files_number <- length(files_list)
        cr <- vector()
        for (i in 1:files_number) {
        df <- read.csv(files_list[i])
        cc <- sum(complete.cases(df))
        if(cc > threshold) {
                tmp_cr <- c(cor(df$sulfate, df$nitrate, use = "complete"))
                        cr <- c(cr,tmp_cr)
                        }
        }
        cr
 }
