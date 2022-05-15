***[Go back to README.md](/README.md)***

I started dabbling with arts of computer programming along tife ago. The language I use it Java. I remember when I first bought my book that includes a cd installer for Java. But for data sciene will be using Python. It is an interpreted, object-oriented, high-level programming language with dynamic semantics [^site] and it will give us access to data analysis and manipulation tool [Pandas](https://pandas.pydata.org/).

## Quick Starter comparing to R

I want to compare Pandas to R. I base this to [Comparison with R / R libraries](https://pandas.pydata.org/docs/getting_started/comparison/comparison_with_r.html#compare-with-r)

### Querying, filtering, sampling

######  Dimension of an object [:thought_balloon:](https://pandas.pydata.org/pandas-docs/version/0.23/generated/pandas.DataFrame.shape.html)
```
df.shape
```

######  Returns the first n rows [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.head.html)
```
df.head()
```

######  Indexing for selection by position [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iloc.html)
```
df.iloc[:9]
```

######  Query the columns of a DataFrame [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.query.html)
```
df.query('col1 == 1 & col2 == 1')
```

```
df[(df.col1 == 1) & (df.col2 == 1)]
```

```
df[['col1', 'col2']]
```

###### Access a group of rows and columns by label(s) [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.loc.html)
```
df.loc[:, 'col1':'col3']
```

###### Drop specified labels from rows or columns [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop.html)
```
df.drop(cols_to_drop, axis=1) but see[^1]
```

###### Return DataFrame with duplicate rows removed [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)
```
df[['col1']].drop_duplicates()
```


```
df[['col1', 'col2']].drop_duplicates()
```

###### Return a random sample of items from an axis of object [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sample.html)
```
df.sample(n=10)
```

```
df.sample(frac=0.01)
```


### Sorting

### Transforming

### Grouping and summarizing






***[Go back to README.md](/README.md)***

[^1]: R’s shorthand for a subrange of columns (select(df, col1:col3)) can be approached cleanly in pandas, if you have the list of columns, for example df[cols[1:3]] or df.drop(cols[1:3]), but doing this by column name is a bit messy.

[^2]: Every new line should be prefixed with 2 spaces.  
  This allows you to have a footnote with multiple lines.
[^site]:
    Here is there [website](https://www.python.org/) where you can find information and how to install Python on your computer. Lots of tutorial and learning
    resources available online.
