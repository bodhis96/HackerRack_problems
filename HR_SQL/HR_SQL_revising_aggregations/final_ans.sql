-- the count function
select count(*) from CITY
where POPULATION > 100000;

-- the sum function
select sum(POPULATION) from CITY
where DISTRICT like 'California';

-- averages
select avg(POPULATION) from CITY
where DISTRICT like 'California';

-- average population
select round(avg(POPULATION)) from CITY;

-- Japan Population
select sum(POPULATION) from CITY
where upper(COUNTRYCODE) like 'JPN';

