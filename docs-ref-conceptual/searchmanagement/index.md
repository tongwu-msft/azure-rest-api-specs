---
title: Management REST APIs in Azure Cognitive Search | Microsoft Docs
description: Script or automate Azure Cognitive Search service provisioning, key management, or resource configuration using REST APIs and Resource Manager APIs.
ms.prod: azure
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 04/23/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Search Management 

Azure Cognitive Search provides a REST API used with [Azure Resource Manager](https://docs.microsoft.com/rest/api/resources/) to provision and administer a search service in your Azure subscription. To manage your search service programmatically, specify the Resource Manager endpoint `https://management.azure.com` with a search management operation:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2020-03-13
```

Alternatively, you can use [.NET](https://aka.ms/search-mgmt-sdk) or [PowerShell](https://docs.microsoft.com/azure/search/search-manage-powershell) for search management, or write code that includes an HTTP client. The functionality is the same across all APIs and tools.

## Restricted availability for private endpoints

The ability to create a secure endpoint, by either setting up IP access control or leveraging Azure Private Endpoint, is supported in the newest stable version of the Management REST API. However, this feature is not currently available in all regions by default.

Support for IP access control and Azure Private Endpoint is available in the following regions. For more information about location considerations, see [choose a location](https://docs.microsoft.com/azure/search/search-create-service-portal#choose-a-location).

- East US 2 EUAP
- West US 2
- West Central US
- East US
- South Central US
- Australia East
- Australia Southeast
- West US
- East US 2

## See Also

- [How to use the search management API](search-howto-management-rest-api.md)
- [Azure Cognitive Search documentation](https://azure.microsoft.com/documentation/services/search/)
- [Search Service REST](~/docs-ref-conceptual/searchservice/index.md)   
