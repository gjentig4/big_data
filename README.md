# Big Data

This is a brief guide on how to fck around with the Pandas and other libraries library in Python.

## Prerequisites

You will need to have the following installed on your computer:

- Python 3
- Pandas library

### Load the Data

```
# Import the Pandas library using the alias 'pd'
import pandas as pd

# Load the homelessness data
homelessness = pd.read_csv("homelessness.csv")
```
### Analyze the Data
```
# Print the values of the homelessness data
print(homelessness.values)

# Print the column names of the homelessness data
print(homelessness.columns)

# Print the row index of the homelessness data
print(homelessness.index)
```
### Sort the Data
```
# Sort the homelessness data by the number of individuals, in ascending order
homelessness_ind = homelessness.sort_values("individuals", ascending=True)

# Sort the homelessness data by the number of family members, in ascending order
homelessness_fam = homelessness.sort_values("family_members", ascending=True)

# Print the top few rows of the sorted homelessness data by family members
print(homelessness_fam.head())

# Sort the homelessness data by region, then by the number of family members, in ascending order
homelessness_reg_fam = homelessness.sort_values(["region", "family_members"], ascending=[True, False])

# Print the bottom few rows of the sorted homelessness data by region and family members
print(homelessness_reg_fam.tail())

```
## Subsetting columns
When working with data, you may not need all of the variables in your dataset. Square brackets ([]) can be used to select only the columns that matter to you in an order that makes sense to you. To select only ``"col_a"`` of the DataFrame df, use

```df["col_a"]```
To select "col_a" and "col_b" of df, use

df[["col_a", "col_b"]]
homelessness is available and pandas is loaded as pd.

Instructions 1/3
35 XP
Instructions 1/3
35 XP
Create a DataFrame called individuals that contains only the individuals column of homelessness.
Print the head of the result.
Create a DataFrame called state_fam that contains only the state and family_members columns of homelessness, in that order.
Print the head of the result.
Create a DataFrame called ind_state that contains the individuals and state columns of homelessness, in that order.
Print the head of the result.
```
# Select the individuals column only
individuals = homelessness["individuals"]

# Print the head of the result
print(individuals.head())

# Select the state and family_members columns
state_fam = homelessness[["state", "family_members"]]

# Print the head of the result
print(state_fam.head())

# Select only the individuals and state columns, in that order
ind_state = homelessness[['individuals', 'state']]

# Print the head of the result
print(ind_state.head())
```
## Subsetting rows
A large part of data science is about finding which bits of your dataset are interesting. One of the simplest techniques for this is to find a subset of rows that match some criteria. This is sometimes known as filtering rows or selecting rows.

There are many ways to subset a DataFrame, perhaps the most common is to use relational operators to return True or False for each row, then pass that inside square brackets.

```dogs[dogs["height_cm"] > 60]```
```dogs[dogs["color"] == "tan"]``` 
You can filter for multiple conditions at once by using the "bitwise and" operator, &.

dogs[(dogs["height_cm"] > 60) & (dogs["color"] == "tan")]
homelessness is available and pandas is loaded as pd.

Instructions 1/3
35 XP
Filter homelessness for cases where the number of individuals is greater than ten thousand, assigning to ind_gt_10k. View the printed result.

Filter homelessness for cases where the USA Census region is "Mountain", assigning to mountain_reg. View the printed result.

Filter homelessness for cases where the number of family_members is less than one thousand and the region is "Pacific", assigning to fam_lt_1k_pac. View the printed result.

```
# Filter for rows where individuals is greater than 10000
ind_gt_10k = homelessness[homelessness['individuals']>10000]

# See the result
print(ind_gt_10k)

# Filter for rows where region is Mountain
mountain_reg = homelessness[homelessness['region']=='Mountain']

# See the result
print(mountain_reg)

# Filter for rows where family_members is less than 1000 
# and region is Pacific
fam_lt_1k_pac = homelessness[(homelessness['family_members']<1000 )&(homelessness['region']=='Pacific')]

# See the result
print(fam_lt_1k_pac)
```
## Subsetting rows by categorical variables
Subsetting data based on a categorical variable often involves using the "or" operator (|) to select rows from multiple categories. This can get tedious when you want all states in one of three different regions, for example. Instead, use the .isin() method, which will allow you to tackle this problem by writing one condition instead of three separate ones.

```colors = ["brown", "black", "tan"]
condition = dogs["color"].isin(colors)
dogs[condition] 
```
homelessness is available and pandas is loaded as pd.

