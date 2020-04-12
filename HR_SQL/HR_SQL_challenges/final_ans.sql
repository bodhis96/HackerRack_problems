with challenge_count as (
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
),
hacker_count as (
    select
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
)
select
    challenge_count.HACKER_ID,
    challenge_count.NAME,
    challenge_count.COUNT_CHALLENGE
from
    challenge_count challenge_count,
    hacker_count hacker_count
where
    1 = 1
    and challenge_count.COUNT_CHALLENGE = hacker_count.COUNT_CHALLENGE
    and (
        hacker_count.COUNT_HACKER = 1
        or challenge_count.COUNT_CHALLENGE = (
            select
                max(COUNT_CHALLENGE)
            from
                challenge_count
        )
    )
order by
    challenge_count.COUNT_CHALLENGE desc,
    challenge_count.hacker_id;