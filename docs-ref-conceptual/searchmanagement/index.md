---
title: Management REST APIs in Azure Cognitive Search
titleSuffix: Azure Cognitive Search
description: REST API reference for provisioning an Azure Cognitive Search service for public or private access. You can also manage API keys and configure capacity.

ms.service: cognitive-search
ms.topic: reference
ms.devlang: rest-api

ms.date: 06/29/2021
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Search Management

The Management REST API of Azure Cognitive Search provides programmatic access to administrative operations:

+ Create or delete a search service
+ Create, regenerate, or retrieve `api-keys` (query or admin keys)
+ Add or remove replicas and partitions (adjust capacity)
+ Configure a search service to use a private endpoint

For all other tasks, such as creating and querying an index, use the [Search Service REST API](/rest/api/searchservice/) instead.

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search documented here, plus the common [Azure Resource Manager REST API](/rest/api/resources/). The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. 

## Connect to the management endpoint

When setting up the connection, start with the Resource Manager endpoint `https://management.azure.com`. An HTTP request includes the Resource Manager endpoint, subscription ID, provider (`Microsoft.Search`), and the API version. Operations are specified in the body of the request.

A fully specified endpoint has the following components:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2020-08-01
```

The following clients are commonly used to call the management REST APIs:

+ [Azure PowerShell](/azure/search/search-manage-powershell) using the [Az.Search PowerShell module](/powershell/module/az.search) (updated on a separate schedule and is not guaranteed to have the enhancements)
+ [Azure Command-Line Interface (CLI)](/cli/azure/)
+ [Postman](https://www.postman.com/downloads/) or other web API testing tools

You can also use the Azure portal.

## Authentication and access control

Administration rights are conveyed through roles in Azure Active Directory (AD). A best practice is to assign roles to groups rather than individual users. The subscription owner or global administrator manages these assignments. For more information, see [Assign Azure AD roles to groups](/azure/active-directory/roles/groups-assign-role).

For search service management, supported roles include Owner, Contributor, and Reader. For the full list, see [Role-based authorization](/azure/search/search-security-rbac).

## Management APIs in other SDKs

The REST APIs are foundational to Azure Cognitive Search, and any changes to the programming model are reflected in the REST APIs first.

Alternatives include the following Azure SDKs, which are independently updated on separate release schedules:

+ [.NET](/dotnet/api/overview/azure/search/management)
+ [Python](/python/api/overview/azure/search/management)
+ [Node.js (readme)](https://github.com/Azure/azure-rest-api-specs/blob/master/specification/search/resource-manager/readme.nodejs.md)
+ [TypeScript (readme)](https://github.com/Azure/azure-rest-api-specs/blob/master/specification/search/resource-manager/readme.typescript.md)

## See also

+ [Azure Cognitive Search documentation](/azure/search/)
+ [PowerShell administration](/azure/search/search-manage-powershell)
+ [Scale an Azure Cognitive Search service](/azure/search/search-capacity-planning)
