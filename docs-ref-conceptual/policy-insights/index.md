---
ms.title: Policy Insights
ms.service: policy-insights
ms.author: bulente
---


# Policy Insights

Policy Insights REST API surfaces operations related to [Azure Policy](https://docs.microsoft.com/azure/azure-policy) results. These operations include querying policy evaluation events and compliance states and managing policy remediations.

##  Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Policy Events](xref:management.azure.com.policy-insights.policyevents) | Query policy evaluation events generated as resources are created or updated. |
| [Policy States](xref:management.azure.com.policy-insights.policystates) | Query policy compliance states for resources. |
| [Policy Tracked Resources](xref:management.azure.com.policy-insights.policytrackedresources) | Query resources deployed by policy. |
| [Remediations](xref:management.azure.com.policy-insights.remediations) | Provides operations to remediate resources that are non-compliant with policy. |

## See Also

* [Azure Policy documentation](https://docs.microsoft.com/azure/azure-policy)
