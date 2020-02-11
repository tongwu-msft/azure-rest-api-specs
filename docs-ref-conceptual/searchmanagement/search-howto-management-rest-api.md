---
title: How to use search management REST APIs
titleSuffix: Azure Cognitive Search
description: Script or automate Azure Cognitive Search service provisioning, key management, or resource configuration using REST APIs and Resource Manager APIs.
ms.prod: azure
ms.service: search
ms.topic: "language-reference"

ms.date: 02/11/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# How to use the Management REST API (Azure Cognitive Search)

The Management REST API of Azure Cognitive Search provides programmatic access to administrative operations:

-  Create or delete a search service
-  Create, regenerate, or retrieve `api-keys` (query or admin keys)
-  Add or remove replicas and partitions (units of capacity that back a search service)

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search, plus the common [Azure Resource Manager REST API](https://docs.microsoft.com/rest/api/searchmanagement/).

The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. 

To create and manage Azure Cognitive Search services in your subscription, make sure your HTTP request includes the Resource Manager endpoint, subscription ID, provider (in this case, Azure Cognitive Search), and the search service-specific operation.

You can find sample code using the Search Management REST API with Powershell or Postman in [our samples repository](https://docs.microsoft.com/samples/browse/?products=azure-cognitive-search&languages=rest).

## Endpoint

The endpoint for service administration operations is the URL of Azure Resource Manager: `https://management.azure.com`, plus a subscription iID, plus service and API information.

A fully specified endpoint has the following components:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2015-08-19
```

## Authentication and access control

The Azure Cognitive Search Management REST API is an extension of the Azure Resource Manager and shares its dependencies. As such, Active Directory is a prerequisite to service administration of Azure Cognitive Search. All administrative requests from client code must be authenticated using Azure Active Directory before the request reaches the Resource Manager.

Note that if your application code handles *service administration operations* as well as *data operations* on search indexes or documents, you'll be using two authentication approaches for each of the Azure Cognitive Search service APIs:

-   Service and key administration, due to the dependency on Resource Manager, relies on Active Directory for authentication.

-   Data requests against the Azure Cognitive Search service endpoint, such as [Create Index &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/create-index) or [Search Documents &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/search-documents), use an `api-key` in the request header. See [Azure Cognitive Search REST APIs](https://docs.microsoft.com/rest/api/searchservice/) for information about authenticating a data request.

Authentication documentation for Resource Manager can be found at [Use Resource Manager authentication API to access subscriptions](https://docs.microsoft.com/azure/azure-resource-manager/resource-manager-api-authentication).

Access control for Azure Resource Manager uses the built-in Owner, Contributor, and Reader roles. By default, all service administrators are members of the Owner role. For details, see [Role-based access control in the Azure portal](https://docs.microsoft.com/azure/search/search-security-rbac).

## Next steps

Visit these links for more information about service and index administration:

- [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
- [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
- [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
- [Deployment strategies and best practices](https://docs.microsoft.com/azure/search/search-performance-optimization)
- [Scale an Azure Cognitive Search service](https://docs.microsoft.com/azure/search/search-capacity-planning)
