with CO_LM as (
    -- counting number of lead managers per company
    select COMPANY_CODE, count(*) as COUNT_LM
    from ( select distinct COMPANY_CODE, LEAD_MANAGER_CODE from LEAD_MANAGER order by COMPANY_CODE )
    group by COMPANY_CODE
    order by COMPANY_CODE
),
CO_SM as (
    -- counting number of senior managers per company
    select COMPANY_CODE, count(*) as COUNT_SM
    from ( select distinct COMPANY_CODE, SENIOR_MANAGER_CODE from SENIOR_MANAGER order by COMPANY_CODE )
    group by COMPANY_CODE
    order by COMPANY_CODE
),
CO_M as (
    -- counting number of managers per company
    select COMPANY_CODE, count(*) as COUNT_M
    from ( select distinct COMPANY_CODE, MANAGER_CODE from MANAGER order by COMPANY_CODE )
    group by COMPANY_CODE
    order by COMPANY_CODE
),
CO_EMP as (
    -- counting number of employees per company
    select COMPANY_CODE, count(*) as COUNT_EMP
    from ( select distinct COMPANY_CODE, EMPLOYEE_CODE from EMPLOYEE order by COMPANY_CODE )
    group by COMPANY_CODE
    order by COMPANY_CODE
)
select
    -- primary SELECT query
    co.COMPANY_CODE,
    co.FOUNDER,
    co_lm.COUNT_LM,
    co_sm.COUNT_SM,
    co_m.COUNT_M,
    co_emp.COUNT_EMP
from
    COMPANY co,
    CO_LM,
    CO_SM,
    CO_M,
    CO_EMP
where
    co.COMPANY_CODE = co_lm.COMPANY_CODE
    and co.COMPANY_CODE = co_sm.COMPANY_CODE
    and co.COMPANY_CODE = co_m.COMPANY_CODE
    and co.COMPANY_CODE = co_emp.COMPANY_CODE
order by
    co.COMPANY_CODE;