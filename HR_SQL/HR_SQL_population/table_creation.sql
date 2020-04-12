-- CITY
create table CITY (
    ID number,
    NAME varchar2(17),
    COUNTRYCODE varchar2(3),
    DISTRICT varchar2(20),
    POPULATION number
);

-- alter the length of NAME column in CITY table to 19
alter table
    CITY
modify
    NAME varchar2(19);

-- COUNTRY
create table COUNTRY(
    CODE VARCHAR2(3),
    NAME VARCHAR2(44),
    CONTINENT VARCHAR2(13),
    REGION VARCHAR2(25),
    SURFACEAREA NUMBER(38),
    INDEPYEAR VARCHAR2(4),
    POPULATION NUMBER(38),
    LIFEEXPECTANCY VARCHAR2(4),
    GNP NUMBER(38),
    GNPOLD VARCHAR2(9),
    LOCALNAME VARCHAR2(44),
    GOVERNMENTFORM VARCHAR2(44),
    HEADOFSTATE VARCHAR2(32),
    CAPITAL VARCHAR2(4),
    CODE2 VARCHAR2(2)
);