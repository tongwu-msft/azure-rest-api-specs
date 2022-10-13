---
title: Policy REST API
description: Operation groups for the Policy REST API
author: timwarner-msft
ms.author: timwarner
ms.manager: rayoflores
ms.date: 10/12/2022
ms.topic: reference
ms.service: azure-policy
ms.devlang: rest-api
---
# Policy

Policy REST API surfaces operations related to [Azure Policy](/azure/governance/policy) results. These operations include querying policy evaluation events and compliance states and managing policy remediations.

## Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Operations](xref:management.azure.com.policy.operations) | Review all of the available REST API options for Policy. |
| [Policy Assignments](xref:management.azure.com.policy.policyassignments)       | Provides operations to assign policy definitions to a scope in your subscription. |
| [Policy Attestations](/rest/api/policy/policy-attestations) | Provides operations to self-attest to manual policies. |
| [Policy Definitions](xref:management.azure.com.policy.policydefinitions)       | Provides operations to create policies that specify how users in your organization work with resources. |
| [Policy Events](xref:management.azure.com.policy.policyevents) | Query policy evaluation events generated as resources are created or updated. |
| [Policy Exemptions](xref:management.azure.com.policy.policyexemptions)         | Provides operations to create policy exemptions to exempt a scope from a policy assignment. |
| [Policy Metadata](xref:management.azure.com.policy.policymetadata) | Retrieve rich metadata for built-in policies. |
| [Policy Restrictions](xref:management.azure.com.policy.policyrestrictions) | Retrieve what restrictions Azure Policy will place on a resource. |
| [Policy Set Definitions](xref:management.azure.com.policy.policysetdefinitions)       | Provides operations to create groups of policy definitions. |
| [Policy States](xref:management.azure.com.policy.policystates) | Query policy compliance states for resources. |
| [Policy Tracked Resources](xref:management.azure.com.policy.policytrackedresources) | Query resources deployed by policy. |
| [Remediations](xref:management.azure.com.policy.remediations) | Provides operations to remediate resources that are non-compliant with policy. |

## See also

- [Azure Policy documentation](/azure/governance/policy/)
- [Azure Governance documentation](/azure/governance/)