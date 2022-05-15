## Data Science And Beyond

First of all, thank you for taking time to read my page.

Let me start off by saying, I love Data Science.

Before I started this [Course](https://www.coursera.org/professional-certificates/google-data-analytics), understanding the importance of data in business like digital marketing is something though to grasp for me.

I am curious on how someone can make money out data of me liking meme pictures on the internet, and searching for pc gaming related topics. Now, it all make sense.

As you may know, adult life are made of big decisions, most are yours to decide on while some decisions may have to be made by others for you.

This doesn’t mean that Data Science is used to steal information, that depends on how you decide to use it. The knowledge in Data Science is more of being granted a the power to spread good in a somewhat chaotic world.

To appreciate the role of Data Science in our daily lives, one must understand the importance of finding the best insight available based on your decision.

And, that is the job for a data analyst.

To showcase what I have learned, below are some case studies I have completed in this [Course](https://www.coursera.org/professional-certificates/google-data-analytics) to showcase what I have learn:

## Google Data Analytics Capstone: Complete a Case Study

## Case 1: How does a bike-share navigate speedy success?


#### Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company's future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must apporove your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

#### Objectives:
-	Find out how annual members and casual riders use Cyclist bikes differently
-	Find out why would a casual riders converts to a annual memberships
-	Determine how digital media could influence causal riders to become a Cyclistic members.

> Casual riders are customers who purchase single-ride or full-day passes

> Cyclistic members are customers who purchase annual memberships

A link of the has been provided to me for use in this case study.
I uploaded csv file to google sheets.
> The datasets have a different name because Cyclistic is a fictional company.

> The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement)

#### Cleaning the data

Downloaded  202004-divvy-tripdata.zip.

Extract and upload 202004-divvy-tripdata.csv.
```
Go to Google sheets
Go to File > select Import > select Import file
Click on "select a file from your device"
For import location, select "Replace current sheets"
For Separator type, leave it at "Detect automatically"
Click import data button
```
> Google sheets would sometime stop working when using certain functions

> I use R console to explore the datasets

Load csv file to R.
```
library('readr')
library('dplyr')
library('tidyverse')

Divvy <- read_csv("202004-divvy-tripdata.csv")
Rows: 84776 Columns: 13
-- Column specification ------------------------------------------------
chr  (5): ride_id, rideable_type, start_station_name, end_station_name, mem...
dbl  (6): start_station_id, end_station_id, start_lat, start_lng, end_lat, ...
dttm (2): started_at, ended_at
```

rider_id are 84776 random unique 16-character values.
```
n_distinct(Divvy$ride_id)

[1] 84776
```

> ride_id doesn't belong a customer account and use a reference to a ride trip

Delete redundant column.
```
n_distinct(Divvy$rideable_type)

[1] 1
```

> all rideable_type are char "docked_bike"

Make the data is properly formatted.
```
Back in Google Sheets
Select "started_at" column
On top tool bar, select "More format"
On "More format" dropdown, select date
Do same think on "ended_at"
```

Create a column to get the duration.
```
Select header "ended_at" column 
Right click then select "Insert 1 column right"
Named new column "ride_length"
On D2, put =C2-B2
Apply formula for reminder cell in that column   
```

Create a column to get the day of week.
```
Select header "ride_length" column 
Right click then select "Insert 1 column right"
Named new column "day_of_week"
On D2, put =WEEKDAY(B2,1)
Apply formula for reminder cell in that column   
```

Compute for average ride lenght for members and casuals.
```
Select "member_casual" column
On the toolbar, click on "Create a filter" button
Toggle the filter in "member_casual" header
On the dropdown, select "Clear" button
Then select and put check on "member". Press ok
Create another empty column name it "ave_ride_length_member"
Under "ave_ride_length_member" cell, enter =AVERAGE(All ride_length)
Repeat process but this time for "ave_rider_length_casual"
```

Create a column to get the mode day of week
```
On empty column, name it with "mode_of_dow"
2nd cell under the header, enter "=MODE(day_of_week column)"
```

#### Visualization

Create a pivot table with simple graph.

[Here is the link](https://docs.google.com/spreadsheets/d/e/2PACX-1vTMrhAzXjSeSafdl4ftPo5M9Y-xfIS36hsKU6GUtLkxcy6FtR1cHB41deUxOd20WloSOoZVXx7krfa7/pubhtml?gid=1618269384&single=true)

In this pivot table, I include all total ride for days in week.

Based on Bike Rides - April 2020,  the number of casual ride never exceeds 5000 while member rides consistently exceeds that number. Sundays have the highest volume for all two groups while Wednesday ride volume it lowest.  

#### Takeaways

Cyclistic should promote adaptation of healthier city travel lifestyle on their social media. They may take advantage of putting add usual destination close to their bike stations particularly the one mostly used during Sundays. 



## Case 2: How can a wellness company play it smart?

#### Scenario
You are a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. The cofounder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. You have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices. The insights you discover will then help guide marketing strategy for the company. You will present your analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.

#### Products

- Bellabeat app provides users with health data related to their activity, sleep, stress, menstrual cycle, and mindfulness habits.
- Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress.
- Time watch connects to the Bellabeat app to provide you with insights into your daily wellness.
- Spring a water bottle that tracks daily water intake using smart technology to ensure that you are appropriately hydrated throughout the day.
- Bellabeat membership gives users 24/7 access to fully personalized guidance on nutrition, activity, sleep, health and beauty, and mindfulness based on their lifestyle and goals.

#### Objectives:
- Ascertain some trends in smart device usage
- Determine how these trends could be benificial to Bellabeat customers
- Find out how this trends would influence Bellabeat marketing strategy

 The [Public Dataset](https://www.kaggle.com/datasets/arashnic/fitbit) we used was made available through [Mobius.]( https://www.kaggle.com/arashnic) This Kaggle data set contains personal fitness tracker from thirty fitbit users.

#### Cleaning the data

We know that users can monitor their daily calorie and steps using this device.
When they see this, it should help them make a conscious decision to make a healthier activity.

Example, customer tends to walk 2 block away to the bakery instead of driving.
Or, walk their pet dog in the park instead of just letting them out in the yard.

We will also check if users tend to sacrifice rest while using our device.

Downloaded the data unto my hard drive.

Organize and put them into different folders.

Load libraries.
```
library('readr')
library('dplyr')
library('tidyverse')
```
> I am using just the r console


Load the csv.
```
setwd("C:/Case Study 2/daily")  
dailyactivity <- read_csv("dailyActivity_merged.csv")
sleepDay <- read_csv("sleepDay_merged.csv")
```
>dailyactivity has  Rows: 940 Columns: 15 Columns specs: chr  (1): ActivityDate dbl (14): Id,...

>sleepDay has  Rows: 413 Columns: 5 Columns specs: chr  (1): SleepDay dbl (4): Id,...

>SleepDay_merged.csv data contains the daily number of sleep count and total minutes asleep per day

Merge data and show some summary statistics
```
TotalDailyCalBurnedVSTotalStepsMade <- merge(DailyActivityMerge, DailyEPMerge, by="Id")

TotalDailyCalBurnedVSTotalStepsMade %>%
select(TotalSteps,
Calories,
TotalMinutesAsleep) %>%
summary()

TotalSteps       Calories    TotalMinutesAsleep
 Min.   :    0   Min.   :   0   Min.   : 58.0     
 1st Qu.: 4660   1st Qu.:1783   1st Qu.:361.0     
 Median : 8596   Median :2162   Median :432.0     
 Mean   : 8117   Mean   :2329   Mean   :419.4     
 3rd Qu.:11317   3rd Qu.:2865   3rd Qu.:492.0     
 Max.   :22988   Max.   :4900   Max.   :796.0   

```
>TotalMinutesAsleep 361 to an average 419 indicates that user slept 6~7 hrs. on an average

>TotalDailyCalBurnedVSTotalStepsMade includes user who have done light, moderate, very active and on rest activity.

It has 24 users.
```
n_distinct(TotalDailyCalBurnedVSTotalStepsMade$Id)

[1] 24
```
>you can also see all ids by replacing n_distinct with unique function

>the function merges the data sets by the common column names, in this case, we use the 'Id'

not a single user have missed sleep
```
unique(TotalDailyCalBurnedVSTotalStepsMade$TotalSleepRecords)
[1] 1 2 3
```

Plot Daily Total Calories burnt vs Total Steps done
```
ggplot(TotalDailyCalBurnedVSTotalStepsMade, aes(x=TotalSteps, y=Calories, colour=TotalMinutesAsleep ))+ geom_point()
```
![Daily Total Calories burnt vs Total Steps](/TCalvsTSteps.jpg)


**Daily Total Calories burnt vs Total Steps done**

[pdf link](/calvssteps.pdf)


Now, let us take a look on individual user trend.
```
unique(TotalDailyCalBurnedVSTotalStepsMade$Id)
[1] 1503960366 1644430081 1844505072 1927972279 2026352035 2320127002
[7] 2347167796 3977333714 4020332650 4319703577 4388161847 4445114986
[13] 4558609924 4702921684 5553957443 5577150313 6117666160 6775888955
[19] 6962181067 7007744171 7086361926 8053475328 8378563200 8792009665

```
Plot one individual trend
```
combined_data %>% filter(  Id=="1503960366") %>% ggplot(aes(TotalSteps,Calories,colour=TotalMinutesAsleep)) +
	geom_point(size = 2, alpha = 0.5) +
	geom_smooth(size = 1) +
	facet_wrap(~Id) +
	theme_minimal() +
	labs(title="Device Usage")
```

#### Visualization

Here is how it looks for user 1503960366:

![user](/users/file_show1503960366.jpg)

You can also see the trend for other users below:

[user 1644430081](/users/file_show1644430081.jpg)
[user 1844505072](/users/file_show1844505072.jpg)
[user 1927972279](/users/file_show1927972279.jpg)
[user 2026352035](/users/file_show2026352035.jpg)
[user 2320127002](/users/file_show2320127002.jpg)
[user 3977333714](/users/file_show3977333714.jpg)
[user 4020332650](/users/file_show4020332650.jpg)
[user 4319703577](/users/file_show4319703577.jpg)
[user 4388161847](/users/file_show4388161847.jpg)
[user 4445114986](/users/file_show4445114986.jpg)
[user 4558609924](/users/file_show4558609924.jpg)
[user 4702921684](/users/file_show4702921684.jpg)
[user 5553957443](/users/file_show5553957443.jpg)
[user 6117666160](/users/file_show6117666160.jpg)
[user 6775888955](/users/file_show6775888955.jpg)
[user 6962181067](/users/file_show6962181067.jpg)
[user 7007744171](/users/file_show7007744171.jpg)
[user 7086361926](/users/file_show7086361926.jpg)
[user 8053475328](/users/file_show8053475328.jpg)
[user 8378563200](/users/file_show8378563200.jpg)
[user 8792009665](/users/file_show8792009665.jpg)

*The device user 1503960366 have an upward trend and there is no indication that the user had missed rest in any day.

Similar trends have been seen on other users' device usage. It is also important to note that our device detected and count how long a user remain on rest including up to high activity.

#### Takeaways
The best selling points here is that our device helps users to adapt a healthier and active lifestyle without affecting what they want to do in life.

