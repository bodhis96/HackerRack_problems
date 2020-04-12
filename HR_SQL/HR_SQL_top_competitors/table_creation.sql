-- HACKERS
create table HACKERS(
    HACKER_ID number,
    NAME varchar2(50)
);

-- DIFFICULTY
create table DIFFICULTY(
    DIFFICULTY_LEVEL number,
    SCORE number
);

-- CHALLENGES
create table CHALLENGES(
    CHALLENGE_ID number,
    HACKER_ID number,
    DIFFICULTY_LEVEL number
);

-- SUBMISSIONS
create table SUBMISSIONS(
    SUBMISSION_ID number,
    HACKER_ID number,
    CHALLENGE_ID number,
    SCORE number
);