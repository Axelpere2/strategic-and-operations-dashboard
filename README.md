# Strategic IT Operations Dashboard

## Executive Summary

This project analyzes 180 synthetic IT incident records for April 2026 to identify SLA breach patterns, operational risk areas, and improvement actions. The dashboard found a 29% SLA breach rate, with the highest risk concentrated in Application, Service Desk, and Network teams. Recommendations focus on escalation rules, Problem Management, vendor follow-up, and knowledge base improvement.

## Dashboard Preview

![SLA IT Strategic Dashboard](images/SLA%20IT%20Strategic%20Dashboard.png)

**Live Dashboard:** [View the Tableau Dashboard](https://public.tableau.com/app/profile/leonardo.p.rez3098/viz/SLAIncidentAnalysisApril/SLAStrategicDashboard?publish=yes)

## Project Overview

This project presents a strategic and operational Tableau dashboard designed to monitor incident performance, SLA compliance, support team performance, priority distribution, and recurring SLA breach reasons.

The dashboard simulates how an IT Operations or Incident Management team can use data visualization to support executive decision-making, operational reviews, and continuous improvement.

## Business Problem

IT Operations leadership needs clear visibility into incident performance. Without a dashboard, it is difficult to quickly identify SLA risks, underperforming support teams, recurring breach reasons, and high-priority tickets that require immediate attention.

This dashboard helps transform incident data into actionable insights for service delivery improvement.

## Dashboard Objective

The objective of this dashboard is to help IT Operations stakeholders answer five key questions:

- Are we meeting SLA targets?
- How many incidents breached SLA?
- Which priorities are creating the highest operational risk?
- Which support teams need closer follow-up?
- What are the most common reasons for SLA breaches?

## KPIs Tracked

- Total incidents
- SLA breaches
- SLA breach rate
- Average resolution time
- Incidents by priority
- SLA performance by support team
- Breach reasons
- Ticket-level operational details

## Tools Used

- Tableau
- Excel / CSV
- Google Slides
- ITIL 4 concepts
- Incident Management
- SLA analysis
- KPI reporting
- Executive communication
- SQL

## Key Metrics

| KPI | Description |
|---|---|
| Total Tickets | Number of incidents analyzed during the reporting period |
| SLA Breaches | Number of tickets that breached the agreed SLA |
| Breach Rate | Percentage of incidents that breached SLA |
| Average Resolution Time | Average time required to resolve incidents |
| Priority Distribution | Incident volume by priority level |
| Support Team Performance | SLA performance by assigned support team |
| Breach Reason Analysis | Main reasons contributing to SLA breaches |
| Ticket-Level Detail | Detailed operational view of individual incidents |

## Dashboard Sections

### 1. Executive Summary

High-level view of total incidents, SLA breaches, breach rate, and overall service performance.

### 2. SLA Performance Analysis

Visualization of SLA compliance and breached tickets.

### 3. Priority and Support Team Analysis

Breakdown of incidents by priority and support team to identify workload and risk concentration.

### 4. Breach Reason Analysis

Identification of recurring reasons contributing to SLA breaches.

### 5. Ticket Detail View

Operational table for reviewing individual incidents and supporting deeper analysis.

## 6. SQL Analysis

This project also includes SQL queries to validate SLA KPIs and identify operational risk areas.

The SQL analysis covers:

- Executive SLA KPI summary
- SLA breach rate by support team
- SLA breach rate by priority
- Top SLA breach reasons
- Escalation impact on SLA performance
- Highest-risk breached tickets
- Problem Management candidates

[View SQL SLA breach analysis](SQL/sla_breach_analysis.sql)

## Key Insights

Based on the sample incident data:

- SLA breaches are concentrated in specific support areas.
- High-priority incidents require stronger monitoring because their SLA targets are shorter.
- Recurring breach reasons suggest opportunities for Problem Management.
- Ticket-level visibility helps managers follow up on specific incidents.
- Executive dashboards can help leadership make faster and more data-driven decisions.

## Root Cause Analysis Summary

Based on the SLA breach analysis, the main operational issues appear to be related to change-related failures, vendor dependencies, and knowledge gaps within support teams.

### Problem Statement

During the analyzed period, 52 out of 180 incidents breached SLA, representing a 29% SLA breach rate. The highest SLA risk was concentrated in the Application, Service Desk, and Network teams.

### Main Root Causes Identified

| Root Cause | Evidence from Dashboard | Operational Impact |
|---|---|---|
| Change-related issues | High number of SLA breaches linked to change activities | Increased incident resolution time and higher risk of service disruption |
| Vendor dependencies | Breaches caused by delays from external providers | Limited internal control over resolution time |
| Knowledge gaps | Repeated issues requiring escalation or reassignment | Longer handling time and inconsistent resolution quality |

### 5 Whys Example

**Issue:** SLA breaches are high in specific support teams.

| Why? | Answer |
|---|---|
| Why did incidents breach SLA? | Tickets took longer than the SLA target to resolve. |
| Why did resolution take longer? | Some tickets required escalation, reassignment, or vendor support. |
| Why were escalations or reassignments needed? | First-level teams did not always have the knowledge or access to resolve the issue. |
| Why was knowledge or access missing? | Documentation, training, or ownership rules were not fully effective. |
| Why was this not detected earlier? | SLA risk monitoring was reactive instead of proactive. |

### Recommended Corrective Actions

| Action | Owner | Expected Benefit |
|---|---|---|
| Review change-related incident patterns | Change Manager / Problem Manager | Reduce incidents caused by failed or risky changes |
| Improve knowledge base articles for recurring incidents | Service Desk Lead | Reduce escalation and reassignment rates |
| Define vendor escalation rules | Service Delivery Manager | Reduce delays caused by external dependencies |
| Create weekly SLA risk review | Incident Manager / IT Operations Analyst | Detect SLA risks before breach occurs |

### RCA Conclusion

The SLA breach rate appears to be driven mainly by process, knowledge, and dependency issues rather than isolated ticket failures. A structured Problem Management review should be performed for recurring breach reasons, especially in the Application, Service Desk, and Network areas.

## Recommendations

1. Review support teams with the highest SLA breach contribution.
2. Improve escalation rules for P1 and P2 incidents.
3. Analyze recurring breach reasons through Problem Management.
4. Monitor SLA performance weekly to detect negative trends earlier.
5. Use the dashboard during operational review meetings with IT leadership.

## Repository Structure

```text
strategic-it-operations-dashboard/
│
├── README.md
├── dashboard-link.txt
│
├── data/
│   ├── data_dictionary.md
│   └── sla_incident_data_tableau_expanded_180_rows.csv
│
├── images/
│   └── SLA IT Strategic Dashboard.png
│
├── presentation/
│   └── Executive presentation files
│
└── SQL/
    ├── README.md
    └── sla_breach_analysis.sql
```

## Presentation

The executive presentation is included in the `presentation` folder.

## Portfolio Value

This project demonstrates practical skills relevant to roles such as:

- Incident Manager
- IT Operations Analyst
- Service Delivery Analyst
- ITSM Analyst
- Problem Manager
- Data Analyst
- Business Analyst
- Process Improvement Analyst

## Skills Demonstrated

- IT Operations reporting
- SLA performance analysis
- Incident Management analytics
- Dashboard design
- Executive communication
- KPI definition
- Breach reason analysis
- Data storytelling
- Tableau dashboard development
- Process improvement thinking

## Notes

This is a portfolio project created with sample or anonymized data. No confidential company information is included.
