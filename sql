# SQL commands

Switch to the workbench view when using MySQL. (For Postgres, you could use
pgAdmin, for SQLite the DB Browser) and write the following SQL queries:

d. Sum the number of inhabitants (population) for each state
e. Use an alias numberOfInhabitants for the result column of question d.
f. Order the result of e. by numberOfInhabitants
g. Return only those states with a total population > 1.000.00

# a. Return all records with state ‘MA’
SELECT * FROM population WHERE state = 'MA';


# b. Count the number of records(=cities) for the state ‘MA’
SELECT COUNT(*) 
FROM population
WHERE state = 'MA';


c. Count the number of records(=cities) for each state
