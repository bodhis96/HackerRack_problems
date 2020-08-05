/* 
Write a query to print the 
    contest_id, 
    hacker_id, 
    name, 
    the sums of total_submissions, 
    total_accepted_submissions, 
    total_views, 
    total_unique_views 
for each contest sorted by 
    contest_id. 
Exclude the contest from the result if all four sums are .

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.
 */


-- checking the sum of values of other column for each CHALLENGE_ID
-- from SUBMISSION_STATS table
select
    CHALLENGE_ID,
    sum(TOTAL_SUBMISSIONS),
    sum(TOTAL_ACCEPTED_SUBMISSIONS)
from
    SUBMISSION_STATS
group by
    CHALLENGE_ID
order by
    CHALLENGE_ID;

-- checking the sum of values of other column for each CHALLENGE_ID
-- from VIEW_STATS table
select
    CHALLENGE_ID,
    sum(TOTAL_VIEWS),
    sum(TOTAL_UNIQUE_VIEWS)
from
    VIEW_STATS
group by
    CHALLENGE_ID
order by
    CHALLENGE_ID;

-- checking the sum of values of other column for each CHALLENGE_ID
-- from SUBMISSION_STATS and VIEW_STATS tables
select
    subs.CHALLENGE_ID,

    sum(subs.TOTAL_SUBMISSIONS),
    sum(subs.TOTAL_ACCEPTED_SUBMISSIONS),

    sum(vies.TOTAL_VIEWS),
    sum(vies.TOTAL_UNIQUE_VIEWS)
from
    SUBMISSION_STATS subs,

    VIEW_STATS vies
where
    subs.CHALLENGE_ID = vies.CHALLENGE_ID
group by
    subs.CHALLENGE_ID
order by
    subs.CHALLENGE_ID;

-- displaying all the CHALLENGE_IDs for each of the CONTEST_IDs
select
    con.CONTEST_ID,
    col.COLLEGE_ID,
    cha.CHALLENGE_ID
from
    CONTESTS con,
    COLLEGES col,
    CHALLENGES cha
where
    1 = 1
    and con.CONTEST_ID = col.CONTEST_ID
    and col.COLLEGE_ID = cha.COLLEGE_ID
order by
    con.CONTEST_ID,
    col.COLLEGE_ID,
    cha.CHALLENGE_ID;


-- attempting to display all the data may be required
select
    con.CONTEST_ID,
    con.HACKER_ID,
    con.name,
    col.COLLEGE_ID,
    cha.CHALLENGE_ID,
    subs.TOTAL_SUBMISSIONS,
    subs.TOTAL_ACCEPTED_SUBMISSIONS,
    vies.TOTAL_VIEWS,
    vies.TOTAL_UNIQUE_VIEWS
from
    CONTESTS con,
    COLLEGES col,
    CHALLENGES cha,
    SUBMISSION_STATS subs,
    VIEW_STATS vies
where
    1 = 1
    and con.CONTEST_ID = col.CONTEST_ID
    and col.COLLEGE_ID = cha.COLLEGE_ID
    and cha.CHALLENGE_ID = subs.CHALLENGE_ID
    and cha.CHALLENGE_ID = vies.CHALLENGE_ID

-- attempting to display the SUM of 
    -- TOTAL_SUBMISSIONS,
    -- TOTAL_ACCEPTED_SUBMISSIONS,
    -- TOTAL_VIEWS,
    -- TOTAL_UNIQUE_VIEWS
-- separately
select
    con.CONTEST_ID,
    con.HACKER_ID,
    con.name,
    sum(subs.TOTAL_SUBMISSIONS),
    sum(subs.TOTAL_ACCEPTED_SUBMISSIONS),
    sum(vies.TOTAL_VIEWS),
    sum(vies.TOTAL_UNIQUE_VIEWS)
from
    CONTESTS con,
    COLLEGES col,
    CHALLENGES cha,
    SUBMISSION_STATS subs,
    VIEW_STATS vies
where
    1 = 1
    and con.CONTEST_ID = col.CONTEST_ID
    and col.COLLEGE_ID = cha.COLLEGE_ID
    and cha.CHALLENGE_ID = subs.CHALLENGE_ID
    and cha.CHALLENGE_ID = vies.CHALLENGE_ID
group by
    con.CONTEST_ID,
    con.HACKER_ID,
    con.name
order by
    con.CONTEST_ID

-- displaying the sum of the 4 parameters for each CONTEST
select
    con.CONTEST_ID,
    con.HACKER_ID,
    con.name,
    (
        sum(subs.TOTAL_SUBMISSIONS) + sum(subs.TOTAL_ACCEPTED_SUBMISSIONS) + sum(vies.TOTAL_VIEWS) + sum(vies.TOTAL_UNIQUE_VIEWS)
    ) as TOTAL_SUM
from
    CONTESTS con,
    COLLEGES col,
    CHALLENGES cha,
    SUBMISSION_STATS subs,
    VIEW_STATS vies
where
    1 = 1
    and con.CONTEST_ID = col.CONTEST_ID
    and col.COLLEGE_ID = cha.COLLEGE_ID
    and cha.CHALLENGE_ID = subs.CHALLENGE_ID
    and cha.CHALLENGE_ID = vies.CHALLENGE_ID
group by
    con.CONTEST_ID,
    con.HACKER_ID,
    con.name
order by
    con.CONTEST_ID

-- DISPLAYING CONTENTS TO THE 2 STATS TABLES
select * from View_Stats order by challenge_id;
select * from Submission_Stats order by challenge_id;