Filter homelessness for cases where the USA census region is "South Atlantic" or it is "Mid-Atlantic", assigning to south_mid_atlantic. View the printed result.

Filter homelessness for cases where the USA census state is in the list of Mojave states, canu, assigning to mojave_homelessness. View the printed result.

```
# Subset for rows in South Atlantic or Mid-Atlantic regions
south_mid_atlantic = homelessness[(homelessness["region"] == "South Atlantic") | (homelessness["region"] == "Mid-Atlantic")]

# See the result
print(south_mid_atlantic)
#print(homelessness.info)

# The Mojave Desert states
canu = ["California", "Arizona", "Nevada", "Utah"]

# Filter for rows in the Mojave Desert states
mojave_homelessness = homelessness[homelessness["state"].isin(canu)]

# See the result
print(mojave_homelessness)

```
---------------------------------------------
## Adding new columns
You aren't stuck with just the data you are given. Instead, you can add new columns to a DataFrame. This has many names, such as transforming, mutating, and feature engineering.

You can create new columns from scratch, but it is also common to derive them from other columns, for example, by adding columns together or by changing their units.

homelessness is available and pandas is loaded as pd.

Instructions
100 XP
Add a new column to homelessness, named total, containing the sum of the individuals and family_members columns.
Add another column to homelessness, named p_individuals, containing the proportion of homeless people in each state who are individuals.
```
# Add total col as sum of individuals and family_members
homelessness['total'] = homelessness['individuals'] + homelessness['family_members']
# Add p_individuals col as proportion of total that are individuals
homelessness['p_individuals'] =homelessness['individuals']/homelessness['total'] 

# See the result
print(homelessness)
```
Combo-attack!
You've seen the four most common types of data manipulation: sorting rows, subsetting columns, subsetting rows, and adding new columns. In a real-life data analysis, you can mix and match these four manipulations to answer a multitude of questions.

In this exercise, you'll answer the question, "Which state has the highest number of homeless individuals per 10,000 people in the state?" Combine your new pandas skills to find out.

Instructions
100 XP
Add a column to homelessness, indiv_per_10k, containing the number of homeless individuals per ten thousand people in each state.
Subset rows where indiv_per_10k is higher than 20, assigning to high_homelessness.
Sort high_homelessness by descending indiv_per_10k, assigning to high_homelessness_srt.
Select only the state and indiv_per_10k columns of high_homelessness_srt and save as result. Look at the result.
```
# Create indiv_per_10k col as homeless individuals per 10k state pop
homelessness["indiv_per_10k"] = 10000 * homelessness["individuals"] / homelessness["state_pop"]


# Subset rows for indiv_per_10k greater than 20
high_homelessness = homelessness[homelessness["indiv_per_10k"] > 20]


# Sort high_homelessness by descending indiv_per_10k
high_homelessness_srt = high_homelessness.sort_values("indiv_per_10k", ascending=False)

# From high_homelessness_srt, select the state and indiv_per_10k cols
result = high_homelessness_srt[['state', 'indiv_per_10k']]

# See the result
print(result)
#print (high_homelessness)
#print (homelessness)
#print (high_homelessness_srt)
```
---------------------------------------------------

## Mean and median
Summary statistics are exactly what they sound like - they summarize many numbers in one statistic. For example, mean, median, minimum, maximum, and standard deviation are summary statistics. Calculating summary statistics allows you to get a better sense of your data, even if there's a lot of it.

sales is available and pandas is loaded as pd.

Instructions
100 XP
Explore your new DataFrame first by printing the first few rows of the sales DataFrame.
Print information about the columns in sales.
Print the mean of the weekly_sales column.
Print the median of the weekly_sales column.
```
# Print the head of the sales DataFrame
print(sales.head())

# Print the info about the sales DataFrame
print(sales.info())

# Print the mean of weekly_sales
print(sales['weekly_sales'].mean())

# Print the median of weekly_sales
print(sales['weekly_sales'].median())
```
------------------------------------------
## Summarizing dates
Summary statistics can also be calculated on date columns that have values with the data type datetime64. Some summary statistics — like mean — don't make a ton of sense on dates, but others are super helpful, for example, minimum and maximum, which allow you to see what time range your data covers.

sales is available and pandas is loaded as pd.

Instructions
100 XP
Print the maximum of the date column.
Print the minimum of the date column.

