-- CONTESTS
create table CONTESTS (
    contest_id number,
    hacker_id number,
    name varchar2(100)
);

-- COLLEGES
create table COLLEGES (
    college_id number,
    contest_id number
);

-- CHALLENGES
create table CHALLENGES (
    challenge_id number,
    college_id number
);

-- VIEW_STATS
create table VIEW_STATS (
    challenge_id number,
    total_views number,
    total_unique_views number
);

-- SUBMISSION_STATS
create table SUBMISSION_STATS (
    challenge_id number,
    total_submissions number,
    total_accepted_submissions number
);