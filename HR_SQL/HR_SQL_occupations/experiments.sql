-- making use of 'CASE'
select
    case
        occupation
        when 'Doctor' then name -- else 'NULL'
    end as doctor,
    case
        occupation
        when 'Professor' then name -- else 'NULL'
    end as professor,
    case
        occupation
        when 'Singer' then name -- else 'NULL'
    end as singer,
    case
        occupation
        when 'Actor' then name -- else 'NULL'
    end as actor
from
    ( select * from occupations order by name );


-- enlisting numbers 1 to 100
Select Rownum r
From dual
Connect By Rownum <= 100;


--  : Verifying with extra columns
with row_indicator as(
    Select Rownum as row_num
    From dual Connect By Rownum <= ( select max(total) from ( select count(*) as total from occupations group by occupation ) )
), 
data_doctor as(
    select name, occupation, rownum as row_num
    from ( select name, occupation from occupations where occupation like 'Doctor' order by name )
    order by row_num
),
data_professor as(
    select name, occupation, rownum as row_num
    from ( select name, occupation from occupations where occupation like 'Professor' order by name )
    order by row_num
),
data_singer as(
    select name, occupation, rownum as row_num
    from ( select name, occupation from occupations where occupation like 'Singer' order by name )
    order by row_num
),
data_actor as(
    select name, occupation, rownum as row_num
    from ( select name, occupation from occupations where occupation like 'Actor' order by name )
    order by row_num
)
select
    t1.name, t1.occupation, t1.row_num,
    t2.name, t2.occupation, t2.row_num,
    t3.name, t3.occupation, t3.row_num,
    t4.name, t4.occupation, t4.row_num
from
    data_doctor         t1,
    data_professor      t2,
    data_singer         t3,
    data_actor          t4,
    row_indicator       tr

where
    (
        tr.row_num = t1.row_num(+)
        and tr.row_num = t2.row_num(+)
        and tr.row_num = t3.row_num(+)
        and tr.row_num = t4.row_num(+)
    );


-- enlisting numbers 1 to 100
Select Rownum r
From dual
Connect By Rownum <= 100;