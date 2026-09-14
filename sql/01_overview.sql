SELECT
    COUNT(*) AS total_subscriptions,
    SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_subscriptions,
    ROUND(
        100.0 * SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS cancellation_rate
FROM subscriptions;