-- selecting the maximum score for a given hacker in a given challenge
select
    hacker_id,
    challenge_id,
    max(score)
from 
    submissions
group by
    hacker_id,
    challenge_id
order by 
    hacker_id,
    challenge_id;


-- displaying the sum of maximum scores (for each chalenge) for each of the hackers
select
    hacker_id,
    sum(score_max) as score_total
from
    (
        select
            hacker_id,
            challenge_id,
            max(score) as SCORE_MAX
        from
            submissions
        group by
            hacker_id,
            challenge_id
        order by
            hacker_id,
            challenge_id
    )
group by
    hacker_id
order by
    score_total desc,
    hacker_id;