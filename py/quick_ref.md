***[Go back to README.md](/README.md)***

### Using pandas

We will be using Python for machine learning and data science. If you don't know what python is, it is an interpreted, object-oriented, high-level programming language with dynamic semantics [^site]. We will use a data analysis and manipulation tool [Pandas](https://pandas.pydata.org/). I also installed Anaconda[^3] which contains Python packages including Python/R data science and machine learning. The current version I am using is 4.12.0.

######  How to start Pandas [:thought_balloon:](https://pandas.pydata.org/pandas-docs/version/0.23/generated/pandas.DataFrame.shape.html)

Make sure that you are in the project directory
Using Anaconda Prompt, type in
```
conda update --all
```

Open Jupyter Notebook
```
jupyter notebook
```

Create an new project and rename
```
click on new then select Python 3
rename Untitle to name you like
jupyter notebook will create a ipynb file
```

Load csv
```
import pandas as pd
pd.read_csv("202004-divvy-tripdata.csv")
```


### Quick Reference

I want to compare Pandas to R. I base this to [Comparison with R / R libraries](https://pandas.pydata.org/docs/getting_started/comparison/comparison_with_r.html#compare-with-r)

### Querying, filtering, sampling

######  Dimension of an object [:thought_balloon:](https://pandas.pydata.org/pandas-docs/version/0.23/generated/pandas.DataFrame.shape.html)
```
divvy = pd.read_csv("202004-divvy-tripdata.csv")
divvy.shape

Out[]:  (84776, 13)
```

######  Returns the first n rows [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.head.html)
```
divvy.head()
```
> this gives use the first 5 rows


######  Indexing for selection by position [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iloc.html)
```
df.iloc[:9]
```
> display the first 9 rows

######  Query the columns of a DataFrame [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.query.html)
```
divvy.query('start_station_name == "Eckhart Park" & member_casual == "member"')

divvy.query('start_station_id == 86 & member_casual == "member"')
```
> you need to enclose a search parameter with " " if its a char except for dbl or int

```
divvy[(divvy.start_station_id == 86) & (divvy.member_casual == "member")]

divvy[(divvy.start_station_id == 86) & (divvy.end_station_id >= 26)]
```

```
divvy[['start_station_name', 'start_lat']]


  start_station_name	          start_lat
0	Eckhart Park	                41.8964
1	Drake Ave & Fullerton Ave	    41.9244
2	McClurg Ct & Erie St	        41.8945
3	California Ave & Division St	41.9030
4	Rush St & Hubbard St	        41.8902
...	...	...
84771	Dearborn Pkwy & Delaware Pl	41.8990
84772	Kimbark Ave & 53rd St	41.7996
84773	Sedgwick St & Schiller St	41.9076
84774	Damen Ave & Charleston St	41.9201
84775	Clybourn Ave & Division St	41.9046

84776 rows × 2 columns
```

###### Access a group of rows and columns by label(s) [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.loc.html)
```
divvy.loc[:, 'start_station_name':'start_lat']

         start_station_name	    start_station_id	    end_station_name	                end_station_id	  start_lat
0	       Eckhart Park             	86	              Lincoln Ave & Diversey Pkwy	      152.0	            41.8964
1	       Drake Ave & Fullerton Ave	503             	Kosciuszko Park	                  499.0	            41.9244
2	       McClurg Ct & Erie St	      142	              Indiana Ave & Roosevelt Rd	      255.0	            41.8945
3	       California Ave & Division St	216            	Wood St & Augusta Blvd	          657.0	            41.9030
4	       Rush St & Hubbard St	      125	              Sheridan Rd & Lawrence Ave	      323.0	            41.8902
...	...	...	...	...	...
84771	   Dearborn Pkwy & Delaware Pl	140	            Dearborn Pkwy & Delaware Pl	      140.0	            41.8990
84772	   Kimbark Ave & 53rd St	    322	              Cottage Grove Ave & 51st St	      351.0	            41.7996
84773	   Sedgwick St & Schiller St	236	              Wells St & Elm St	                182.0	            41.9076
84774	   Damen Ave & Charleston St	310	              Damen Ave & Charleston St	        310.0	            41.9201
84775	   Clybourn Ave & Division St	138	              Clybourn Ave & Division St       	138.0	            41.9046

84776 rows × 5 columns
```

###### Drop specified labels from rows or columns [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop.html)
```
divvy.drop('rideable_type', axis=1)
```
see[^1]

###### Return DataFrame with duplicate rows removed [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.drop_duplicates.html)
```
divvy[['end_station_id']].drop_duplicates()

   end_station_id
0	 152.0
1	 499.0
2	 255.0
3	 657.0
4	 323.0
...	...
57881	576.0
58696	398.0
61268	565.0
76118	391.0
81673	651.0

601 rows × 1 columns
```


```
divvy[['start_station_id', 'end_station_id']].drop_duplicates()

        start_station_id	end_station_id
0	      86	              152.0
1	      503	              499.0
2	      142	              255.0
3	      216	              657.0
4	      125	              323.0
...	...	...
84720	  127	              60.0
84721	  470	              323.0
84736	  75	              192.0
84760	  497	              340.0
84763	  158	              509.0

28125 rows × 2 columns
```

###### Return a random sample of items from an axis of object [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sample.html)
```
divvy.sample(n=10)
```
> return 10 samples


```
divvy.sample(frac=0.01)
```
> frac is Fraction of axis items to return. Cannot be used with n.


### Sorting

###### Sort by the values along either axis [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.sort_values.html)
```
divvy.sort_values(['start_station_id', 'member_casual'])
```

```
divvy.sort_values('start_station_id', ascending=False)
```
> sort first from highest value station id to lowest

### Transforming

###### Alter axes labels [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.rename.html)
```
divvy.rename(columns={'rideable_type':'start_lat'})['start_lat']

      start_lat	  start_lat
0	    docked_bike	41.8964
1	    docked_bike	41.9244
2	    docked_bike	41.8945
3	    docked_bike	41.9030
4	    docked_bike	41.8902
...	...	...
84771	docked_bike	41.8990
84772	docked_bike	41.7996
84773	docked_bike	41.9076
84774	docked_bike	41.9201
84775	docked_bike	41.9046

84776 rows × 2 columns
```
> replace rideable_type column_name with start_lat
```
divvy.rename(columns={'rideable_type':'start_lat'})
```
> output just like the other example including the other columns

```
divvy.assign(diff_bet_start_end=divvy['start_station_id']-divvy['end_station_id'])
```
> add a column diff_bet_start_end which the difference of start stn id and end stn id, it needs numbers

### Grouping and summarizing


###### Generate descriptive statistics [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.describe.html)
```
divvy.describe()

          start_station_id	end_station_id	start_lat	        start_lng	    end_lat	      end_lng
count	    84776.000000	    84677.000000	  84776.000000	    84776.000000	84677.000000	84677.000000
mean	    236.703418	      236.978176	    41.908156	        -87.649319	  41.908194   	-87.649601
std	      160.288883	      160.957429     	0.043313	        0.025170	    0.043313    	0.025243
min	      2.000000	        2.000000	      41.736600	        -87.774700	  41.736600   	-87.774700
25%	      113.000000	      113.000000    	41.884600	        -87.664400	  41.884600   	-87.665100
50%	      211.000000	      212.000000	    41.903000	        -87.646300	  41.903000	    -87.646600
75%	      324.000000	      323.000000	    41.932600	        -87.631700	  41.932600	    -87.631700
max	      673.000000	      673.000000	    42.064900	        -87.549400	  42.064900    	-87.549400
```
###### Group DataFrame using a mapper or by a Series of columns [:thought_balloon:](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.groupby.html)
```
gdf = divvy.groupby('end_station_id')
```
```
divvy.groupby('end_station_id').agg({'end_station_id': 'mean'})


end_station_id	    end_station_id
2.0	                2.0
3.0	                3.0
5.0	                5.0
6.0	                6.0
7.0	                7.0
...	...
664.0	              664.0
666.0	              666.0
671.0	              671.0
672.0	              672.0
673.0	              673.0

600 rows × 1 columns
```

```
divvy.groupby('end_station_id').sum()

                   start_station_id	start_lat	  start_lng	  end_lat	   end_lng
end_station_id					
2.0	               41414	          11014.8185	-23047.0316	11013.5195	-23044.1915
3.0	               1908	            293.1446	  -613.3793	  293.0704	  -613.3078
5.0	               20876	          5905.3143	  -12356.3126	5904.2481	  -12355.5057
6.0	               861	            502.6245	  -1051.5410	502.6440	  -1051.3536
7.0	               25107	          7748.9459	  -16211.5498	7748.9655	  -16209.2375
...	...	...	...	...	...
664.0	             17933	          2139.5259	  -4471.3710	2138.9094 	-4471.8483
666.0	             7952	            1299.5627	  -2717.3429	1299.1232	  -2717.3236
671.0	             14728	          1173.1209	  -2454.7200 	1172.9200	  -2455.0596
672.0	             55542	          10851.8553	-22698.2933	10849.7690	-22697.5945
673.0	             93046	          12323.4030	-25765.4568	12325.6266	-25764.9252

600 rows × 5 columns
```
> the data result doesn't seems to make sense. ei why do I need to add all latitude and longitude

> they might useful for other types of data but what this shows what the command will do

***[Go back to README.md](/README.md)***

[^1]: R’s shorthand for a subrange of columns (select(df, col1:col3)) can be approached cleanly in pandas, if you have the list of columns, for example df[cols[1:3]] or df.drop(cols[1:3]), but doing this by column name is a bit messy.

[^2]: Every new line should be prefixed with 2 spaces. This allows you to have a footnote with multiple lines.
[^3]: Here is the [website](https://www.anaconda.com/) where you can download and install Anaconda. If you are using Python for other non-application, you might want to use the Anaconda Prompt.
[^site]:
    Here is there [website](https://www.python.org/) where you can find information and how to install Python on your computer. Lots of tutorial and learning
    resources available online.
