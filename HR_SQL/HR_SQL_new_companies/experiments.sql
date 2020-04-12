    -- *** EXPERIMENTS ***
    -- company_code, 
    -- founder name, 
    -- total number of lead managers, 
    -- total number of senior managers, 
    -- total number of managers, 
    -- total number of employees
    select distinct COMPANY_CODE, FOUNDER from company order by COMPANY_CODE;

    -- CO_LM_COUNT : counting the number of LEAD_MANAGER in each company
    select
        COMPANY_CODE,
        count(*) as LEAD_MANAGER_COUNT
    from
        (
            select
                distinct COMPANY_CODE,
                LEAD_MANAGER_CODE
            from
                LEAD_MANAGER
            order by
                COMPANY_CODE
        )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- CO_SM_COUNT : counting the number of SENIOR_MANAGER in each company
    select
        COMPANY_CODE,
        count(*) as SENIOR_MANAGER_COUNT
    from
        (
            select
                distinct COMPANY_CODE,
                SENIOR_MANAGER_CODE
            from
                SENIOR_MANAGER
            order by
                COMPANY_CODE
        )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- CO_M_COUNT : counting the number of MANAGERS in each company
    select
        COMPANY_CODE,
        count(*) as MANAGER
    from
        (
            select
                distinct COMPANY_CODE,
                MANAGER_CODE
            from
                MANAGER
            order by
                COMPANY_CODE
        )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- EXPERMENT : Final Code
    with CO_LM_COUNT as (
        select
            COMPANY_CODE,
            count(*) as LEAD_MANAGER_COUNT
        from
            (
                select
                    distinct COMPANY_CODE,
                    LEAD_MANAGER_CODE
                from
                    LEAD_MANAGER
                order by
                    COMPANY_CODE
            )
        group by
            COMPANY_CODE
        order by
            COMPANY_CODE
    ),
    CO_SM_COUNT as(
        select
            COMPANY_CODE,
            count(*) as SENIOR_MANAGER_COUNT
        from
            (
                select
                    distinct COMPANY_CODE,
                    SENIOR_MANAGER_CODE
                from
                    SENIOR_MANAGER
                order by
                    COMPANY_CODE
            )
        group by
            COMPANY_CODE
        order by
            COMPANY_CODE
    ),
    CO_M_COUNT as(
        select
            COMPANY_CODE,
            count(*) as MANAGER_COUNT
        from
            (
                select
                    distinct COMPANY_CODE,
                    MANAGER_CODE
                from
                    MANAGER
                order by
                    COMPANY_CODE
            )
        group by
            COMPANY_CODE
        order by
            COMPANY_CODE
    ),
    CO_EMP_COUNT as(
        select
            COMPANY_CODE,
            count(*) as EMPLOYEE_COUNT
        from
            (
                select
                    distinct COMPANY_CODE,
                    EMPLOYEE_CODE
                from
                    EMPLOYEE
                order by
                    COMPANY_CODE
            )
        group by
            COMPANY_CODE
        order by
            COMPANY_CODE
    )
    select
        distinct co.COMPANY_CODE as COMPANY_CODE,
        co.FOUNDER as FOUNDER_NAME,
        co_lm_count.LEAD_MANAGER_COUNT as COUNT_LEAD_MANAGER,
        co_sm_count.SENIOR_MANAGER_COUNT as COUNT_SENIOR_MANAGER,
        co_m_count.MANAGER_COUNT as COUNT_MANAGER,
        co_emp_count.EMPLOYEE_COUNT as COUNT_EMPLOYE
    from
        COMPANY co,
        -- tables created using 'WITH' clause
        co_lm_count,
        co_sm_count,
        co_m_count,
        co_emp_count
    where
        co.COMPANY_CODE = co_lm_count.COMPANY_CODE
        and co.COMPANY_CODE = co_sm_count.COMPANY_CODE
        and co.COMPANY_CODE = co_m_count.COMPANY_CODE
    order by
        COMPANY_CODE;


    -- EXPERMENT : Final Code 2
    -- table for LEAD MANAGER
    with CO_LM as (
        select
            distinct COMPANY_CODE,
            LEAD_MANAGER_CODE
        from
            LEAD_MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for SENIOR MANAGER
    CO_SM as(
        select
            distinct COMPANY_CODE,
            SENIOR_MANAGER_CODE
        from
            SENIOR_MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for MANAGER
    CO_M as(
        select
            distinct COMPANY_CODE,
            MANAGER_CODE
        from
            MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for EMPLOYEE
    CO_EMP as(
        select
            distinct COMPANY_CODE,
            EMPLOYEE_CODE
        from
            EMPLOYEE
        order by
            COMPANY_CODE
    )
    -- primary SELECT QUERY
    select
        distinct co.COMPANY_CODE as COMPANY_CODE,
        co.FOUNDER as FOUNDER_NAME,
        sum(to_number(to_char(co_lm.LEAD_MANAGER_CODE))),
        sum(to_number(to_char(co_sm.SENIOR_MANAGER_CODE))),
        sum(to_number(to_char(co_m.MANAGER_CODE))),
        sum(to_number(to_char(co_emp.EMPLOYEE_CODE)))
    from
        COMPANY co,
        -- tables created using 'WITH' clause
        co_lm,
        co_sm,
        co_m,
        co_emp
    where
        co.COMPANY_CODE = co_lm.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_sm.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_m.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_emp.EMPLOYEE_CODE(+)
    group by
        co.COMPANY_CODE,
        co.FOUNDER
    order by
        co.COMPANY_CODE;



    -- EXPERMENT : Final Code 3
    select
        COMPANY_CODE,
        FOUNDER_NAME,
        sum(COUNT_LEAD_MANAGER),
        sum(COUNT_SENIOR_MANAGER),
        sum(COUNT_MANAGER),
        sum(COUNT_EMPLOYEE)
    from
        (
            -- table for LEAD MANAGER
            with CO_LM_COUNT as (
                select
                    COMPANY_CODE,
                    count(*) as LEAD_MANAGER_COUNT
                from
                    (
                        select
                            distinct COMPANY_CODE,
                            LEAD_MANAGER_CODE
                        from
                            LEAD_MANAGER
                        order by
                            COMPANY_CODE
                    )
                group by
                    COMPANY_CODE
                order by
                    COMPANY_CODE
            ),
            -- table for SENIOR MANAGER
            CO_SM_COUNT as(
                select
                    COMPANY_CODE,
                    count(*) as SENIOR_MANAGER_COUNT
                from
                    (
                        select
                            distinct COMPANY_CODE,
                            SENIOR_MANAGER_CODE
                        from
                            SENIOR_MANAGER
                        order by
                            COMPANY_CODE
                    )
                group by
                    COMPANY_CODE
                order by
                    COMPANY_CODE
            ),
            -- table for MANAGER
            CO_M_COUNT as(
                select
                    COMPANY_CODE,
                    count(*) as MANAGER_COUNT
                from
                    (
                        select
                            distinct COMPANY_CODE,
                            MANAGER_CODE
                        from
                            MANAGER
                        order by
                            COMPANY_CODE
                    )
                group by
                    COMPANY_CODE
                order by
                    COMPANY_CODE
            ),
            -- table for EMPLOYEE
            CO_EMP_COUNT as(
                select
                    COMPANY_CODE,
                    count(*) as EMPLOYEE_COUNT
                from
                    (
                        select
                            distinct COMPANY_CODE,
                            EMPLOYEE_CODE
                        from
                            EMPLOYEE
                        order by
                            COMPANY_CODE
                    )
                group by
                    COMPANY_CODE
                order by
                    COMPANY_CODE
            )
            -- primary SELECT query
            select
                distinct co.COMPANY_CODE as COMPANY_CODE,
                co.FOUNDER as FOUNDER_NAME,
                co_lm_count.LEAD_MANAGER_COUNT as COUNT_LEAD_MANAGER,
                co_sm_count.SENIOR_MANAGER_COUNT as COUNT_SENIOR_MANAGER,
                co_m_count.MANAGER_COUNT as COUNT_MANAGER,
                co_emp_count.EMPLOYEE_COUNT as COUNT_EMPLOYEE
            from
                COMPANY co,
                -- tables created using 'WITH' clause
                co_lm_count,
                co_sm_count,
                co_m_count,
                co_emp_count
            where
                co.COMPANY_CODE = co_lm_count.COMPANY_CODE
                and co.COMPANY_CODE = co_sm_count.COMPANY_CODE
                and co.COMPANY_CODE = co_m_count.COMPANY_CODE
            order by
                COMPANY_CODE
        )
    group by
        COMPANY_CODE,
        FOUNDER_NAME
    order by
        COMPANY_CODE,
        FOUNDER_NAME;


    -- EXPERIMENT : Final code 4
    -- table for LEAD MANAGER
    with CO_LM as (
        select
            distinct COMPANY_CODE,
            LEAD_MANAGER_CODE
        from
            LEAD_MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for SENIOR MANAGER
    CO_SM as(
        select
            distinct COMPANY_CODE,
            SENIOR_MANAGER_CODE
        from
            SENIOR_MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for MANAGER
    CO_M as(
        select
            distinct COMPANY_CODE,
            MANAGER_CODE
        from
            MANAGER
        order by
            COMPANY_CODE
    ),
    -- table for EMPLOYEE
    CO_EMP as(
        select
            distinct COMPANY_CODE,
            EMPLOYEE_CODE
        from
            EMPLOYEE
        order by
            COMPANY_CODE
    )
    -- primary SELECT QUERY
    select
        distinct co.COMPANY_CODE as COMPANY_CODE,
        co.FOUNDER as FOUNDER_NAME,
        -- sum(to_number(to_char(co_lm.LEAD_MANAGER_CODE))),
        -- sum(to_number(to_char(co_sm.SENIOR_MANAGER_CODE))),
        -- sum(to_number(to_char(co_m.MANAGER_CODE))),
        -- sum(to_number(to_char(co_emp.EMPLOYEE_CODE)))
        co_lm.LEAD_MANAGER_CODE,
        co_sm.SENIOR_MANAGER_CODE,
        co_m.MANAGER_CODE,
        co_emp.EMPLOYEE_CODE
    from
        COMPANY co,
        -- tables created using 'WITH' clause
        co_lm,
        co_sm,
        co_m,
        co_emp
    where
        co.COMPANY_CODE = co_lm.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_sm.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_m.COMPANY_CODE(+)
        and co.COMPANY_CODE = co_emp.EMPLOYEE_CODE(+)
    -- group by
    --     co.COMPANY_CODE,
    --     co.FOUNDER
    order by
        co.COMPANY_CODE;


-- display all the COMPANY_CODEs from COMPANY
select distinct co.COMPANY_CODE
from COMPANY co
order by co.COMPANY;

-- display all the COMPANY_CODEs from LEAD_MANAGER
select distinct lm.COMPANY_CODE
from LEAD_MANAGER lm
order by lm.COMPANY_CODE;

-- display all the COMPANY_CODEs from SENIOR_MANAGER
select distinct sm.COMPANY_CODE
from SENIOR_MANAGER sm
order by sm.COMPANY_CODE;

-- display all the COMPANY_CODEs from MANAGER
select distinct m.COMPANY_CODE
from MANAGER m
order by m.COMPANY_CODE;

-- display all the COMPANY_CODEs from EMPLOYEE
select distinct emp.COMPANY_CODE
from EMPLOYEE emp
order by emp.COMPANY_CODE;


-- EXPERIMENT : Final Code 5
select
    distinct co.COMPANY_CODE,
    co.FOUNDER,
    lm.LEAD_MANAGER_CODE,
    sm.SENIOR_MANAGER_CODE,
    m.MANAGER_CODE,
    emp.EMPLOYEE_CODE
from
    COMPANY co,
    LEAD_MANAGER lm,
    SENIOR_MANAGER sm,
    MANAGER m,
    EMPLOYEE emp
where
    co.COMPANY_CODE = emp.COMPANY_CODE
    and co.COMPANY_CODE = lm.COMPANY_CODE
    and co.COMPANY_CODE = sm.COMPANY_CODE
    and co.COMPANY_CODE = m.COMPANY_CODE
    and co.COMPANY_CODE = emp.COMPANY_CODE
order by
    co.COMPANY_CODE;



-- EXPERIMENT : Final Code 6
with CO_LM_COUNT as(
    -- count number of LEAD_MANAGERs
    select distinct co.COMPANY_CODE, co.FOUNDER, count(LEAD_MANAGER_CODE) as COUNT_LEAD_MANAGER
    from COMPANY co, LEAD_MANAGER lm
    where co.COMPANY_CODE = lm.COMPANY_CODE
    group by co.COMPANY_CODE, co.FOUNDER
    order by co.COMPANY_CODE
),
CO_SM_COUNT as(
    -- count number of SENIOR_MANAGERs
    select distinct co.COMPANY_CODE, co.FOUNDER, count(SENIOR_MANAGER_CODE) as COUNT_SENIOR_MANAGER
    from COMPANY co, SENIOR_MANAGER sm
    where co.COMPANY_CODE = sm.COMPANY_CODE
    group by co.COMPANY_CODE, co.FOUNDER
    order by co.COMPANY_CODE
),
CO_M_COUNT as(
    -- count number of MANAGERs
    select distinct co.COMPANY_CODE, co.FOUNDER, count(MANAGER_CODE) as COUNT_MANAGER
    from COMPANY co, MANAGER m
    where co.COMPANY_CODE = m.COMPANY_CODE
    group by co.COMPANY_CODE, co.FOUNDER
    order by co.COMPANY_CODE
),
CO_EMP_COUNT as(
    -- count number of EMPLOYEEs
    select distinct co.COMPANY_CODE, co.FOUNDER, count(EMPLOYEE_CODE) as COUNT_EMPLOYEE
    from COMPANY co, EMPLOYEE emp
    where co.COMPANY_CODE = emp.COMPANY_CODE
    group by co.COMPANY_CODE, co.FOUNDER
    order by co.COMPANY_CODE
) -- primary SELECT query
select
    co.COMPANY_CODE,
    co.FOUNDER,
    COUNT_LEAD_MANAGER,
    COUNT_SENIOR_MANAGER,
    COUNT_MANAGER,
    COUNT_EMPLOYEE
from
    COMPANY co,
    CO_LM_COUNT clm,
    CO_SM_COUNT csm,
    CO_M_COUNT cm,
    CO_EMP_COUNT ce
where
    co.COMPANY_CODE = ce.COMPANY_CODE
    and co.COMPANY_CODE = clm.COMPANY_CODE
    and co.COMPANY_CODE = csm.COMPANY_CODE
    and co.COMPANY_CODE = cm.COMPANY_CODE
order by
    co.COMPANY_CODE;

-- EXPERIMENT : Final Code 7
    -- company_code, 
    -- founder name, 
    -- total number of lead managers, 
    -- total number of senior managers, 
    -- total number of managers, 
    -- total number of employees

-- *** CHECKING OUT TABLE CONTENTS ***
select * from COMPANY order by COMPANY_CODE; 
select * from LEAD_MANAGER order by COMPANY_CODE;
select * from SENIOR_MANAGER order by COMPANY_CODE;
select * from MANAGER order by COMPANY_CODE;
select * from EMPLOYEE order by COMPANY_CODE;

-- *** COUNTING THE NUMBER OF ENTRIES FOR EACH COMPANY IN EACH TABLE (NOT GIVING CORRECT COUNT)***
select COMPANY_CODE, count(*) from COMPANY group by COMPANY_CODE order by COMPANY_CODE; 
select COMPANY_CODE, count(*) from LEAD_MANAGER group by COMPANY_CODE order by COMPANY_CODE;
select COMPANY_CODE, count(*) from SENIOR_MANAGER group by COMPANY_CODE order by COMPANY_CODE;
select COMPANY_CODE, count(*) from MANAGER group by COMPANY_CODE order by COMPANY_CODE;
select COMPANY_CODE, count(*) from EMPLOYEE group by COMPANY_CODE order by COMPANY_CODE;

-- *** ENLISTING ALL THE DISTINCT EMPLOYEE CODES FOR CORRESPOINDING COMPANIES
select distinct COMPANY_CODE, LEAD_MANAGER_CODE from LEAD_MANAGER order by COMPANY_CODE;
select distinct COMPANY_CODE, SENIOR_MANAGER_CODE from SENIOR_MANAGER order by COMPANY_CODE;
select distinct COMPANY_CODE, MANAGER_CODE from MANAGER order by COMPANY_CODE;
select distinct COMPANY_CODE, EMPLOYEE_CODE from EMPLOYEE order by COMPANY_CODE;

-- *** COUNTING THE NUMBER OF INDIVIDUAL FOR EACH COMPANY IN EACH TABLE (NOT GIVING CORRECT COUNT)***
    -- counting number of lead managers per company
    select
        COMPANY_CODE,
        count(*) as COUNT_LM
    from
        ( select distinct COMPANY_CODE, LEAD_MANAGER_CODE from LEAD_MANAGER order by COMPANY_CODE )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- counting number of senior managers per company
    select
        COMPANY_CODE,
        count(*) as COUNT_SM
    from
        ( select distinct COMPANY_CODE, SENIOR_MANAGER_CODE from SENIOR_MANAGER order by COMPANY_CODE )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- counting number of managers per company
    select
        COMPANY_CODE,
        count(*) as COUNT_M
    from
        ( select distinct COMPANY_CODE, MANAGER_CODE from MANAGER order by COMPANY_CODE )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;

    -- counting number of employees per company
    select
        COMPANY_CODE,
        count(*) as COUNT_EMP
    from
        ( select distinct COMPANY_CODE, EMPLOYEE_CODE from EMPLOYEE order by COMPANY_CODE )
    group by
        COMPANY_CODE
    order by
        COMPANY_CODE;


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