---
title: Management REST APIs in Azure Cognitive Search | Microsoft Docs
description: API reference for provisioning an Azure Cognitive Search service for public or private access. You can also manage API keys and configure capacity.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 06/29/2021
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Search Management

The Management REST API of Azure Cognitive Search provides programmatic access to administrative operations:

+ Create or delete a search service
+ Create, regenerate, or retrieve `api-keys` (query or admin keys)
+ Add or remove replicas and partitions (adust capacity)
+ Configure a search service to use a private endpoint

For all other tasks, such as creating and querying an index, use the [Search Service REST API](/rest/api/searchservice/) instead.

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search documented here, plus the common [Azure Resource Manager REST API](/rest/api/searchmanagement/). The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. 

## Connect to the management endpoint

To connect to the management endpoint, start with the Resource Manager endpoint `https://management.azure.com`. An HTTP request includes the Resource Manager endpoint, subscription ID, provider (`Microsoft.Search`), and the API version.

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

Rights to administer a search service are conveyed through roles in Azure Active Directory (AD). In Azure Cognitive Search, supported roles include Owner, Contributor, and Reader. For more information, see [Role-based authorization in Cognitive Search](/azure/search/search-security-rbac).

## Management APIs in other SDKs

The REST APIs are foundational to Azure Cognitive Search, and any changes to the programming model are reflected in the REST APIs first.

Alternatives include the following SDKs, which are independently updated on separate release schedules:

+ [.NET](/dotnet/api/overview/azure/search/management)
+ [Python](/python/api/overview/azure/search/management?view=azure-python)
+ [Node.js (readme)](/Azure/azure-rest-api-specs/blob/master/specification/search/resource-manager/readme.nodejs.md)
+ [TypeScript (readme)](/Azure/azure-rest-api-specs/blob/master/specification/search/resource-manager/readme.typescript.md)

## See also

+ [Azure Cognitive Search documentation](/documentation/services/search/)
+ [PowerShell administration](/azure/search/search-manage-powershell)
+ [Scale an Azure Cognitive Search service](/azure/search/search-capacity-planning)
