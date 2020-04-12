select
    w.id,
    min_coin.age,
    min_coin.coins_needed,
    min_coin.power
from
    wands w,
    (
        select
            w.power as POWER,
            wp.age as AGE,
            wp.code as CODE,
            min(w.coins_needed) as COINS_NEEDED
        from
            wands w,
            wands_property wp
        where
            1 = 1
            and w.code = wp.code
            and wp.is_evil = 0
        group by
            w.power,
            wp.age,
            wp.code
        order by
            w.power desc,
            wp.age desc 
    ) min_coin
where
    1 = 1
    and w.coins_needed = min_coin.coins_needed
    and w.code = min_coin.code
order by 
    min_coin.power desc,
    min_coin.age desc;