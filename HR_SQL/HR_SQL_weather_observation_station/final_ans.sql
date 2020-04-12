-- weather observation station 1 : Query a list of CITY and STATE from the STATION table
select CITY, STATE from STATION;

-- weather observation station 3 : Query a list of CITY names from STATION with even ID numbers only
select
    distinct CITY
from
    STATION
where
    mod(ID, 2) = 0
order by
    CITY;

-- weather observation station 4 : Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table
select
    count(CITY) - count(distinct CITY)
from
    STATION;

-- weather observation station 5 : Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
select
    *
from
    (
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
        order by
            CITY
    )
where
    rownum = 1
union    
select
    *
from
    (
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
        order by
            CITY
    )
where
    rownum = 1;

-- weather observation station 18 : MANHATTAM DISTANCE
select
    round(
        (
            ((max(LAT_N)) - (min(LAT_N))) + ((max(LONG_W)) - (min(LONG_W)))
        ),
        4
    )
from
    STATION;

-- weather observation station 19 : EUCLIDEAN DISTANCE
select
    round(
        sqrt(
            power(((max(LAT_N)) - (min(LAT_N))), 2) + power(((max(LONG_W)) - (min(LONG_W))), 2)
        ),
        4
    )
from
    STATION;

-- weather observation station 20 : EUCLIDEAN DISTANCE
select round(median(LAT_N), 4) from STATION;