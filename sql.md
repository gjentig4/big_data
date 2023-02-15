# SQL commands

Switch to the workbench view when using MySQL. (For Postgres, you could use
pgAdmin, for SQLite the DB Browser) and write the following SQL queries:


a. Return all records with state ‘MA’
```
SELECT * FROM population WHERE state = 'MA';
```
b. Count the number of records(=cities) for the state ‘MA’

```
SELECT COUNT(*) 
FROM population
WHERE state = 'MA';
```

c. Count the number of records(=cities) for each state
```
# This query will group the records by state, count the number of cities for each state, and return the results with the column names state and num_cities. The GROUP BY clause is used to group the records by the state column, and the COUNT(*) function is used to count the number of cities in each group.

SELECT state, COUNT(*) AS num_cities
FROM population
GROUP BY state;
```

d. Sum the number of inhabitants (population) for each state
```
SELECT state, SUM(pop) AS total_population
FROM population
GROUP BY state;
#This query will group the cities by state and then calculate the sum of population for each state using the SUM function. The AS keyword is used to assign the alias total_population to the result of the SUM function. The result will be a table with two columns: state and total_population.
```

e. Use an alias numberOfInhabitants for the result column of question d.
```
SELECT state, SUM(pop) AS numberOfInhabitants
FROM population
GROUP BY state;
```

f. Order the result of e. by numberOfInhabitants
```
SELECT state, SUM(pop) AS numberOfInhabitants
FROM population
GROUP BY state
ORDER BY numberOfInhabitants DESC;
# To order the result of numberOfInhabitants in ascending order, you can add the ASC keyword after the column name numberOfInhabitants.
```

g. Return only those states with a total population > 1.000.00
```
SELECT state, SUM(pop) AS numberOfInhabitants
FROM population
GROUP BY state
HAVING SUM(pop) > 1000000
ORDER BY numberOfInhabitants DESC;

















```
