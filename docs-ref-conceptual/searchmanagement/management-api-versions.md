---
title: API versions of Management REST API 
titleSuffix: Azure Cognitive Search
description: Generally available and preview versions of the management REST API used to provision search services on Azure.
ms.prod: azure
ms.service: search
ms.topic: "language-reference"

ms.date: 01/15/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Versions of Management REST API (Azure Cognitive Search)

## Stable versions

+ `api-version=2015-08-19` (Latest): [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19)

+ `api-version=2015-02-28`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-02-28)

## Preview versions

+ `api-version=2019-10-01-Preview`: [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2019-10-01-preview).

The preview API is a superset of the generally available version (`2015-08-19`). Currently the only preview-specific feature is private endpoint.

Support for IP access control and Azure Private Endpoint is available in the following regions:

+ East US 2 EUAP
+ West US 2
+ West Central US
+ East US
+ South Central US

## See also

+ [Create a search service](https://docs.microsoft.com/azure/search/search-create-service-portal)
+ [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
+ [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
+ [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)