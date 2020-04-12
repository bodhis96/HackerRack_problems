select
    decode (t2.GRADE,
        10, t1.NAME,
        9, t1.NAME,
        8, t1.NAME,
        NULL
    ) as NAME,
    t2.GRADE,
    t1.MARKS
from
    STUDENTS t1,
    GRADES t2
where
    t1.MARKS between t2.MIN_MARK and t2.MAX_MARK
order by
    t2.GRADE desc,
    t1.NAME;