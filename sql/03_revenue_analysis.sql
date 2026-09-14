-- MRR by Plan
SELECT
p.plan_name,
COUNT(*) AS subscriptions,
ROUND(SUM(s.mrr), 2) AS total_mrr,
ROUND(AVG(s.mrr), 2) AS avg_mrr
FROM subscriptions s
JOIN plans p
ON s.plan_id = p.plan_id
WHERE s.status = 'active'
GROUP BY p.plan_name
ORDER BY total_mrr DESC;
