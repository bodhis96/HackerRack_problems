-- query to display table data from HACKERS table as insert statements for INSERT ALL clause
select
    'into HACKERS values(' || HACKER_ID || ', ',
    '"' || NAME || '")'
from
    HACKERS;

-- query to display table data from DIFFICULTY table as insert statements for INSERT ALL clause
select
    'into DIFFICULTY values (' || DIFFICULTY_LEVEL || ', ',
    SCORE || '")'
from
    DIFFICULTY;

-- query to display table data from CHALLENGES table as insert statements for INSERT ALL clause
select
    'into CHALLENGES values (' || CHALLENGE_ID || ', ',
    HACKER_ID || ', ',
    DIFFICULTY_LEVEL || ')'
from
    CHALLENGES;

-- query to display table data from SUBMISSIONS table as insert statements for INSERT ALL clause
select 
    'into SUBMISSIONS values (' || SUBMISSION_ID || ', ',
    HACKER_ID || ', ',
    CHALLENGE_ID || ', ',
    SCORE || ')'
from
    SUBMISSIONS;
-- using the above query, most of the rows are getting truncated; use the queries below and insert data 500 rows at a time    
    -- row number 1 to 500
    select
        'into SUBMISSIONS values (' || SUBMISSION_ID || ', ',
        HACKER_ID || ', ',
        CHALLENGE_ID || ', ',
        SCORE || ')'
    from
        ( select SUBMISSION_ID, HACKER_ID, CHALLENGE_ID, SCORE, ROW_NUMBER() OVER ( order by SUBMISSION_ID ) as R from SUBMISSIONS )
    where
        R between 1
        and 500;
    -- row number 501 to 1000
    select
        'into SUBMISSIONS values (' || SUBMISSION_ID || ', ',
        HACKER_ID || ', ',
        CHALLENGE_ID || ', ',
        SCORE || ')'
    from
        ( select SUBMISSION_ID, HACKER_ID, CHALLENGE_ID, SCORE, ROW_NUMBER() OVER ( order by SUBMISSION_ID ) as R from SUBMISSIONS )
    where
        R between 501
        and 1000;
    -- row number 1001 to 1500
    select
        'into SUBMISSIONS values (' || SUBMISSION_ID || ', ',
        HACKER_ID || ', ',
        CHALLENGE_ID || ', ',
        SCORE || ')'
    from
        ( select SUBMISSION_ID, HACKER_ID, CHALLENGE_ID, SCORE, ROW_NUMBER() OVER ( order by SUBMISSION_ID ) as R from SUBMISSIONS )
    where
        R between 1001
        and 1500;
    -- row number 1501 to 2000
    select
        'into SUBMISSIONS values (' || SUBMISSION_ID || ', ',
        HACKER_ID || ', ',
        CHALLENGE_ID || ', ',
        SCORE || ')'
    from
        ( select SUBMISSION_ID, HACKER_ID, CHALLENGE_ID, SCORE, ROW_NUMBER() OVER ( order by SUBMISSION_ID ) as R from SUBMISSIONS )
    where
        R between 1501
        and 2000;

-- displaying all the submissions with perfect score
select
    *
from
    SUBMISSIONS
where
    SCORE = 100;

-- displaying the count of the challenges in which each hacker got a perfect score
select
    HACKER_ID,
    count(*)
from
    SUBMISSIONS
where
    SCORE = 100
GROUP BY
    HACKER_ID;

-- trying to find out the final query
with FULL_SCORERS as(
    select
        HACKER_ID,
        count(*) as FULL_SCORE_COUNT
    from
        SUBMISSIONS
    where
        SCORE = 100
    GROUP BY
        HACKER_ID
)
select
    hac.HACKER_ID,
    hac.NAME,
    fs.FULL_SCORE_COUNT
from
    HACKERS hac,
    FULL_SCORERS fs
where
    hac.HACKER_ID = fs.HACKER_ID
order by
    fs.FULL_SCORE_COUNT desc,
    hac.HACKER_ID;


-- displaying HACKER_ID and NAMES for those getting perfect_scores
select
    hk.hacker_id,
    hk.name,
    sb.score,
    df.score as PERFECT_SCORE,
    df.difficulty_level
from
    Hackers hk,

    -- for SCORE
    Submissions sb,

    -- for CHALLENGE_ID
    Challenges cl,

    -- for SCORE (perfect)
    Difficulty df
where
    1 = 1 
    
    -- for SCORE
    and hk.hacker_id = sb.hacker_id 
    
    -- for CHALLENGE_ID
    and sb.hacker_id = cl.hacker_id
    
    -- for SCORE (perfect)
    and cl.difficulty_level = df.difficulty_level
    
    -- displaying only those data where score = perfect_score
    and sb.score = df.score


