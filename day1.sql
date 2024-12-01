-- 2024 Day1
with 
base as (
    from read_csv('input.txt', columns={'pair': 'varchar'})
    select 
        pair.str_split(' ') as splitted
        , splitted[1]::numeric as lhs
        , splitted[-1]::numeric as rhs
        , row_number() over(order by lhs) as lhs_rn
        , row_number() over(order by rhs) as rhs_rn
),
part1 as (
    from 
        base l 
        join base r 
            on l.lhs_rn = r.rhs_rn 
    select sum(abs(l.lhs - r.rhs)) as answer
),
part2 as (
    from base l
    select 
        sum(lhs * ( select count(1) from base r where l.lhs = r.rhs )) as answer 
)
from part1 select 'part1', answer as part
union all
from part2 select 'part2', answer as part
;
