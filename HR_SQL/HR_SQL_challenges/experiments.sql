-- challenges created by each student
;select
    hk.hacker_id as HACKER_ID,
    hk.name as NAME,
    count(ch.challenge_id) as COUNT_CHALLENGE
from
    hackers hk,
    challenges ch
where
    1 = 1
    and hk.hacker_id = ch.hacker_id
group by
    hk.hacker_id,
    hk.name
order by
    count(ch.challenge_id) desc,
    hk.hacker_id
;

-- enlist the count of students with a particular number of challenge count
;select
    COUNT_CHALLENGE,
    count(*) as COUNT_HACKER
from
(
    select
        hk.hacker_id as HACKER_ID,
        hk.name as NAME,
        count(ch.challenge_id) as COUNT_CHALLENGE
    from
        hackers hk,
        challenges ch
    where
        1 = 1
        and hk.hacker_id = ch.hacker_id
    group by
        hk.hacker_id,
        hk.name
    order by
        count(ch.challenge_id) desc,
        hk.hacker_id
)
group by
    COUNT_CHALLENGE
order by
    COUNT_CHALLENGE
;