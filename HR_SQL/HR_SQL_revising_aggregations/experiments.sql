-- display all the columns without making use of *
select 
    ID, 
    NAME,
    COUNTRYCODE,
    DISTRICT,
    POPULATION
from
    CITY;

-- displaying data making sure there are double quotes around the string data
select
    ID || ',' || ' ' || '"' || NAME || '"' || ',' || ' ' || '"' || COUNTRYCODE || '"' || ',' || ' ' || '"' || DISTRICT || '",',
    POPULATION
from
    CITY ;