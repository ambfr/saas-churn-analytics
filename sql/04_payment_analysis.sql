-- Payment Success vs Failure
SELECT
payment_status,
COUNT(*) AS payment_attempts,
ROUND(
100.0 * COUNT(*) / (SELECT COUNT(*) FROM payments),
2
) AS percentage
FROM payments
GROUP BY payment_status
ORDER BY payment_attempts DESC;
