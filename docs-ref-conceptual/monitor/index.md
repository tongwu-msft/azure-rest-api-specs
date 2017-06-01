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
| [Alert Rules](~/docs-ref-autogen/monitor/alertrules.json)                                | Provides operations for managing alert rules. |
| [Alert Rule Incidents](~/docs-ref-autogen/monitor/alertruleincidents.json)               | Gets an incident associated to an alert rule. When an alert rule fires because the threshold is crossed in the up or down direction, an incident is created and an entry added to the Activity Log. |
| [Incidents](~/docs-ref-autogen/monitor/incidents.json)                                   | Gets a list of incidents associated to an alert rule. |
| [Autoscale Settings](~/docs-ref-autogen/monitor/autoscalesettings.json)                  | Provides operations for managing autoscale settings.     |
| [Activity Log Event Categories](~/docs-ref-autogen/monitor/eventcategories.json)         | Lists the types of Activity Log Entries. |
| [Activity Log Events](~/docs-ref-autogen/monitor/events.json)                            | Lists Activity Log events.|
| [Activity Log Tenant Events](~/docs-ref-autogen/monitor/tenantevents.json)               | Provides the list of tenant events.|
| [Log Profiles](~/docs-ref-autogen/monitor/logprofiles.json)                              | Provides operations for managing log profiles.  |
| [Metric Definitions](~/docs-ref-autogen/monitor/metricdefinitions.json)                  | Lists the metric definitions available for the resource. That is, what specific metrics are available |
| [Metrics](~/docs-ref-autogen/monitor/metrics.json)                                       | Lists the metric values for a resource.   |
| [Diagnostic Settings](~/docs-ref-autogen/monitor/servicediagnosticsettings.json) | Provides operations for creating, updating, and retrieving the diagnostic settings for a resource.|


## See also

- [Azure Monitor documentation](https://review.docs.microsoft.com/azure/monitoring-and-diagnostics/)