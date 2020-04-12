-- HACKERS
create table HACKERS(
    HACKER_ID number,
    NAME varchar2(50)
);

-- SUBMISSIONS
create table SUBMISSIONS(
    SUBMISSION_ID number,
    HACKER_ID number,
    CHALLENGE_ID number,
    SCORE number
);