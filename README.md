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


