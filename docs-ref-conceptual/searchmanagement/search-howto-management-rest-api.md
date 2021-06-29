---
title: How to use search management REST APIs
titleSuffix: Azure Cognitive Search
description: Describes the operations supported by the search management REST APIs for Azure Cognitive Search. This article also notes the dependencies, and explains how to formulate the endpoint.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 09/01/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# How to use the Management REST API (Azure Cognitive Search)

The Management REST API of Azure Cognitive Search provides programmatic access to administrative operations:

+ Create or delete a search service
+ Create, regenerate, or retrieve `api-keys` (query or admin keys)
+ Create or update shared private links used to access a search service from network components in an Azure virtual network
+ Add or remove replicas and partitions (units of capacity that back a search service)

For all other tasks, such as creating and querying an index, use the [Search Service REST API](https://docs.microsoft.com/rest/api/searchservice/) instead.

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search documented here, plus the common [Azure Resource Manager REST API](https://docs.microsoft.com/rest/api/searchmanagement/). The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. 

To get started with the Management REST API, see [Manage a search service with PowerShell](https://docs.microsoft.com/azure/search/search-manage-powershell) for step-by-step instruction.

## Connect to the management endpoint

To manage your search service programmatically, specify the Resource Manager endpoint `https://management.azure.com`. An HTTP request includes the Resource Manager endpoint, subscription ID, provider (in this case, Azure Cognitive Search), and the search service-specific operation. 

A fully specified endpoint has the following components:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2020-08-01
```

The following tools are commonly used to call the management REST APIs:

+ [Azure Command-Line Interface (CLI)](https://docs.microsoft.com/cli/azure/)
+ [Postman](https://www.postman.com/downloads/) or other web API testing tools
+ [Az.Search PowerShell module](https://docs.microsoft.com/powershell/module/az.search) (updated on a separate schedule and is not guaranteed to have the enhancements)

## Endpoint protection

Protect your search service's API endpoint using IP address based firewall rules or a private endpoint connection via Azure Private Link.

Visit these links for more information about search service endpoint protection:

+ [Configure an IP firewall for Azure Cognitive Search](https://docs.microsoft.com/azure/search/service-configure-firewall)
+ [Create a Private Endpoint for a secure connection to Azure Cognitive Search](https://docs.microsoft.com/azure/search/service-create-private-endpoint)

## Authentication and access control

The Azure Cognitive Search Management REST API is an extension of the Azure Resource Manager and shares its dependencies. As such, Azure Active Directory (AD) is a prerequisite to service administration of Azure Cognitive Search. All administrative requests from client code must be authenticated using Azure AD before the request reaches the Resource Manager.

Service and key administration, due to the dependency on Resource Manager, relies on Azure AD for authentication.

Data requests against the Azure Cognitive Search service endpoint, such as [Create Index &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/create-index) or [Search Documents &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/search-documents), use an `api-key` in the request header. See [Azure Cognitive Search REST APIs](https://docs.microsoft.com/rest/api/searchservice/) for information about authenticating a data request.

Authentication documentation for Resource Manager can be found at [Use Resource Manager authentication API to access subscriptions](https://docs.microsoft.com/azure/azure-resource-manager/resource-manager-api-authentication).

Access control for Azure Resource Manager uses the built-in Owner, Contributor, and Reader roles. By default, all service administrators are members of the Owner role. For details, see [Role-based access control in the Azure portal](https://docs.microsoft.com/azure/search/search-security-rbac).

## Next steps

Visit these links for more information about service and index administration:

+ [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
+ [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
+ [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
+ [Deployment strategies and best practices](https://docs.microsoft.com/azure/search/search-performance-optimization)
+ [Scale an Azure Cognitive Search service](https://docs.microsoft.com/azure/search/search-capacity-planning)