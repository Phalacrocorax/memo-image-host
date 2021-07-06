SELECT
  dates.month,
  (
  SELECT
      COUNT(DISTINCT member_id)
  FROM
      t_member_course
  WHERE
      DATE_FORMAT(start_date, '%Y%m') <= dates.period AND (DATE_FORMAT(end_date, '%Y%m') >= dates.period OR end_date IS NULL) AND course_id = 1 AND studio_id = ${studio_id}
  ) daytime_count,

  (
  SELECT
      COUNT(DISTINCT member_id)
  FROM
      t_member_course
  WHERE
      DATE_FORMAT(start_date, '%Y%m') <= dates.period AND (DATE_FORMAT(end_date, '%Y%m') >= dates.period OR end_date IS NULL) AND course_id = 2 AND studio_id = ${studio_id}
  ) fulltime_count,

  (
  SELECT
      COUNT(DISTINCT member_id)
  FROM
      t_member_course
  WHERE
      DATE_FORMAT(start_date, '%Y%m') <= dates.period AND (DATE_FORMAT(end_date, '%Y%m') >= dates.period OR end_date IS NULL) AND course_id = 6 AND studio_id = ${studio_id}
  ) limited_day_count

FROM
  (SELECT concat('${year}', lpad(tmp.generate_series, 2, '0')) period, lpad(tmp.generate_series, 2, '0') month
   FROM
     (SELECT 0 generate_series
      FROM DUAL
      WHERE (@num:=1-1)*0
      UNION ALL SELECT @num:=@num+1
      FROM `information_schema`.COLUMNS LIMIT 12) AS tmp) AS dates
