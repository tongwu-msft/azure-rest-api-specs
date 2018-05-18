---
ms.assetid: b33c823f-bb44-4a18-b932-808885665f32
ms.title: Azure Monitor REST API reference
ms.service: monitoring-and-diagnostics
author: steved0x
ms.author: sdanie
ms.manager: douge
service_description: To be added
---

# Azure Monitor REST API reference

Use the Azure Monitor REST API to get insights into your Azure resources using the following groups of operations.

For information on the `{filter-syntax}` parameter common to many Azure Monitor REST APIs, read [Azure Monitor REST API Filter Syntax](filter-syntax.md).


## REST operation groups 
Concepts required to understand usage of this API are available at in the [Azure Monitor documentation](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/).

Organized by subject area. 

| Operation groups                                                                | Description  |
|---------------------------------------------------------------------------------|-----------------------|
| [Operations](xref:management.azure.com.monitor.operations)    | Lists the available REST API operations for Azure Monitor.  |
| [Autoscale Settings](xref:management.azure.com.monitor.autoscalesettings)         | Provides operations for managing [autoscale](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-autoscale) settings.     |
| *Metrics* | | 
| [Metric Definitions](xref:management.azure.com.monitor.metricdefinitions)      | Lists the metric definitions available for the resource. That is, what [specific metrics](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-supported-metrics) can you collect. |
| [Metrics](xref:management.azure.com.monitor.metrics)          | Lists the metric values for a resource you identify.   |
| *Diagnostic Settings* | |
| [Diagnostic Settings](xref:management.azure.com.monitor.diagnosticsettings)       | Provides operations for creating, updating, and retrieving the [diagnostic settings](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-of-diagnostic-logs#resource-diagnostic-settings) for a resource. Control the routing of metric data and diagnostics logs. |
| [Diagnostic Settings Category](xref:management.azure.com.monitor.diagnosticsettingscategory) | Relates to the [possible categories](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-diagnostic-logs-schema#supported-log-categories-per-resource-type) for a given resource|
| *Activity Log* | |
| [Activity Log(s)](xref:management.azure.com.monitor.activitylogs)                    | Get a list of event entries in the [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs).|
| [Activity Log Tenant Events](xref:management.azure.com.monitor.tenantactivitylogs)  | Gets the [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs) event entries for a specific tenant.|
| [(Activity Log) Event Categories](xref:management.azure.com.monitor.eventcategories)             | Lists the types of Activity Log Entries. |
| [Activity Log Profiles](xref:management.azure.com.monitor.logprofiles)       | Provides operations to manage [activity log profiles](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs#export-the-activity-log-with-a-log-profile) so you can route activity log events to other locations.  |
| *Alerts and Action Groups* | |
| [Metric Alerts](xref:management.azure.com.monitor.metricalerts)                | Provides operations to manage [newer metric alerts](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-unified-alerts). | 
| [Metric Alerts Status](xref:management.azure.com.monitor.metricalertsstatus)   | Lists status of a [newer metric alerts](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-overview-unified-alerts). |
| [Metric Alert Baseline](xref:management.azure.com.monitor.metricbaseline)            | Obtains the baselines for a metric for use in [dynamic alerts](https://docs.microsoft.com/en-us/azure/monitoring-and-diagnostics/monitoring-alerts-dynamic-thresholds). | 
| [Log Alert Scheduled Query Rules](xref:management.azure.com.monitor.scheduledqueryrules)    | Provides operations for managing analytic query-based log alerts.   |
| [Activity Log Alerts](xref:management.azure.com.monitor.activitylogalerts)        | Configure and list alerts based on [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs) events.|
| [Action Groups](xref:management.azure.com.monitor.actiongroups)      | Operations you can take on [Action Groups](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-action-groups). Newer alerts call Action Groups to send notifications or trigger other actions. |
| [Alerts (classic) Rule Incidents](xref:management.azure.com.monitor.alertruleincidents)      | Older alert type functions. Gets an incident associated to a [classic metric alert rule](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-alerts). When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs). | 
| [Alert (classic) Rules](xref:management.azure.com.monitor.alertrules)             | Provides operations for managing [alert (classic)](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-alerts) rules. |

