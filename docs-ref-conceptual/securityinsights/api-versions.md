---
title: API versions of Microsoft Sentinel REST APIs 
titleSuffix: Microsoft Sentinel
description: Lists the generally available and preview versions of the Microsoft Sentinel REST APIs.

ms.service: microsoft-sentinel
ms.topic: conceptual
ms.devlang: rest-api

ms.date: 12/09/2021
author: lior-tamir
ms.author: liortamir
ms.manager: elabramo
---

# API versions of Microsoft Sentinel REST APIs

This article lists the current and past versions of the Microsoft Sentinel REST APIs.


> [!Note] 
> Starting from the 2021-09-01-preview release, every Preview version contains all Preview operation groups. Starting from the 2021-10-01 release, every Stable version contains all Stable operation groups. If an operation group hasn’t changed since last version, it will carry over as-is to the new version.

## Preview versions

Use the latest preview version when you want to take advantage of all the latest Public Preview features. Note that preview versions are also released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).


| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2022-07-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2022-07-01-preview) | |
| `2022-06-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2022-06-01-preview) | |
| `2022-05-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2022-05-01-preview) | |
| `2022-04-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2022-04-01-preview) | |
| `2022-01-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2022-01-01-preview) | |
| `2021-10-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2021-10-01-preview) | [Release note](#2021-10-01-preview) |
| `2021-09-01-preview`  | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2021-09-01-preview) | [Release note](#2021-09-01-preview) |
| `2021-03-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2021-03-01-preview) |
| `2019-01-01-preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/preview/2019-01-01-preview) |

## Stable versions

Use the latest stable version when you want to access the latest generally available (GA) features.

| API version | Specification | API updates |
|-------------|---------------|-------------|
| `2021-10-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/stable/2021-10-01) | [Release note](#2021-10-01) |
| `2021-04-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/stable/2021-04-01) | [Release note](#2021-04-01) |
| `2020-01-01` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/securityinsights/resource-manager/Microsoft.SecurityInsights/stable/2020-01-01) | [Release note](#2020-01-01) |


## Release notes

<a name="2021-10-01"></a>

### 2021-10-01

This is the current generally available (GA) release of the Microsoft Sentinel REST APIs. It includes all the previously released GA features, plus the following additions:

+ Alert Rules (also known as analytics rules)
  + Alert grouping alignment
  + [Entity mapping](/azure/sentinel/map-data-fields-to-entities)
  + [Custom details](/azure/sentinel/surface-custom-details-in-alerts)
  + [Alert details](/azure/sentinel/customize-alert-details)
+ [Automation Rules](/azure/sentinel/automate-incident-handling-with-automation-rules)
+ [Onboarding States](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/what-s-new-azure-sentinel-new-onboarding-offboarding-api/ba-p/2640471)

<a name="2021-10-01-preview"></a>

### 2021-10-01-preview

This is the current Preview release of the Microsoft Sentinel REST APIs. It includes all the previously released Preview features, plus the following additions:

+ Alert Rules (also known as analytics rules)
  + [MITRE tactics and techniques](/azure/sentinel/whats-new#support-for-mitre-attck-techniques-public-preview) have been updated in analytics rules models.
+ Automation Rules
  +  New endpoint added for running playbooks on-demand on incidents.
+ Bookmarks
  +  MITRE techniques have been added.
  +  Extended entity mapping support has been added.
+ Data connectors
  + [Office connectors](/azure/sentinel/data-connectors-reference#microsoft-365-insider-risk-management-irm-preview) have been added.
+ Incidents
  +  [Techniques have been added to the incident schema](/azure/sentinel/whats-new#support-for-mitre-attck-techniques-public-preview).
  +  Provider incident URL has been added to incident schema.



<a name="2021-09-01-preview"></a>

### 2021-09-01-preview

This version includes all the previously released Preview features, plus the following additions:

+ Alert Rules (also known as analytics rules)
  + [Template version](/azure/sentinel/manage-analytics-rule-templates)
  + [NRT](/azure/sentinel/near-real-time-rules)
  + Add [Office IRM connector](/azure/sentinel/data-connectors-reference#microsoft-365-insider-risk-management-irm-preview) support
+ Data connectors
  + [AWS S3 connector](/azure/sentinel/connect-aws?tabs=s3)


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
