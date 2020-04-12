-- query to display table data from CITY table as insert statements for INSERT ALL clause
select
    'into CITY values (' || ID || ',',
    '"' || NAME || '", ',
    '"' || COUNTRYCODE || '", ',
    '"' || DISTRICT || '", ',
    POPULATION || ')'
from
    CITY;

-- query to display table data from COUNTRY table as insert statements for INSERT ALL clause
select
    'into COUNTRY values ("' || CODE || '", ',
    '"' || NAME || '", ',
    '"' || CONTINENT || '", ',
    '"' || REGION || '", ',
    SURFACEAREA || ', ',
    '"' || INDEPYEAR || '", ',
    POPULATION || ', ',
    '"' || LIFEEXPECTANCY || '", ',
    GNP || ', ',
    '"' || GNPOLD || '", ',
    '"' || LOCALNAME || '", ',
    '"' || GOVERNMENTFORM || '", ',
    '"' || HEADOFSTATE || '", ',
    '"' || CAPITAL || '", ',
    '"' || CODE2 || '")'
from
    COUNTRY;

-- querying the common country code from CITY and COUNTRY tables
select
    code
from
    CITY,
    COUNTRY
where
    CITY.COUNTRYCODE = COUNTRY.CODE;

-- checking out certain details making sure the details of each CONTINENT are stacked together
select
    t1.ID,
    t1.NAME,
    t1.DISTRICT,
    t1.POPULATION,
    t1.COUNTRYCODE,
    t2.NAME,
    t2.CONTINENT
from
    CITY t1,
    COUNTRY t2
where
    t1.COUNTRYCODE = t2.CODE
order by t2.CONTINENT;