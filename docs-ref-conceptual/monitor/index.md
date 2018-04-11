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

| Operation groups                                                                | Description  |
|---------------------------------------------------------------------------------|-----------------------|
| [Action Groups](xref:management.azure.com.monitor.actiongroups)                            | Operations you can you can take on Action Groups. Alerts can call Action Groups to send email or SMS notifications and call webhooks. |
| [Activity Log](xref:management.azure.com.monitor.activitylogs)                      | Get a list of Activity Log events.|
| [Activity Log Alerts](xref:management.azure.com.monitor.activitylogalerts)                 | Configure and list alerts based on Activity Log events.|
| [Activity Log Tenant Events](xref:management.azure.com.monitor.tenantactivitylogs)         | Gets the Activity Logs for a specific tenant.|
| [Activity Log Event Categories](xref:management.azure.com.monitor.eventcategories)         | Lists the types of Activity Log Entries. |
| [Alert Rules](xref:management.azure.com.monitor.alertrules)                                | Provides operations for managing alert rules. |
| [Alert Rule Incidents](xref:management.azure.com.monitor.alertruleincidents)               | Gets an incident associated to an alert rule. When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the Activity Log. |
| [Autoscale Settings](xref:management.azure.com.monitor.autoscalesettings)                  | Provides operations for managing autoscale settings.     |
| [Log Profiles](xref:management.azure.com.monitor.logprofiles)                              | Provides operations for managing log profiles.  |
| [Metric Definitions](xref:management.azure.com.monitor.metricdefinitions)                  | Lists the metric definitions available for the resource. That is, what specific metrics are available |
| [Metrics](xref:management.azure.com.monitor.metrics)                                       | Lists the metric values for a resource.   |
| [Diagnostic Settings](xref:management.azure.com.monitor.servicediagnosticsettings) | Provides operations for creating, updating, and retrieving the diagnostic settings for a resource.|


## See also

- [Azure Monitor documentation](https://docs.microsoft.com/azure/monitoring-and-diagnostics/)