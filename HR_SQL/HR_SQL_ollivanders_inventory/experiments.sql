-- query to display table data from WANDS table as insert statements for INSERT ALL clause
select
    'into WANDS values (' || ID || ', ' || CODE || ', ' || COINS_NEEDED || ', ',
    POWER || ')'
from
    WANDS;

-- query to display table data from WANDS_PROPERTY table as insert statements for INSERT ALL clause
select
    'into WANDS_PROPERTY values (' || CODE || ', ' || AGE || ', ' ,
    IS_EVIL || ')'
from
    WANDS_PROPERTY;

-- displaying all the columns after joining the 2 tables
select
    t1.ID,
    t1.CODE,
    t1.COINS_NEEDED,
    t1.POWER,
    t2.AGE,
    t2.IS_EVIL
from
    WANDS t1,
    WANDS_PROPERTY t2
where
    t1.CODE = t2.CODE;

-- displaying all the columns after joining the 2 tables in descending order of age
select
    t1.ID,
    t1.CODE,
    t1.COINS_NEEDED,
    t1.POWER,
    t2.AGE,
    t2.IS_EVIL
from
    WANDS t1,
    WANDS_PROPERTY t2
where
    t1.CODE = t2.CODE
order by
    age desc;