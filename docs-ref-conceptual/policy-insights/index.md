---
title: Policy Insights REST API
description: Operation groups for the Policy Insights REST API
author: DCtheGeek
ms.author: dacoulte
ms.manager: carmonm
ms.date: 10/29/2018
ms.topic: reference
ms.service: azure-policy
ms.devlang: rest-api
---
# Policy Insights

Policy Insights REST API surfaces operations related to [Azure Policy](https://docs.microsoft.com/azure/governance/policy) results. These operations include querying policy evaluation events and compliance states and managing policy remediations.

## Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Operations](xref:management.azure.com.policy-insights.operations) | Review all of the available REST API options for Policy. |
| [Policy Events](xref:management.azure.com.policy-insights.policyevents) | Query policy evaluation events generated as resources are created or updated. |
| [Policy States](xref:management.azure.com.policy-insights.policystates) | Query policy compliance states for resources. |
| [Policy Tracked Resources](xref:management.azure.com.policy-insights.policytrackedresources) | Query resources deployed by policy. |
| [Remediations](xref:management.azure.com.policy-insights.remediations) | Provides operations to remediate resources that are non-compliant with policy. |

## See also

- [Azure Policy documentation](https://docs.microsoft.com/azure/governance/policy/)
- [Azure Governance documentation](https://docs.microsoft.com/azure/governance/)