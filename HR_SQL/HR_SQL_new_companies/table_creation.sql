-- *** TABLE CREATION ***
-- COMPANY
create table COMPANY(
    COMPANY_CODE varchar2(100),
    FOUNDER varchar2(100)
);

-- LEAD_MANAGER
create table LEAD_MANAGER(
    LEAD_MANAGER_CODE varchar2(100),
    COMPANY_CODE varchar2(100)
);

-- SENIOR_MANAGER
create table SENIOR_MANAGER(
    SENIOR_MANAGER_CODE varchar2(100),
    LEAD_MANAGER_CODE varchar2(100),
    COMPANY_CODE varchar2(100)
);

-- MANAGER
create table MANAGER(
    MANAGER_CODE varchar2(100),
    SENIOR_MANAGER_CODE varchar2(100),
    LEAD_MANAGER_CODE varchar2(100),
    COMPANY_CODE varchar2(100)
);

-- EMPLOYEE
create table EMPLOYEE(
    EMPLOYEE_CODE varchar2(100),
    MANAGER_CODE varchar2(100),
    SENIOR_MANAGER_CODE varchar2(100),
    LEAD_MANAGER_CODE varchar2(100),
    COMPANY_CODE varchar2(100)
);