-- query to display table data from CITY table as insert statements for INSERT ALL clause
select
    'into CITY values (' || ID || ',',
    '"' || NAME || '", ',
    '"' || COUNTRYCODE || '", ',
    '"' || DISTRICT || '", ',
    POPULATION || ')'
from
    CITY;