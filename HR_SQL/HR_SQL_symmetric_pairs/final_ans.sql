select
    distinct tab1.X,
    tab1.Y
from
    (
        select
            X,
            Y,
            rownum as ROW_NUM
        from
            FUNCTIONS
    ) tab1,
    (
        select
            X,
            Y,
            rownum as ROW_NUM
        from
            FUNCTIONS
    ) tab2
where
    tab1.ROW_NUM != tab2.ROW_NUM
    and tab1.X <= tab1.Y
    and tab1.X = tab2.Y
    and tab1.Y = tab2.X
order by
    tab1.X;