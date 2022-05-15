***[Go back to README.md](/README.md)***

## Quick Starter

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
colnames(dataframe)
``` 

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
```

###### Select rows by position [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/slice)
```
slice(df, 1:10)
```

###### Return rows with matching conditions [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/filter)
```
filter(df, col1 == 1, col2 == 1)
```

```
df[df$col1 == 1 & df$col2 == 1,]
```

###### Select/rename variables by name [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/select)
```
select(df, col1, col2)
```

```
select(df, col1:col3)
```

```
select(df, -(col1:col3))
```

###### Select distinct/unique rows [:thought_balloon:](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/distinct)
```
distinct(select(df, col1))
```

```
distinct(select(df, col1, col2))
```

###### Sample n shapes [:thought_balloon:](https://www.rdocumentation.org/packages/Momocs/versions/1.4.0/topics/sample_n)
```
sample_n(df, 10)
```

###### Sample a fraction of shapes [:thought_balloon:](https://www.rdocumentation.org/packages/Momocs/versions/1.3.2/topics/sample_frac)
```
sample_frac(df, 0.01)
```


***[Go back to README.md](/README.md)***

[^1]: for more info, go to https://www.rdocumentation.org/
