---
ms.assetid: 044adbd9-f1d2-4f77-9bec-35615e61d5f5
ms.title: Azure Resource Manager REST API | Microsoft Docs
ms.service: azure-resource-manager
author: tfitzmac
ms.author: tomfitz
ms.manager: timlt
---

# Azure Resource Manager

Azure Resource Manager enables you to deploy and manage the infrastructure for your Azure solutions. You organize related resources in resource groups, and deploy your resources with JSON templates. For an introduction to deploying and managing resources with Resource Manager, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

## REST Operation Groups

| Operation Group                                 | Description |
|-------------------------------------------------|-------------|
| [Deployment Operations](~/api-ref/resources/deploymentoperations.json) | Provides operations to get details about the operations that happen during a deployment. |
| [Deployments](~/api-ref/resources/deployments.json)                    | Provides operations to work with deployments, including deploying a template, exporting a template, and getting information about a deployment. |
| [Features](~/api-ref/resources/features.json)                          | Provides operations for users to access preview features from resource providers. |
| [Management Locks](~/api-ref/resources/managementlocks.json)           | Provides operations to prevent users in your organization from deleting or modifying certain resources. |
| [Policy Assignments](~/api-ref/resources/policyassignments.json)       | Provides operations to assign policy definitions to a scope in your subscription. |
| [Policy Definitions](~/api-ref/resources/policydefinitions.json)       | Provides operations to create policies that specify how users in your organization work with resources. |
| [Providers](~/api-ref/resources/providers.json)                        | Provides operations to work with resource providers that support resources. |
| [Resource Groups](~/api-ref/resources/resourcegroups.json)             | Provides operations to create, delete, and access resource groups. |
| [Resource Links](~/api-ref/resources/resourcelinks.json)               | Provides operations to link resources that have logical relationships. |
| [Resources](~/api-ref/resources/resources.json)                        | Provides operations to work with deployed resources. |
| [Subscriptions](~/api-ref/resources/subscriptions.json)                | Provides operations to view the subscriptions for your Azure Active Directory tenant. |
| [Tags](~/api-ref/resources/tags.json)                                  | Provides operations to apply tag names and values to resources for organizing your resources. |
| [Tenants](~/api-ref/resources/tenants.json)                            | Provides operations to view the Azure Active Directory tenants for your account. |


## See Also

- [Authoring Azure Resource Manager templates](https://docs.microsoft.com/azure/resource-group-authoring-templates?toc=%2fazure%2fazure-resource-manager%2ftoc.json)
- [Resource Manager providers, regions, API versions and schemas](https://docs.microsoft.com/azure/resource-manager-supported-services?toc=%2fazure%2fazure-resource-manager%2ftoc.json)
