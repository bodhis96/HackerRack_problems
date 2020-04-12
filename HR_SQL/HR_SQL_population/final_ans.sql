-- Average Population
select
    t2.CONTINENT,
    floor(avg(t1.POPULATION))
from
    CITY t1,
    COUNTRY t2
where
    t1.COUNTRYCODE = t2.CODE
group by
    t2.CONTINENT;

-- Asian Population
select
    sum(t1.POPULATION)
from
    CITY t1,
    COUNTRY t2
where
    t1.COUNTRYCODE = t2.CODE
    and t2.CONTINENT = 'Asia'

-- African Cities
select
    t1.NAME
from
    CITY t1,
    COUNTRY t2
where
    t1.COUNTRYCODE = t2.CODE
    and t2.CONTINENT = 'Africa';