---
title: Azure Resource Manager REST API | Microsoft Docs
description: Operation groups for Azure Resource Manager REST API
ms.service: azure-resource-manager
ms.date: 03/30/2021
author: tfitzmac
ms.author: tomfitz
service_description: Azure Resource Manager
---

# Azure Resource Manager

Azure Resource Manager enables you to deploy and manage the infrastructure for your Azure solutions. You organize related resources in resource groups, and deploy your resources with JSON templates. For an introduction to deploying and managing resources with Resource Manager, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

## REST operation groups

| Operation group                                 | Description |
|-------------------------------------------------|-------------|
| [Changes](xref:management.azure.com.resources.changes) | Provides operations to get details about the changes that happen to deployed resources. |
| [Deployment Operations](xref:management.azure.com.resources.deploymentoperations) | Provides operations to get details about the operations that happen during a deployment. |
| [Deployment Scripts](xref:management.azure.com.resources.deploymentscripts) | Provides operations for working with scripts in a template. |
| [Deployments](xref:management.azure.com.resources.deployments)                    | Provides operations to work with deployments, including deploying a template, exporting a template, and getting information about a deployment. |
| [Features](xref:management.azure.com.resources.features)                          | Provides operations for users to access preview features from resource providers. |
| [Management Locks](xref:management.azure.com.resources.managementlocks)           | Provides operations to prevent users in your organization from deleting or modifying certain resources. |
| [Providers](xref:management.azure.com.resources.providers)                        | Provides operations to work with resource providers that support resources. |
| [Resource Groups](xref:management.azure.com.resources.resourcegroups)             | Provides operations to create, delete, and access resource groups. |
| [Resource Links](xref:management.azure.com.resources.resourcelinks)               | Provides operations to link resources that have logical relationships. |
| [Resources](xref:management.azure.com.resources.resources)                        | Provides operations to work with deployed resources. |
| [Subscriptions](xref:management.azure.com.resources.subscriptions)                | Provides operations to view the subscriptions for your Azure Active Directory tenant. |
| [Tags](xref:management.azure.com.resources.tags)                                  | Provides operations to apply tag names and values to resources for organizing your resources. |
| [Template Specs](xref:management.azure.com.resources.templatespecs) | Provides operations for working with templates that you can share in your organization. |
| [Tenants](xref:management.azure.com.resources.tenants)                            | Provides operations to view the Azure Active Directory tenants for your account. |

## See also

- [What are Azure Resource Manager templates?](https://docs.microsoft.com/azure/azure-resource-manager/templates/overview)
- [Template Syntax](https://docs.microsoft.com/azure/azure-resource-manager/templates/template-syntax)
