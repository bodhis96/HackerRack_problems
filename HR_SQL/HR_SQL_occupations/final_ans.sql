-- *** FINAL ANSWER ***
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
    t1.name, t2.name, t3.name, t4.name 
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