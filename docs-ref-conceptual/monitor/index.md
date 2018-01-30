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
| [Action Groups](~/docs-ref-autogen/monitor/actiongroups.yml)                            | Operations you can you can take on Action Groups. Alerts can call Action Groups to send email or SMS notifications and call webhooks. |
| [Activity Log](~/docs-ref-autogen/monitor/activitylogs.yml)                      | Get a list of Activity Log events.|
| [Activity Log Alerts](~/docs-ref-autogen/monitor/activitylogalerts.yml)                 | Configure and list alerts based on Activity Log events.|
| [Activity Log Tenant Events](~/docs-ref-autogen/monitor/tenantactivitylogs.yml)         | Gets the Activity Logs for a specific tenant.|
| [Activity Log Event Categories](~/docs-ref-autogen/monitor/eventcategories.yml)         | Lists the types of Activity Log Entries. |
| [Alert Rules](~/docs-ref-autogen/monitor/alertrules.yml)                                | Provides operations for managing alert rules. |
| [Alert Rule Incidents](~/docs-ref-autogen/monitor/alertruleincidents.yml)               | Gets an incident associated to an alert rule. When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the Activity Log. |
| [Autoscale Settings](~/docs-ref-autogen/monitor/autoscalesettings.yml)                  | Provides operations for managing autoscale settings.     |
| [Log Profiles](~/docs-ref-autogen/monitor/logprofiles.yml)                              | Provides operations for managing log profiles.  |
| [Metric Definitions](~/docs-ref-autogen/monitor/metricdefinitions.yml)                  | Lists the metric definitions available for the resource. That is, what specific metrics are available |
| [Metrics](~/docs-ref-autogen/monitor/metrics.yml)                                       | Lists the metric values for a resource.   |
| [Diagnostic Settings](~/docs-ref-autogen/monitor/servicediagnosticsettings.yml) | Provides operations for creating, updating, and retrieving the diagnostic settings for a resource.|


## See also

- [Azure Monitor documentation](https://docs.microsoft.com/azure/monitoring-and-diagnostics/)