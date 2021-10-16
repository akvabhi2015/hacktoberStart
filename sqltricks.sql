— find value not in array

https://stackoverflow.com/questions/11730777/postgres-not-in-array/43380487

-- find icrs
select * from users where not ('applications.return_feedback' = ANY(scope))
and role =  'loanofficer'
        AND id IN (
            SELECT DISTINCT u.id
            FROM users u
            JOIN user_groups ug on u.id = ug.user_id
            JOIN groups g on ug.group_id = g.id
            WHERE g.name = 'ICR'
      )
      

— SEARCH IN text array

select * from users where ‘applications.return_feedback' = ANY(scope)


— update multiple rows

UPDATE reporting_applications SET pending_review_date = transitions.updated_at, pending_review_by = transitions.updated_by
    FROM (
           SELECT application_id, min(updated_at) as updated_at, updated_by
           FROM state_transitions
           WHERE application_id in (select id from applications where "requestId" in (2242757,2227585)) AND to_state = 'pending_review'
           group by 1,3
         ) transitions
    WHERE transitions.application_id = reporting_applications.id;
