# Data Dictionary

This file explains the fields used in the incident dataset for the **Strategic IT Operations Dashboard**.

The dataset contains synthetic but realistic IT incident records for April 2026. It is designed to analyze SLA performance, breach drivers, support team workload, escalation patterns, and operational improvement opportunities.

---

## Dataset Fields

| Field | Description |
|---|---|
| index | Row number generated in the dataset. This is not used as a business metric. |
| Ticket ID | Unique identifier for each incident ticket. |
| Priority | Incident priority level: P1, P2, P3, or P4. |
| Support Team | Team assigned to resolve the incident, such as Application, Service Desk, Network, Infrastructure, Workplace, or Security. |
| Opened Date | Date when the incident was opened. |
| Resolved Date | Date when the incident was resolved. |
| SLA Target Hours | Maximum allowed resolution time according to the SLA. |
| Actual Resolution Hours | Actual number of hours required to resolve the incident. |
| Breached SLA | Indicates whether the ticket breached the SLA: Yes or No. |
| Breach Reason | Main reason associated with the SLA breach. Blank when the ticket did not breach SLA. |
| Incident Category | Type of incident, such as Application Error, VPN Failure, Password Reset, Backup Failure, or Device Issue. |
| Business Service | Business or IT service affected by the incident, such as ERP Platform, VPN, CRM Portal, Access Requests, or Microsoft 365. |
| Location | Location affected by the incident, such as Mexico City, Puebla, Guadalajara, Monterrey, Toronto, or Remote. |
| Channel | Channel used to report or detect the incident, such as Monitoring, Email, Chat, Phone, or Self-Service Portal. |
| Customer Segment | User or business segment affected by the incident, such as Finance, Sales, Internal Operations, Retail Branches, Executive Users, or External Customers. |
| Impact | Business impact level of the incident: High, Medium, or Low. |
| Urgency | Urgency level of the incident: High, Medium, or Low. |
| Opened Timestamp | Exact date and time when the incident was opened. Useful for time-based analysis. |
| Resolved Timestamp | Exact date and time when the incident was resolved. Useful for duration calculations. |
| SLA Variance Hours | Difference between actual resolution hours and SLA target hours. Positive values mean the SLA was exceeded; negative values mean the ticket was resolved within SLA. |
| Reassignment Count | Number of times the ticket was reassigned before resolution. |
| Escalated | Indicates whether the incident was escalated: Yes or No. |
| Major Incident | Indicates whether the ticket was treated as a major incident: Yes or No. |
| Resolution Code | Final resolution classification, such as Service restored, Vendor fix implemented, Rollback completed, or Knowledge article created. |
| Month | Reporting month of the incident. |
| Week of Month | Week number within the reporting month. |
| Day of Week | Day of the week when the incident was opened. |

---

## Suggested Tableau Calculated Fields

| Calculated Field | Tableau Formula / Logic |
|---|---|
| Total Tickets | `COUNTD([Ticket ID])` |
| SLA Breaches | `SUM(IF [Breached SLA] = "Yes" THEN 1 ELSE 0 END)` |
| SLA Met Tickets | `SUM(IF [Breached SLA] = "No" THEN 1 ELSE 0 END)` |
| Breach Rate | `[SLA Breaches] / [Total Tickets]` |
| SLA Compliance Rate | `[SLA Met Tickets] / [Total Tickets]` |
| Average Resolution Time | `AVG([Actual Resolution Hours])` |
| Average SLA Variance | `AVG([SLA Variance Hours])` |
| Resolution Variance | `[Actual Resolution Hours] - [SLA Target Hours]` |
| SLA Status | `IF [Breached SLA] = "Yes" THEN "Breached" ELSE "Met" END` |
| Escalated Tickets | `SUM(IF [Escalated] = "Yes" THEN 1 ELSE 0 END)` |
| Escalation Rate | `[Escalated Tickets] / [Total Tickets]` |
| Major Incidents | `SUM(IF [Major Incident] = "Yes" THEN 1 ELSE 0 END)` |
| Reassigned Tickets | `SUM(IF [Reassignment Count] > 0 THEN 1 ELSE 0 END)` |
| Average Reassignments | `AVG([Reassignment Count])` |
| Breach Reason Clean | `IF ISNULL([Breach Reason]) OR [Breach Reason] = "" THEN "No Breach" ELSE [Breach Reason] END` |
| High Priority Tickets | `SUM(IF [Priority] = "P1" OR [Priority] = "P2" THEN 1 ELSE 0 END)` |
| High Priority Breaches | `SUM(IF ([Priority] = "P1" OR [Priority] = "P2") AND [Breached SLA] = "Yes" THEN 1 ELSE 0 END)` |

---

## Field Interpretation Notes

- `SLA Variance Hours` is one of the most important fields for SLA analysis.
  - Positive value = ticket exceeded SLA.
  - Negative value = ticket was resolved before the SLA limit.
  - Zero = ticket was resolved exactly at the SLA target.

- `Breached SLA` should be used for breach counting and SLA compliance KPIs.

- `Breach Reason` should mainly be analyzed only for tickets where `Breached SLA = Yes`.

- `Opened Timestamp` and `Resolved Timestamp` are better than date-only fields when analyzing exact resolution time.

- `Reassignment Count`, `Escalated`, and `Resolution Code` are useful for identifying process issues, handoff problems, and operational bottlenecks.

---

## Recommended Dashboard Uses

| Analysis Area | Recommended Fields |
|---|---|
| Executive KPI Overview | Total Tickets, SLA Breaches, Breach Rate, SLA Compliance Rate |
| Priority Analysis | Priority, Breached SLA, SLA Variance Hours |
| Support Team Performance | Support Team, SLA Breaches, Breach Rate, Average Resolution Time |
| Root Cause Analysis | Breach Reason, Incident Category, Resolution Code |
| Location Analysis | Location, SLA Breaches, Business Service |
| Escalation Analysis | Escalated, Reassignment Count, Major Incident |
| Time Analysis | Opened Date, Month, Week of Month, Day of Week |
| Operational Detail View | Ticket ID, Priority, Support Team, Business Service, SLA Status, Resolution Code |
