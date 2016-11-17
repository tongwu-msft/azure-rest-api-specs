---
ms.assetid: b33c823f-bb44-4a18-b932-808885665f32
ms.title: Azure Monitor REST API reference
ms.service: monitoring-and-diagnostics
author: steved0x
ms.author: sdanie
ms.manager: douge
---

# Azure Monitor REST API reference

Use the Azure Monitor REST API to get insights into your Azure resources using the following groups of operations.

For information on the `{filter-syntax}` parameter common to many Azure Monitor REST APIs, read [Azure Monitor REST API Filter Syntax](filter-syntax.md).


## REST operation groups

| Operation groups                                                                | Description  |
|---------------------------------------------------------------------------------|-----------------------|
| [Alert Rules](~/api-ref/monitor/alertrules.json)                                | Provides operations for managing alert rules. |
| [Alert Rule Incidents](~/api-ref/monitor/alertruleincidents.json)               | Gets an incident associated to an alert rule. When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the Activity Log. |
| [Incidents](~/api-ref/monitor/incidents.json)                                   | Gets a list of incidents associated to an alert rule. |
| [Autoscale Settings](~/api-ref/monitor/autoscalesettings.json)                  | Provides operations for managing autoscale settings.     |
| [Activity Log Event Categories](~/api-ref/monitor/eventcategories.json)         | Lists the types of Activity Log Entries. |
| [Activity Log Events](~/api-ref/monitor/events.json)                            | Lists Activity Log events.|
| [Activity Log Tenant Events](~/api-ref/monitor/tenantevents.json)               | Provides the list of tenant events.|
| [Log Profiles](~/api-ref/monitor/logprofiles.json)                              | Provides operations for managing log profiles.  |
| [Metric Definitions](~/api-ref/monitor/metricdefinitions.json)                  | Lists the metric definitions available for the resource. That is, what specific metrics are available |
| [Metrics](~/api-ref/monitor/metrics.json)                                       | Lists the metric values for a resource.   |
| [Diagnostic Settings](~/api-ref/monitor/servicediagnosticsettings.json) | Provides operations for creating, updating, and retrieving the diagnostic settings for a resource.|


## See also

- [Azure Monitor documentation](https://review.docs.microsoft.com/azure/monitoring-and-diagnostics/)