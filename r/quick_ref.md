***[Go back to README.md](/README.md)***

## Quick Reference

It seems that some functions' documentation aren't readily available[^1].

### Neat stuff

###### List all dataset available [:thought_balloon:](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/data)
```
data()
```
###### How to check your R version [:thought_balloon:](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/R.Version)
```
R.version

  ...
version.string R version 4.1.3 (2022-03-10)
  ..

```

###### How to change working directory [:thought_balloon:](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/getwd)
```
setwd("~Path-to-file_directory")
```

> you can also use getwd to output currect working directory

###### How to load csv file
```
dataframe_name_you_want<-read.csv("filename")
```
> you can also use read_csv but this require loading readr package

> you need to be in the correct working directory to before you can use this


### Querying, filtering, sampling

###### Inspecting your data [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.3/topics/glimpse)
```
glimpse(dataframe)
```

> let you see column names and their type  

###### Check first row and last row [:thought_balloon:](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/head)
```
head(dataframe)
tail(dataframe)
```


###### Display the column names [:thought_balloon:](https://www.rdocumentation.org/packages/gpuR/versions/2.0.3/topics/colnames)
```
colnames(df)

[1] "ride_id"            "rideable_type"      "started_at"         "ended_at"           "start_station_name" "start_station_id"  
[7] "end_station_name"   "end_station_id"     "start_lat"          "start_lng"          "end_lat"            "end_lng"           
[13] "member_casual"  
```
> we use 202004-divvy-tripdata.csv from Case 1: How does a bike-share navigate speedy success?  see https://cyrusmoreno.github.io/alpacas-r-socute/


###### Show all non-repeated value in a column [:thought_balloon:](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/unique)
```
unique(vector)
```

> where vector is equal to df$column_name


###### How count the number of unique values in a set of vector [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/n_distinct)
```
library('dplyr')
n_distinct(vector)
```

###### Retrieve or set the dimension of an object [:thought_balloon:](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/dim)
```
dim(df)

[1] 84776    13
```
> df<-read.csv("202004-divvy-tripdata.csv") rows: 84776 columns: 13

> 202004-divvy-tripdata.csv is data I from Case 1: How does a bike-share navigate speedy success?

###### Select rows by position [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/slice)
```
slice(df, 1:10)
```
> shows data to upto 10 rows


###### Return rows with matching conditions [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/filter)
```
filter(df, end_station_name == 'Lincoln Ave & Diversey Pkwy', member_casual == 'member')
```
> return all rides with end_station_name equal to Lincoln Ave & Diversey Pkwy and is a member type

```
df[df$end_station_nam == 'Lincoln Ave & Diversey Pkwy' & df$member_casual == 'member',]
```
> the output similar to filter(df, ..) above but left most column shows their row number.

###### Select/rename variables by name [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/select)
```
select(df, end_station_name, member_casual)
```
> shows row number, col1 and col2 of dataframe df

```
select(df, end_station_name:member_casual)
```
> shows row number, col1, col2 and column inbetween col1 and col2


```
select(df, -(end_station_name:member_casual))
```
> shows row number and all column excluding col1 upto col3


###### Select distinct/unique rows [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/distinct)
```
distinct(select(df, end_station_name))
```
> Retain only unique/distinct rows


```
distinct(select(df, end_station_name, member_casual))
```
> Retain only unique/distinct rows for 2 columns. It also show the row number.


###### Sample n shapes [:thought_balloon:](https://www.rdocumentation.org/packages/Momocs/versions/1.4.0/topics/sample_n)
```
sample_n(df, 10)
```
> 10 is the size. size is numeric how many shapes should we sample

###### Sample a fraction of shapes [:thought_balloon:](https://www.rdocumentation.org/packages/Momocs/versions/1.3.2/topics/sample_frac)
```
sample_frac(df, 0.01)
```
> 0.01 is the size. size is numeric (0 < numeric <= 1) the fraction of shapes to select


### Sorting

###### Arrange rows by variables [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/arrange)
```
arrange(df, col1, col2)
```

```
arrange(df, desc(col1))
```


### Transforming
```
select(df, col_one = end_station_name)
```
> display end_station_name and their row numbers

###### Modify names by name [:thought_balloon:](https://www.rdocumentation.org/packages/plyr/versions/1.8.7/topics/rename)
```
rename(df, changed_end_station_name = end_station_name)
```
> if you assign it on a variable and use glimpse, end_station_name is not changed_end_station_name

###### Add new variables [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.5.0/topics/mutate)
```
mutate(df, c=a-b)

ride_id_mid<- paste(df$ride_id,df$member_casual)
df_new <- mutate(df, ride_id_mid)
```
> if df has 13 columns then df_new is df plus 14th column named ride_id_mid

> paste simply add char together.


### Grouping and summarizing

###### Object Summaries [:thought_balloon:](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary)
```
summary(df)
```
> give you the Min, 1st Quartile, Median, Mean, 3rd Quartile and Max for columns that is of type dbl or int

###### Group by one or more variables [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/group_by)
```
irs <- iris
library('dplyr')


gdf <- group_by(irs, Species)
```
###### Reduces multiple values down to a single value [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/summarise)
```
summarise(gdf, avg=mean(Sepal.Length, na.rm=TRUE))

Species      avg
  <fct>      <dbl>
1 setosa      5.01
2 versicolor  5.94
3 virginica   6.59
```

###### Another example for summarise
```
rad <- randu
rad1 <- group_by(rad ,y,z)

summarise(rad1, total=sum(y,z))

y        z   total
     <dbl>    <dbl>   <dbl>
1 0.000183 0.000824 0.00101
2 0.00112  0.117    0.119  
3 0.00142  0.928    0.929  
4 0.00176  0.529    0.531  
5 0.00180  0.127    0.129  
6 0.00197  0.118    0.120  
7 0.00317  0.834    0.838  
8 0.00697  0.633    0.640  
9 0.00888  0.750    0.759  
10 0.0133   0.475    0.489  
# ... with 390 more rows
```



***[Go back to README.md](/README.md)***

[^1]: for more info, go to https://www.rdocumentation.org/
