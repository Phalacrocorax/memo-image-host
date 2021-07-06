SELECT
    mc.course_id, COUNT(DISTINCT mc.member_id)
FROM
    t_member_course mc
INNER JOIN
    t_member m ON m.id = mc.member_id
WHERE
    DATE_FORMAT(mc.start_date, '%Y%m') <= ${period} AND (DATE_FORMAT(mc.end_date, '%Y%m') >= ${period} OR mc.end_date IS NULL) AND mc.course_id IN (1 , 2 , 6) AND mc.studio_id = ${studio_id}
        AND NOT EXISTS( SELECT * FROM t_reservation WHERE member_id = m.id AND studio_id = ${studio_id} AND status = 3 AND DATE_FORMAT(date, '%Y%m') = ${period})
GROUP BY
    1
ORDER BY
    1
