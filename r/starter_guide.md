***[Go back to README.md](/README.md)***

## Quick Starter

It seems that some functions' documentation aren't readily available[^1].

### Neat stuff

[List all dataset](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/data)
```
data()
```

### File navigation

[How to check your R version](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/R.Version)
```
R.version

  ...
version.string R version 4.1.3 (2022-03-10)
  ..

```

[How to change working directory](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/getwd)
```
setwd("~Path-to-file_directory")
```

> you can also use getwd to output currect working directory 

How to load csv file
```
dataframe_name_you_want<-read.csv("filename")
```

> you can also use read_csv but this require loading readr package

> you need to be in the correct working directory to before you can use this
  
### Data exploration

[Inspecting your data](https://www.rdocumentation.org/packages/dplyr/versions/0.3/topics/glimpse)
```
glimpse(dataframe)
```

> let you see column names and their type  

[Check first row and last row](https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/head)
```
head(dataframe)
tail(dataframe)
```
 

[Display the column names](https://www.rdocumentation.org/packages/gpuR/versions/2.0.3/topics/colnames)
```
colnames(dataframe)
```


[Show all non-repeated value in a column](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/unique)
```
unique(vector)
```

> where vector is equal to df$column_name

[How count the number of unique values in a set of vector](https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/n_distinct)
```
library('dplyr')
n_distinct(vector)
```

***[Go back to README.md](/README.md)***

[^1]: for more info, go to https://www.rdocumentation.org/
