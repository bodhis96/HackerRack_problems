-- enlisting the number of days it took to complete a task
-- and all the other columns
select 
    task_id,
    start_date,
    end_date,
    (end_date - start_date) as DAY_COUNT
from
    PROJECTS;


-- query to check the time gap between TASK_ID's of consecutive rows
select
    tab1.task_id_1,
    tab1.start_date_1,
    tab1.end_date_1,
    tab1.rownum_1,

    tab2.task_id_2,
    tab2.start_date_2,
    tab2.end_date_2,
    tab2.rownum_2,

    (tab2.start_date_2 - tab1.end_date_1) as GAP 
from
    (
        select
            task_id as task_id_1,
            start_date as start_date_1,
            end_date as end_date_1,
            rownum as rownum_1
        from
            PROJECTS
        order by
            end_date
    ) tab1,
    (
        select
            task_id as task_id_2,
            start_date as start_date_2,
            end_date as end_date_2,
            rownum as rownum_2
        from
            PROJECTS
        order by
            end_date
    ) tab2
where
    1 = 1
    and tab1.rownum_1 + 1 = tab2.rownum_2;

-- final ans (wrong ans)
select
    TAB1.START_DATE,
    min(TAB2.END_DATE)
from
    (
        select
            START_DATE
        from
            PROJECTS
        where
            START_DATE not in (
                select
                    END_DATE
                from
                    PROJECTS
            )
        order by
            START_DATE
    ) TAB1,
    (
        select
            END_DATE
        from
            PROJECTS
        where
            END_DATE not in (
                select
                    START_DATE
                from
                    PROJECTS
            )
        order by
            END_DATE
    ) TAB2
where
    START_DATE < END_DATE
group by
    START_DATE
order by
    START_DATE

