with total_score as (
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
        hacker_id
)
select
    hackers.hacker_id,
    hackers.name,
    total_score.score_total
from
    hackers,
    total_score
where
    1 = 1
    and hackers.hacker_id = total_score.hacker_id
    and total_score.score_total != 0
order by
    total_score.score_total desc,
    hackers.hacker_id;