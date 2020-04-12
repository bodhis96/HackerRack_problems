select
    hacker_id,
    name
from
    (
        select
            hk.hacker_id,
            hk.name,
            count(*) as COUNTS
        from
            hackers hk,
            submissions sb,
            challenges ch,
            difficulty df
        where
            1 = 1
            and hk.hacker_id = sb.hacker_id
            and sb.challenge_id = ch.challenge_id
            and ch.difficulty_level = df.difficulty_level
            and sb.score = df.score
        group by
            hk.hacker_id,
            hk.name
        order by
            count(*) desc,
            hacker_id
    )
where
    counts > 1