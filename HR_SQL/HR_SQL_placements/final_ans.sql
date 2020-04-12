select
    NAME_STUDENT
from
    (
        select
            st.ID as ID_STUDENT,
            st.NAME as NAME_STUDENT,
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
    )
where
    SALARY_FRIEND > SALARY_STUDENT
order by
    SALARY_FRIEND