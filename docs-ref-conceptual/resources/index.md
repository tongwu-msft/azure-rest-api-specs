---
ms.assetid: 044adbd9-f1d2-4f77-9bec-35615e61d5f5
ms.title: Azure Resource Manager REST API | Microsoft Docs
ms.service: azure-resource-manager
author: tfitzmac
ms.author: tomfitz
ms.manager: timlt
service_description: To be added
---

# Azure Resource Manager

Azure Resource Manager enables you to deploy and manage the infrastructure for your Azure solutions. You organize related resources in resource groups, and deploy your resources with JSON templates. For an introduction to deploying and managing resources with Resource Manager, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

## REST Operation Groups

| Operation Group                                 | Description |
|-------------------------------------------------|-------------|
| [Deployment Operations](xref:management.azure.com.resourcemanagement.deploymentoperations) | Provides operations to get details about the operations that happen during a deployment. |
| [Deployments](xref:management.azure.com.resourcemanagement.deployments)                    | Provides operations to work with deployments, including deploying a template, exporting a template, and getting information about a deployment. |
| [Features](xref:management.azure.com.resourcemanagement.features)                          | Provides operations for users to access preview features from resource providers. |
| [Management Locks](xref:management.azure.com.resourcemanagement.managementlocks)           | Provides operations to prevent users in your organization from deleting or modifying certain resources. |
| [Policy Assignments](xref:management.azure.com.resourcemanagement.policyassignments)       | Provides operations to assign policy definitions to a scope in your subscription. |
| [Policy Definitions](xref:management.azure.com.resourcemanagement.policydefinitions)       | Provides operations to create policies that specify how users in your organization work with resources. |
| [Policy Set Definitions](xref:management.azure.com.resourcemanagement.policysetdefinitions)       | Provides operations to create groups of policy definitions. |
| [Providers](xref:management.azure.com.resourcemanagement.providers)                        | Provides operations to work with resource providers that support resources. |
| [Resource Groups](xref:management.azure.com.resourcemanagement.resourcegroups)             | Provides operations to create, delete, and access resource groups. |
| [Resource Links](xref:management.azure.com.resourcemanagement.resourcelinks)               | Provides operations to link resources that have logical relationships. |
| [Resources](xref:management.azure.com.resourcemanagement.resources)                        | Provides operations to work with deployed resources. |
| [Subscriptions](xref:management.azure.com.resourcemanagement.subscriptions)                | Provides operations to view the subscriptions for your Azure Active Directory tenant. |
| [Tags](xref:management.azure.com.resourcemanagement.tags)                                  | Provides operations to apply tag names and values to resources for organizing your resources. |
| [Tenants](xref:management.azure.com.resourcemanagement.tenants)                            | Provides operations to view the Azure Active Directory tenants for your account. |



## See Also

- [Authoring Azure Resource Manager templates](https://docs.microsoft.com/azure/resource-group-authoring-templates?toc=%2fazure%2fazure-resource-manager%2ftoc.yml)
- [Resource Manager providers, regions, API versions and schemas](https://docs.microsoft.com/azure/resource-manager-supported-services?toc=%2fazure%2fazure-resource-manager%2ftoc.yml)
