SELECT d.item_code,
       i.name,
       COUNT(*),
       SUM(d.price)
FROM t_member_purchase p
INNER JOIN t_member_purchase_detail d ON d.purchase_id = p.id
LEFT JOIN m_item i ON i.code = d.item_code
WHERE DATE_FORMAT(p.purchase_at, '%Y%m') = '${period}' AND i.name IS NOT NULL AND ((payment_type != 1 OR price_including_tax = 0) OR smaregi_id IS NOT NULL)
GROUP BY 1, 2

UNION ALL

SELECT d.item_code,
       d.item_name,
       COUNT(*),
       SUM(d.price)
FROM t_member_purchase p
INNER JOIN t_member_purchase_detail d ON d.purchase_id = p.id
LEFT JOIN m_item i ON i.code = d.item_code
WHERE DATE_FORMAT(p.purchase_at, '%Y%m') = '${period}' AND i.name IS NULL AND ((payment_type != 1 OR price_including_tax = 0) OR smaregi_id IS NOT NULL)
GROUP BY 1, 2

UNION ALL

SELECT '',
       '無断キャンセルペナルティ',
       COUNT(*),
       SUM(w.price_including_tax)
FROM t_without_purchase w
WHERE price_including_tax <> 0 AND DATE_FORMAT(w.purchase_at, '%Y%m') = '${period}' AND (payment_type != 1 OR price_including_tax = 0)
GROUP BY 1, 2
