-- File: SQL/sla_breach_analysis.sql
-- Project: Strategic IT Operations Dashboard
-- Purpose: Analyze SLA breaches, support team performance, priority risk,
-- breach reasons, and operational improvement opportunities.
--
-- Assumption:
-- The CSV file was imported into a table called incident_tickets.
-- Column names were cleaned to snake_case for SQL readability.

------------------------------------------------------------
-- 1. Executive SLA KPI Summary
------------------------------------------------------------

SELECT
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) AS sla_breaches,
    SUM(CASE WHEN breached_sla = 'No' THEN 1 ELSE 0 END) AS sla_met_tickets,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_breach_rate_pct,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_compliance_rate_pct,
    ROUND(AVG(actual_resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(sla_variance_hours), 2) AS avg_sla_variance_hours
FROM incident_tickets;


------------------------------------------------------------
-- 2. SLA Performance by Support Team
------------------------------------------------------------

SELECT
    support_team,
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) AS sla_breaches,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_breach_rate_pct,
    ROUND(AVG(actual_resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(sla_variance_hours), 2) AS avg_sla_variance_hours
FROM incident_tickets
GROUP BY support_team
ORDER BY sla_breach_rate_pct DESC, sla_breaches DESC;


------------------------------------------------------------
-- 3. SLA Breaches by Priority
------------------------------------------------------------

SELECT
    priority,
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) AS sla_breaches,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_breach_rate_pct,
    ROUND(AVG(actual_resolution_hours), 2) AS avg_resolution_hours
FROM incident_tickets
GROUP BY priority
ORDER BY priority;


------------------------------------------------------------
-- 4. Top SLA Breach Reasons
------------------------------------------------------------

SELECT
    breach_reason,
    COUNT(*) AS breach_count,
    ROUND(AVG(sla_variance_hours), 2) AS avg_sla_variance_hours
FROM incident_tickets
WHERE breached_sla = 'Yes'
GROUP BY breach_reason
ORDER BY breach_count DESC, avg_sla_variance_hours DESC;


------------------------------------------------------------
-- 5. SLA Breaches by Incident Category and Business Service
------------------------------------------------------------

SELECT
    incident_category,
    business_service,
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) AS sla_breaches,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_breach_rate_pct
FROM incident_tickets
GROUP BY incident_category, business_service
ORDER BY sla_breaches DESC, sla_breach_rate_pct DESC;


------------------------------------------------------------
-- 6. Escalation Impact on SLA Performance
------------------------------------------------------------

SELECT
    escalated,
    COUNT(*) AS total_incidents,
    SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) AS sla_breaches,
    ROUND(
        100.0 * SUM(CASE WHEN breached_sla = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_breach_rate_pct,
    ROUND(AVG(reassignment_count), 2) AS avg_reassignment_count,
    ROUND(AVG(sla_variance_hours), 2) AS avg_sla_variance_hours
FROM incident_tickets
GROUP BY escalated
ORDER BY sla_breach_rate_pct DESC;


------------------------------------------------------------
-- 7. Highest SLA Breach Risk Tickets
------------------------------------------------------------

SELECT
    ticket_id,
    priority,
    support_team,
    business_service,
    location,
    actual_resolution_hours,
    sla_target_hours,
    sla_variance_hours,
    breach_reason,
    escalated,
    major_incident
FROM incident_tickets
WHERE breached_sla = 'Yes'
ORDER BY sla_variance_hours DESC
LIMIT 10;


------------------------------------------------------------
-- 8. Problem Management Candidates
------------------------------------------------------------

SELECT
    incident_category,
    business_service,
    breach_reason,
    COUNT(*) AS repeated_breaches,
    ROUND(AVG(sla_variance_hours), 2) AS avg_sla_variance_hours
FROM incident_tickets
WHERE breached_sla = 'Yes'
GROUP BY incident_category, business_service, breach_reason
HAVING COUNT(*) >= 2
ORDER BY repeated_breaches DESC, avg_sla_variance_hours DESC;
