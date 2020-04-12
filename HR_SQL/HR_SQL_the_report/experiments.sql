-- query to display table data from GRADES table as insert statements for INSERT ALL clause
select
    'into GRADES values (' || GRADE || ', ',
    MIN_MARK || ', ',
    MAX_MARK || ')'
from
    GRADES;

-- query to display table data from STUDENTS table as insert statements for INSERT ALL clause
select 
    'into STUDENTS values (' || ID || ', ',
    '"' || NAME || '"',
    ', ' || MARKS || ')'
from STUDENTS;

-- showing grades of all the students in descding order of their GRADES and then ascending order of their names
select
    t1.NAME,
    t2.GRADE,
    t1.MARKS
from
    STUDENTS t1,
    GRADES t2
where
    t1.MARKS between t2.MIN_MARK and t2.MAX_MARK
order by
    t1.MARKS,
    t1.NAME;

-- displaying student names based on their marks using DECODE
select
    GRADE,
    decode (GRADE,
    10, 'A',
    9, 'B',
    8, 'C',
    7, 'D',
    6, 'E',
    'F') LETTER
from GRADES;

-- trying out DECODE function using 2 tables STUDENTS and GRADES
select
    decode (t2.GRADE,
    10, t1.NAME,
    9, t1.NAME,
    8, t1.NAME,
    NULL) as NAME,
    t2.GRADE,
    t1.MARKS
from
    STUDENTS t1,
    GRADES t2
where
    t1.MARKS between t2.MIN_MARK and t2.MAX_MARK