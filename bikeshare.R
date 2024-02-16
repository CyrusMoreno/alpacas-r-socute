# set working directory
setwd("path/to/csv/files")
# get working directory
getwd()

## load
dataframe<-read.csv("filename.csv")

head(df)
colnames(df)
nrow(df)
##get number of unique value in one column
length(unique(dataframe$column_name))


number_of_na <- sum(is.na(dataframe$column_name))
number_of_empty_cell <- sum(dataframe$column == "")


## mean
mean_value <- mean(df$column_name, na.rm = TRUE)


## median
median_value <- median(df$column_name, na.rm = TRUE)


## mode
getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_value <- getmode(df$column_name)