```
# Print the maximum of the date column
print(sales['date'].max())

# Print the minimum of the date column
print(sales['date'].min())
```
----------------------------------------
## Efficient summaries
While pandas and NumPy have tons of functions, sometimes, you may need a different function to summarize your data.

The .agg() method allows you to apply your own custom functions to a DataFrame, as well as apply functions to more than one column of a DataFrame at once, making your aggregations super-efficient. For example,

df['column'].agg(function)
In the custom function for this exercise, "IQR" is short for inter-quartile range, which is the 75th percentile minus the 25th percentile. It's an alternative to standard deviation that is helpful if your data contains outliers.

sales is available and pandas is loaded as pd.

Instructions 1/3
35 XP
Use the custom iqr function defined for you along with .agg() to print the IQR of the temperature_c column of sales.
Update the column selection to use the custom iqr function with .agg() to print the IQR of temperature_c, fuel_price_usd_per_l, and unemployment, in that order.
Update the aggregation functions called by .agg(): include iqr and np.median in that order.
```
 # A custom IQR function
def iqr(column):
    return column.quantile(0.75) - column.quantile(0.25)
    
# Print IQR of the temperature_c column
print(sales['temperature_c'].agg(iqr))
```
## Cumulative statistics
Cumulative statistics can also be helpful in tracking summary statistics over time. In this exercise, you'll calculate the cumulative sum and cumulative max of a department's weekly sales, which will allow you to identify what the total sales were so far as well as what the highest weekly sales were so far.

A DataFrame called sales_1_1 has been created for you, which contains the sales data for department 1 of store 1. pandas is loaded as pd.

Instructions
100 XP
Sort the rows of sales_1_1 by the date column in ascending order.
Get the cumulative sum of weekly_sales and add it as a new column of sales_1_1 called cum_weekly_sales.
Get the cumulative maximum of weekly_sales, and add it as a column called cum_max_sales.
Print the date, weekly_sales, cum_weekly_sales, and cum_max_sales columns.
```
# Sort sales_1_1 by date
sales_1_1 = sales_1_1.sort_values('date')

# Get the cumulative sum of weekly_sales, add as cum_weekly_sales col
sales_1_1["cum_weekly_sales"] =sales_1_1["weekly_sales"].cumsum()

# Get the cumulative max of weekly_sales, add as cum_max_sales col
sales_1_1["cum_max_sales"] = sales_1_1["weekly_sales"].cummax()


# See the columns you calculated
print(sales_1_1[["date", "weekly_sales", "cum_weekly_sales", "cum_max_sales"]])
```
---------------------------------------
## Dropping duplicates
Removing duplicates is an essential skill to get accurate counts because often, you don't want to count the same thing multiple times. In this exercise, you'll create some new DataFrames using unique values from sales.

sales is available and pandas is imported as pd.

Instructions
100 XP
Remove rows of sales with duplicate pairs of store and type and save as store_types and print the head.
Remove rows of sales with duplicate pairs of store and department and save as store_depts and print the head.
Subset the rows that are holiday weeks using the is_holiday column, and drop the duplicate dates, saving as holiday_dates.
Select the date column of holiday_dates, and print.
```
# Drop duplicate store/type combinations
store_types = sales.drop_duplicates(subset=['store', 'type'])
print(store_types.head())

# Drop duplicate store/department combinations
store_depts = sales.drop_duplicates(subset=['store','department'])
print(store_depts.head())

# Subset the rows where is_holiday is True and drop duplicate dates
holiday_dates = sales[sales['is_holiday']].drop_duplicates(subset=['date'])

# Print date col of holiday_dates
print(holiday_dates['date'])
```
-----------------------------
## Counting categorical variables
Counting is a great way to get an overview of your data and to spot curiosities that you might not notice otherwise. In this exercise, you'll count the number of each type of store and the number of each department number using the DataFrames you created in the previous exercise:

# Drop duplicate store/type combinations
store_types = sales.drop_duplicates(subset=["store", "type"])

# Drop duplicate store/department combinations
store_depts = sales.drop_duplicates(subset=["store", "department"])
The store_types and store_depts DataFrames you created in the last exercise are available, and pandas is imported as pd.

Instructions
100 XP
Count the number of stores of each store type in store_types.
Count the proportion of stores of each store type in store_types.
Count the number of different departments in store_depts, sorting the counts in descending order.
Count the proportion of different departments in store_depts, sorting the proportions in descending order.








