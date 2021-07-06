SELECT
    DATE_FORMAT(payment_date, '%m'), SUM(price_including_tax), COUNT(*)
FROM t_member_purchase
WHERE
    DATE_FORMAT(payment_date, '%Y') = ${year}
        AND payment_type = 1 AND smaregi_id IS NOT NULL
GROUP BY 1;
