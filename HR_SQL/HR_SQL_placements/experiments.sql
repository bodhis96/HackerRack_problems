-- displaying the STUDENT_IDs and student NAMEs 
-- and corresponding FRIEND_ID's
select
    st.ID,
    st.NAME,
    fr.FRIEND_ID
from
    STUDENTS st,
    FRIENDS fr
where
    st.ID = fr.ID


-- displaying the STUDENT_IDs and student NAMEs 
-- and corresponding FRIEND_ID's and SALARY of the friend
select
    st.ID,
    st.NAME,
    fr.FRIEND_ID,
    pa.SALARY
from
    STUDENTS st,
    FRIENDS fr,
    PACKAGES pa
where
    1 = 1
    and st.ID = fr.ID
    and fr.FRIEND_ID = pa.ID
order by
    st.ID


-- displaying the STUDENT_IDs, student NAMEs, student's SALARY
-- and corresponding FRIEND_ID's and SALARY of the friend
-- 
select
    st.ID,
    st.NAME,
    fr.FRIEND_ID,
    pa_st.SALARY as SALARY_STUDENT,
    pa_fr.SALARY as SALARY_FRIEND
from
    STUDENTS st,
    FRIENDS fr,
    PACKAGES pa_st,
    PACKAGES pa_fr
where
    1 = 1
    and st.ID = fr.ID
    and fr.ID = pa_st.ID
    and fr.FRIEND_ID = pa_fr.ID
order by
    st.ID