---
title: Management REST APIs in Azure Cognitive Search | Microsoft Docs
description: Script or automate Azure Cognitive Search service provisioning, key management, or resource configuration using REST APIs and Resource Manager APIs.
ms.prod: azure
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 05/11/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Search Management 

Azure Cognitive Search provides a REST API used with [Azure Resource Manager](https://docs.microsoft.com/rest/api/resources/) to provision and administer a search service in your Azure subscription. To manage your search service programmatically, specify the Resource Manager endpoint `https://management.azure.com` with a search management operation:

```http
https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2020-03-13
```

Another option for calling the management REST APIs is using the [Az.Search PowerShell module](https://docs.microsoft.com/azure/search/search-manage-powershell) or the [Azure Command-Line Interface (CLI)](https://docs.microsoft.com/cli/azure/search?view=azure-cli-latest).

## Other SDKs

The following additional SDKs provide programmatic support for managing a search service programmatically:

+ [Search Management libraries for .NET](https://aka.ms/search-mgmt-sdk)

+ [Search Management libraries for Python](https://docs.microsoft.com/python/api/overview/azure/search?view=azure-python)

## Next steps

- [How to use the search management API](search-howto-management-rest-api.md)
- [Azure Cognitive Search documentation](https://azure.microsoft.com/documentation/services/search/)
- [Search Service REST](~/docs-ref-conceptual/searchservice/index.md)   
