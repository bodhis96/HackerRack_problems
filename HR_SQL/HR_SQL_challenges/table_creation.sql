-- HACKERS
create table HACKERS(
    HACKER_ID number,
    NAME varchar2(50)
);

-- CHALLENGES
create table challenges(
    challenge_id number,
    hacker_id number
);