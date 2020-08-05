select
    con.CONTEST_ID,
    con.HACKER_ID,
    con.NAME,
    sum(substa.TOTAL_SUBMISSIONS),
    sum(substa.TOTAL_ACCEPTED_SUBMISSIONS),
    sum(viesta.TOTAL_VIEWS),
    sum(viesta.TOTAL_UNIQUE_VIEWS)
from
    CONTESTS con,
    COLLEGES col,
    CHALLENGES cha,
    (
        select
            CHALLENGE_ID,
            sum(TOTAL_SUBMISSIONS) as TOTAL_SUBMISSIONS,
            sum(TOTAL_ACCEPTED_SUBMISSIONS) as TOTAL_ACCEPTED_SUBMISSIONS
        from
            SUBMISSION_STATS
        group by
            CHALLENGE_ID
    ) substa,
    (
        select
            CHALLENGE_ID,
            sum(TOTAL_VIEWS) as TOTAL_VIEWS,
            sum(TOTAL_UNIQUE_VIEWS) as TOTAL_UNIQUE_VIEWS
        from
            VIEW_STATS
        group by
            CHALLENGE_ID
    ) viesta
where
    con.CONTEST_ID = col.CONTEST_ID
    and col.COLLEGE_ID = cha.COLLEGE_ID
    and cha.CHALLENGE_ID = substa.CHALLENGE_ID(+)
    and cha.CHALLENGE_ID = viesta.CHALLENGE_ID(+)
group by
    con.CONTEST_ID,
    con.HACKER_ID,
    con.NAME
having
    (
        sum(substa.TOTAL_SUBMISSIONS) + sum(substa.TOTAL_ACCEPTED_SUBMISSIONS) + sum(viesta.TOTAL_VIEWS) + sum(viesta.TOTAL_UNIQUE_VIEWS)
    ) != 0
order by
    con.CONTEST_ID;