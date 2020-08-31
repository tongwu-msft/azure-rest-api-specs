---
title: API versions of Management REST API 
titleSuffix: Azure Cognitive Search
description: Generally available and preview versions of the management REST API used to provision search services on Azure.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 09/01/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Versions of Management REST API (Azure Cognitive Search)

## Stable versions

+ `api-version=2020-08-01` (Latest Generally Available): [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-08-01)

+ `api-version=2020-03-13`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-03-13)

+ `api-version=2015-08-19`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19)

## Preview versions

+ `api-version=2019-08-01-Preview`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2020-08-01-preview).

  This is equivalent to the generally available version `2020-08-01`, but adds the creation of [`sharedPrivateLinkResources`](https://docs.microsoft.com/rest/api/searchmanagement/sharedprivatelinkresources) on a few more resources.

+ `api-version=2019-10-01-Preview`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2019-10-01-preview).

This is the most recent preview API version and it is equivalent to the generally available version (`2020-03-13`).

## See also

+ [Create a search service](https://docs.microsoft.com/azure/search/search-create-service-portal)
+ [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
+ [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
+ [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
