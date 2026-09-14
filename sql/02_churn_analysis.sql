-- Churn by Plan
SELECT
p.plan_name,
COUNT(*) AS total_subscriptions,
SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled,
ROUND(
100.0 * SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS cancellation_rate
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY cancellation_rate DESC;

-- Churn by Customer Segment
SELECT
a.segment,
COUNT(*) AS total_subscriptions,
SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled,
ROUND(
100.0 * SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS cancellation_rate
FROM subscriptions s
JOIN accounts a
ON s.account_id = a.account_id
GROUP BY a.segment
ORDER BY cancellation_rate DESC;

-- Churn by Acquisition Channel
SELECT
a.acquisition_channel,
COUNT(*) AS total_subscriptions,
SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled,
ROUND(
100.0 * SUM(CASE WHEN s.status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*),
2
) AS cancellation_rate
FROM subscriptions s
JOIN accounts a
ON s.account_id = a.account_id
GROUP BY a.acquisition_channel
ORDER BY cancellation_rate DESC;
