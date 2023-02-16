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

## Data preprocessing (homelessness data)

### Selecting Columns
```
# Select the individuals column only
individuals = homelessness["individuals"]

# Select the state and family_members columns
state_fam = homelessness[["state", "family_members"]]

# Select only the individuals and state columns, in that order
ind_state = homelessness[['individuals', 'state']]
```
### Filtering Rows
```
# Filter for rows where individuals is greater than 10000
ind_gt_10k = homelessness[homelessness['individuals']>10000]

# Filter for rows where region is Mountain
mountain_reg = homelessness[homelessness['region']=='Mountain']

# Filter for rows where family_members is less than 1000 
# and region is Pacific
fam_lt_1k_pac = homelessness[(homelessness['family_members']<1000 )&(homelessness['region']=='Pacific')]
```
### Subsetting by Categorical Variables
```
# Subset for rows in South Atlantic or Mid-Atlantic regions
south_mid_atlantic = homelessness[(homelessness["region"] == "South Atlantic") | (homelessness["region"] == "Mid-Atlantic")]

# Filter for rows in the Mojave Desert states
mojave_homelessness = homelessness[homelessness["state"].isin(canu)]
```
### Adding New Columns
```
# Add total column as sum of individuals and family_members
homelessness['total'] = homelessness['individuals'] + homelessness['family_members']

# Add p_individuals column as proportion of total that are individuals
homelessness['p_individuals'] =homelessness['individuals']/homelessness['total']

# Add a column to homelessness, indiv_per_10k, containing the number of homeless individuals per ten thousand people in each state.
homelessness["indiv_per_10k"] = 10000 * homelessness["individuals"] / homelessness["state_pop"]
```
### Sorting and Selecting Columns
```
# Subset rows where indiv_per_10k is higher than 20
high_homelessness = homelessness[homelessness["indiv_per_10k"] > 20]

# Sort high_homelessness by descending indiv_per_10k
high_homelessness_srt = high_homelessness.sort_values("indiv_per_10k", ascending=False)

# Select only the state and indiv_per_10k columns of high_homelessness_srt and save as result
result = high_homelessness_srt[['state', 'indiv_per_10k']]
```
## Data Preprocessing for Sales Data

### Summaries of Numerical Columns
```
# Print the mean of weekly_sales
print(sales['weekly_sales'].mean())

# Print the median of weekly_sales
print(sales['weekly_sales'].median())
```
### Maximum and Minimum of a Column
```
# Print the maximum of the date column
print(sales['date'].max())

# Print the minimum of the date column
print(sales['date'].min())
```

## Efficient Summaries
### Custom IQR function
Here, we define a custom function iqr to calculate the inter-quartile range (IQR) of a given column. The IQR is the difference between the 75th and 25th percentile values.
```
def iqr(column):
    return column.quantile(0.75) - column.quantile(0.25)
```
### IQR of temperature_c
We use the agg function and pass the iqr function to it. The function is applied to the temperature_c column of the sales dataframe. The result is the IQR of the temperature_c column.
```
print(sales['temperature_c'].agg(iqr))
```
### IQR of multiple columns
We extend the calculation to multiple columns - temperature_c, fuel_price_usd_per_l, and unemployment - by passing these columns as a list to the agg function.
```
print(sales[["temperature_c", 'fuel_price_usd_per_l', 'unemployment']].agg(iqr))
```
### IQR and median of multiple columns
We use the agg function along with the custom iqr function and the median function from NumPy to calculate the IQR and median of the temperature_c, fuel_price_usd_per_l, and unemployment columns.
```
import numpy as np

agg_functions = [iqr, np.median]
print(sales[["temperature_c", "fuel_price_usd_per_l", "unemployment"]].agg(agg_functions))
```





















