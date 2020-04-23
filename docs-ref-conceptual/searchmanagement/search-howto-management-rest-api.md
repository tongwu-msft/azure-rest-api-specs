---
title: How to use search management REST APIs
titleSuffix: Azure Cognitive Search
description: Script or automate Azure Cognitive Search service provisioning, key management, or resource configuration using REST APIs and Resource Manager APIs.
ms.prod: azure
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 04/06/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# How to use the Management REST API (Azure Cognitive Search)

The Management REST API of Azure Cognitive Search provides programmatic access to administrative operations:

-  Create or delete a search service
-  Create, regenerate, or retrieve `api-keys` (query or admin keys)
-  Add or remove replicas and partitions (units of capacity that back a search service)

To create indexes and indexers and query the service you will need to use the [Search Service REST API](https://docs.microsoft.com/rest/api/searchservice/).

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search, plus the common [Azure Resource Manager REST API](https://docs.microsoft.com/rest/api/searchmanagement/).

The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. 

To create and manage Azure Cognitive Search services in your subscription, make sure your HTTP request includes the Resource Manager endpoint, subscription ID, provider (in this case, Azure Cognitive Search), and the search service-specific operation.

We have quickstarts that provide sample code and step-by-step instructions using the Management REST API with [PowerShell](https://docs.microsoft.com/azure/search/search-get-started-powershell) in our documentation.

## Endpoint

The endpoint for service administration operations is the URL of Azure Resource Manager: `https://management.azure.com`, plus a subscription iID, plus service and API information.

A fully specified endpoint has the following components:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2020-03-13
```

## Private Endpoints

For isolating the service's API endpoint from internet by either setting up your IP address based firewall rules or by provisioning search service in private mode which can be accessed only from private endpoints, you must request access to this feature.

For more information about mechanisms for securing access to a private endpoint, see [Create a Private Endpoint for a secure connection to Azure Cognitive Search (Preview)](https://docs.microsoft.com/azure/search/service-create-private-endpoint).

Support for IP access control and Azure Private Endpoint is available in the following regions:

- East US 2 EUAP
- West US 2
- West Central US
- East US
- South Central US
- Australia East
- Australia Southeast
- West US
- East US 2

## Authentication and access control

The Azure Cognitive Search Management REST API is an extension of the Azure Resource Manager and shares its dependencies. As such, Active Directory is a prerequisite to service administration of Azure Cognitive Search. All administrative requests from client code must be authenticated using Azure Active Directory before the request reaches the Resource Manager.

Service and key administration, due to the dependency on Resource Manager, relies on Active Directory for authentication.

Data requests against the Azure Cognitive Search service endpoint, such as [Create Index &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/create-index) or [Search Documents &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/search-documents), use an `api-key` in the request header. See [Azure Cognitive Search REST APIs](https://docs.microsoft.com/rest/api/searchservice/) for information about authenticating a data request.

Authentication documentation for Resource Manager can be found at [Use Resource Manager authentication API to access subscriptions](https://docs.microsoft.com/azure/azure-resource-manager/resource-manager-api-authentication).

Access control for Azure Resource Manager uses the built-in Owner, Contributor, and Reader roles. By default, all service administrators are members of the Owner role. For details, see [Role-based access control in the Azure portal](https://docs.microsoft.com/azure/search/search-security-rbac).

## Next steps

Visit these links for more information about service and index administration:

- [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
- [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
- [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
- [Deployment strategies and best practices](https://docs.microsoft.com/azure/search/search-performance-optimization)
- [Scale an Azure Cognitive Search service](https://docs.microsoft.com/azure/search/search-capacity-planning)
