-- selecting the lengths of the shortest and longest city names
select
    min(length(CITY)),
    max(length(CITY))
from
    STATION;

-- selecting name of the cities with the shortest name
select
    CITY,
    length(CITY)
from
    STATION
where length(CITY) = min(length(CITY));

-- selecting name of the cities with the longest name
select
    CITY,
    length(CITY)
from
    STATION
where length(CITY) = max(length(CITY));

-- selecting the shortest city name that appears first alphabetically
select
    CITY,
    length(CITY)
from
    STATION
where
    length(CITY) = (
        select
            min(length(CITY))
        from
            STATION
    )
    and rownum = 1
order by
    CITY;

-- selecting the longest city name that appears first alphabetically
select
    CITY,
    length(CITY)
from
    STATION
where
    length(CITY) = (
        select
            max(length(CITY))
        from
            STATION
    )
    and rownum = 1
order by
    CITY;

-- selecting the shortest and the longest city names
select
    CITY,
    length(CITY)
from
    STATION
where
    length(CITY) = (
        select
            min(length(CITY))
        from
            STATION
    )
    or length(CITY) = (
        select
            max(length(CITY))
        from
            STATION
    )
order by
    CITY;

-- selecting the shortest and the longest city names  that appears first alphabetically
select
    CITY,
    length(CITY)
from
    STATION
where
    (
        length(CITY) = (
            select
                min(length(CITY))
            from
                STATION
        )
        and rownum = 1
    )
    or 
    (
        length(CITY) = (
            select
                max(length(CITY))
            from
                STATION
        )
        and rownum = 1
    )
order by
    CITY;

-- selecting all the columns without using '*'
select
    ID,
    CITY,
    STATE,
    LAT_N,
    LONG_W
from
    STATION;

-- Getting the output in the form of insert statements
select
    'into STATION values (' || ID || ',',
    '"' || CITY || '",',
    '"' || STATE || '",',
    LAT_N || ',',
    LONG_W || ')'
from
    STATION;

-- some values (18)
select min(LAT_N) from STATION; -- a
select min(LONG_W) from STATION; -- b
select max(LAT_N) from STATION; -- c
select max(LONG_W) from STATION; -- d

-- RANGE : LAT_N
select ((max(LAT_N)) - (min(LAT_N))) from STATION;

-- RANGE : LONG_W
select ((max(LONG_W)) - (min(LONG_W))) from STATION;

-- SUM OF RANGES
select ((max(LAT_N)) - (min(LAT_N))) + ((max(LONG_W)) - (min(LONG_W))) from STATION;

-- SUM OF RANGES ROUNDED TO 4 DECIMAL PLACES
select round((((max(LAT_N)) - (min(LAT_N))) + ((max(LONG_W)) - (min(LONG_W)))), 4) from STATION;

select ((max(LAT_N)) - (min(LAT_N))) + ((max(LONG_W)) - (min(LONG_W))) from STATION;

-- RANGE ^ 2 : LAT_N
select power(((max(LAT_N)) - (min(LAT_N))), 2) from STATION;

-- RANGE ^ 2 : LONG_W
select power(((max(LONG_W)) - (min(LONG_W))), 2) from STATION;

-- SUM OF RANGE ^ 2
select
    power(((max(LAT_N)) - (min(LAT_N))), 2) + power(((max(LONG_W)) - (min(LONG_W))), 2)
from
    STATION;

-- SQUARE ROOT OF SUM OF RANGE ^ 2
select
    round(
        sqrt(
            power(((max(LAT_N)) - (min(LAT_N))), 2) + power(((max(LONG_W)) - (min(LONG_W))), 2)
        ),
        4
    )
from
    STATION;

-- median value of LAT_N
select median(LAT_N) from STATION;

-- median value of LONG_W
select median(LONG_W) from STATION;