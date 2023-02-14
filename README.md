# Homelessness Data Analysis

This is a brief guide on how to sort and analyze homelessness data using the Pandas library in Python.

## Prerequisites

You will need to have the following installed on your computer:

- Python 3
- Pandas library

## Load the Data

```
# Import the Pandas library using the alias 'pd'
import pandas as pd

# Load the homelessness data
homelessness = pd.read_csv("homelessness.csv")```

##Analyze the Data
```
# Print the values of the homelessness data
print(homelessness.values)

# Print the column names of the homelessness data
print(homelessness.columns)

# Print the row index of the homelessness data
print(homelessness.index)
```
