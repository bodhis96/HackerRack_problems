select
    START_DATE,
    END_DATE
from
(
    select
        TAB1.START_DATE as START_DATE,
        min(TAB2.END_DATE) as END_DATE
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
        ) TAB2
    where
        START_DATE < END_DATE
    group by
        START_DATE
)
order by
    (END_DATE - START_DATE),
    START_DATE
