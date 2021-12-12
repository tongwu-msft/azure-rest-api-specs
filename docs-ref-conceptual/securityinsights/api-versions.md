---
title: API versions of Microsoft Sentinel REST APIs 
titleSuffix: Microsoft Sentinel
description: Lists the generally available and preview versions of the Microsoft Sentinel REST APIs.

ms.service: securityinsights
ms.topic: language-reference
ms.devlang: rest-api

ms.date: 12/09/2021
author: lior-tamir
ms.author: lior-tamir
ms.manager: elabramo
---

# API versions of Search REST APIs

This article lists the current and past versions of the Microsoft Sentinel REST APIs.

[!Note] From 2021-09-01 Preview and 2121-10-01 (stable) versions, every version contains all operation groups. If an operation group hasn’t changed since last version, it will appear again in the new version.

## Preview versions

Use latest preview version when you want to leverage all the latest Public Preview features. Note that Preview versions are also released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).


| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2021-09-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2021-09-01-preview) | [Release note](#2021-09-01-preview) |
| `2021-03-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2021-03-01-preview) |
| `2019-01-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2019-01-01-preview) |

## Stable versions

Use latest stable version when you want to leverage the latest Generally available features.

| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2021-04-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/stable/2021-04-01) | [Release note](#2021-04-01) |
| `2020-01-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/stable/2020-01-01) | [Release note](#2020-01-01) |


## Release notes

<a name="2021-09-01-preview"></a>

### 2021-09-01-preview

This is the current Preview release of the Microsoft Sentinel REST APIs. It includes all the previously released Preview features, plus the following additions:

+ Alert Rules
  + [Template version](https://docs.microsoft.com/azure/sentinel/manage-analytics-rule-templates?tabs=update)
  + [NRT](https://docs.microsoft.com/azure/sentinel/near-real-time-rules)
  + Add [Office IRM connector](https://docs.microsoft.com/azure/sentinel/data-connectors-reference#microsoft-365-insider-risk-management-irm-preview) support
+ Data connectors
  + [AWS S3 connector](https://docs.microsoft.com/azure/sentinel/connect-aws?tabs=s3)
  + Add support for Codeless API Polling data connectors



<a name="2021-04-01"></a>

### 2021-04-01

Generally available features in this release include:

+ Incidents
+ Threat Intelligence
+ Watchlists
+ Incidents

<a name="2020-01-01"></a>

### 2020-01-01

Generally available features in this release include:

+ Alert rules
+ Alert rules templates
+ Bookmarks
+ Data connectors
+ Incidents


## See also

+ [Microsoft Sentinel Documentation](/azure/sentinel)
+ [Bicep & ARM templates reference](/azure/templates/microsoft.securityinsights/allversions)
