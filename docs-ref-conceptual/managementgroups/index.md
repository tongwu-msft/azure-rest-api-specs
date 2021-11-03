---
title: Management Groups REST API
description: Operation groups for Management Groups REST API
ms.service: governance
ms.date: 03/19/2021
ms.topic: reference
author: tfitzmac
ms.author: tomfitz
---

# Management Groups

Management groups enable you to manage access, policies, and compliance for your Azure subscriptions. For an introduction, see [What are Azure management groups?](https://docs.microsoft.com/azure/governance/management-groups/overview).

## REST operation groups

| Operation group                                 | Description |
|-------------------------------------------------|-------------|
| [Check Name Availability](xref:management.azure.com.managementgroups.checknameavailability) | Checks if the specified management group name is valid and unique. |
| [Entities](xref:management.azure.com.managementgroups.entities) | Work with entities (management groups and subscriptions) for the authenticated user. |
| [Hierarchy Settings](xref:management.azure.com.managementgroups.entities) | Provides operations for hierarchy settings defined at the management group level. |
| [Management Group Subscriptions](xref:management.azure.com.managementgroups.managementgroupsubscriptions) | Provides operations to connect subscriptions with management groups. |
| [Management Groups](xref:management.azure.com.managementgroups.managementgroups) | Provides operations for working with management groups. |
| [Operations](xref:management.azure.com.managementgroups.operations) | Lists all of the available management group REST API operations. |
| [Start Tenant Backfill](xref:management.azure.com.managementgroups.starttenantbackfill) | Starts backfilling subscriptions for the tenant. |
| [Tenant Backfill Status](xref:management.azure.com.managementgroups.tenantbackfillstatus) | Gets tenant backfill status. |

## See also

- [What are Azure management groups?](https://docs.microsoft.com/azure/governance/management-groups/overview)
- [Quickstart: Create a management group with REST API](https://docs.microsoft.com/azure/governance/management-groups/create-management-group-rest-api)
