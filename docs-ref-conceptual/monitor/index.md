---
ms.assetid: b33c823f-bb44-4a18-b932-808885665f32
title: Azure Monitor REST API reference
description: API reference documentation for the operations available in the Azure Monitor REST API, a RESTful web service for managing Azure Monitor resources in Azure.
ms.service: azure-monitor
author: steved0x
ms.author: sdanie
ms.manager: douge
service_description: Allows you to monitor your services running in Azure via metrics, logs, and activity log entries. Includes managing autoscale and alerts. 
---

# Azure Monitor REST API reference

Use the Azure Monitor REST API to get insights into your Azure resources using the following groups of operations.

For information on the `{filter-syntax}` parameter common to many Azure Monitor REST APIs, read [Azure Monitor REST API Filter Syntax](filter-syntax.md).


## REST operation groups 
Concepts required to understand usage of this API are available at in the [Azure Monitor documentation](https://docs.microsoft.com/azure/monitoring-and-diagnostics/).

Organized by subject area. 

| Operation groups                                                                | Description  |
|---------------------------------------------------------------------------------|-----------------------|
| [Operations](/rest/api/monitor/alertsmanagement/operations)    | Lists the available REST API operations for Azure Monitor.  |
| [Autoscale settings](xref:management.azure.com.monitor.autoscalesettings)         | Operations to manage [autoscale](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-autoscale) settings.     |
| ***Metrics*** | | 
| [Metric definitions](xref:management.azure.com.monitor.metricdefinitions)      | Lists the metric definitions available for the resource. That is, what [specific metrics](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-supported-metrics) can you collect. |
| [Metrics](xref:management.azure.com.monitor.metrics)          | Lists the metric values for a resource you identify.   |
| [Metric namespaces](xref:management.azure.com.monitor.metricnamespaces)          | Lists the metric namespaces. Most relevant when using [custom metrics](https://docs.microsoft.com/azure/monitoring-and-diagnostics/metrics-custom-overview).    |
| [ Custom metrics input](xref:monitoring.azure.com.monitor.metrics(dataplane))          | Referred to as *metrics (data plane)* in the REST API table of contents. Allows you to load custom metrics in Azure Monitor as shown in [this article](https://docs.microsoft.com/azure/monitoring-and-diagnostics/metrics-store-custom-rest-api).    |
| ***Diagnostic Settings*** | |
| [Diagnostic settings](xref:management.azure.com.monitor.diagnosticsettings)       | Operations to create, update, and retrieve the [diagnostic settings](/azure/azure-monitor/platform/diagnostic-logs-overview) for a resource. Controls the routing of metric data and diagnostics logs. |
| [Diagnostic settings category](xref:management.azure.com.monitor.diagnosticsettingscategory) | Relates to the [possible categories](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-diagnostic-logs-schema#supported-log-categories-per-resource-type) for a given resource|
| ***Activity Log*** | |
| [Activity log(s)](xref:management.azure.com.monitor.activitylogs)                    | Get a list of event entries in the [activity log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs).|
| [Activity log tenant events](xref:management.azure.com.monitor.tenantactivitylogs)  | Gets the [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs) event entries for a specific tenant.|
| [(Activity log) event categories](xref:management.azure.com.monitor.eventcategories)             | Lists the types of Activity Log Entries. |
| [Activity log profiles](xref:management.azure.com.monitor.logprofiles)       | Operations to manage [activity log profiles](/azure/azure-monitor/platform/platform-logs-overview) so you can route activity log events to other locations.  |
| ***Alerts Management and Action Groups*** | |
| [Action groups](xref:management.azure.com.monitor.actiongroups)      | Operations you can take on [Action Groups](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-action-groups). All newer alerts call Action Groups to send notifications or trigger other actions. |
| [Alert management](/rest/api/monitor/alertsmanagement/alerts)             | Provides operations for managing [alert](https://docs.microsoft.com/azure/monitoring-and-diagnostics/alert-metric-overview?toc=/azure/azure-monitor/toc.json) rules. |
| [Metric alerts](xref:management.azure.com.monitor.metricalerts)                | Operations to manage [newer metric alerts](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-unified-alerts). | 
| [Metric alerts status](xref:management.azure.com.monitor.metricalertsstatus)   | Lists status of a [newer metric alerts](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-unified-alerts). |
| [Metric alert baseline](/rest/api/monitor/baselines)            | Obtains the baselines for a metric for use in [dynamic alerts](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-alerts-dynamic-thresholds). | 
| [Log alert scheduled query rules](xref:management.azure.com.monitor.scheduledqueryrules)    | Provides operations for managing analytic query-based log alerts.   |
| [Activity log alerts](xref:management.azure.com.monitor.activitylogalerts)        | Configure and list alerts based on [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs) events.|
| ***Retired or being retired*** | |
| [Alerts (classic) rule incidents](xref:management.azure.com.monitor.alertruleincidents)      | [Being retired in 2019](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-classic-retirement) in the public cloud. Older classic alerts functions. Gets an incident associated to a [classic metric alert rule](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-alerts-classic?toc=/azure/azure-monitor/toc.json). When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the [Activity Log](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-activity-logs). | 
| [Alert (classic) rules](xref:management.azure.com.monitor.alertrules)             | [Being retired in 2019](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-classic-retirement) in the public cloud. Provides operations for managing [classic alert](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-alerts-classic?toc=/azure/azure-monitor/toc.json) rules. |

