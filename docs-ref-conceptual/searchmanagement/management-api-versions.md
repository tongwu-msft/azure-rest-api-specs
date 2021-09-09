---
title: API versions of Management REST APIs 
titleSuffix: Azure Cognitive Search
description: Lists the generally available and preview versions of the management REST APIs for Azure Cognitive Search.

ms.service: cognitive-search
ms.topic: "language-reference"
ms.devlang: rest-api

ms.date: 06/29/2021
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# API versions of Management REST APIs

This article lists the current and past versions of the Management REST APIs for Azure Cognitive Search.

## Stable versions

| API version | Specification | API updates |
|---------|---------------|-----------------|
| `2020-08-01` (Latest) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-08-01) |  [Release note](#2020-08-01) |
| `2020-03-13` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-03-13) | [Release note](#2020-03-13) |
| `2015-08-19` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19) |  [Release note](#2015-08-19) |

## Preview versions

Preview versions are released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are available under [Supplemental Terms of Use](https://azure.microsoft.com/support/legal/preview-supplemental-terms/), and are not recommended for production workloads.

| API version | Specification | API updates |
|---------|---------------|-----------------|
| `2021-04-01-Preview` (Latest) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2021-04-01-preview) | [Release note](#2021-04-01-Preview) |
| `2020-08-01-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2020-08-01-preview) | [Release note](#2020-08-01-Preview) |
| `2019-10-01-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2019-10-01-preview) | [Release note](#2019-10-01-Preview) |  

## Release notes

<a name="2021-04-01-Preview"></a>

### 2021-04-01-Preview

This preview API has all of the features of the previous preview API, and adds the following functionality:

+ Enable or disable [Azure role-based access (Azure RBAC)](/azure/search/search-security-rbac), currently in public preview. In addition to the original key-based authentication, you can now use Azure Active Directory (Azure AD) authentication and Azure RBAC authorization for data plane operations. In this preview management REST API, use [Create or Update Services](/rest/api/searchmanagement/2021-04-01-preview/services/create-or-update) to enabled or disable RBAC.

+ Enable or disable [semantic search](/azure/search/semantic-search-overview). Semantic search is a premium feature that runs on Standard tier services. In this preview management REST API, use [Create or Update Services](/rest/api/searchmanagement/2021-04-01-preview/services/create-or-update) to disable semantic search at the service level to prohibit any query that invokes semantic ranking. You can also enable this feature on search services on the free tier for a small number of free queries.

+ Enforce encryption of data plane resources via [Customer Managed Keys (CMK)](/azure/search/search-security-manage-encryption-keys). Use [Create or Update Services](/rest/api/searchmanagement/2021-04-01-preview/services/create-or-update) to configure this option. Existing search services that don't meet this requirement will be marked as non-compliant.

+ Disable workloads that push data from Azure Cognitive Search to external resources. Use [Create or Update Services](/rest/api/searchmanagement/2021-04-01-preview/services/create-or-update) to set `properties.disabledDataExfiltrationOptions` to "All" or null (default). Disabling all workloads turns off the following capabilities:

  + [Power query connectors](/azure/search/search-how-to-index-power-query-data-sources)
  + [Debug sessions](/azure/search/cognitive-search-debug-session)
  + [Enrichment cache](/azure/search/search-howto-incremental-index)
  + [Knowledge stores](/azure/search/knowledge-store-concept-intro), and [Skillsets](/azure/search/cognitive-search-working-with-skillsets) generally because they support custom skills that integrate with external code.

<a name="2020-08-01-Preview"></a>

### 2020-08-01-Preview

This preview API is equivalent to the generally available version `2020-08-01`, and and adds the following functionality:

+ Added `sharedPrivateLinkResources` support for two new resource types. New `groupId` values include `mysqlServer` (Azure database for MySQL) and `sites` (Azure Functions/app services).

<a name="2020-08-01"></a>

### 2020-08-01

This generally available version added [Shared Private Link Resources](/rest/api/searchmanagement/2020-08-01/shared-private-link-resources) support for all outbound-accessed resources except those noted in the preview version

<a name="2020-03-13"></a>

### 2020-03-13

This generally available version added support for [Private Endpoint Connections](/rest/api/searchmanagement/2020-08-01/private-endpoint-connections) through Azure Private Link, and network IP rules for new services.

<a name="2019-10-01-Preview"></a>

### 2019-10-01-Preview

This is the first preview version. There were no preview features introduced in this list. This preview is functionally equivalent to 2020-03-13. It remains available. Any script or code that calls that version will work, but we recommend customers to update to using a more recent API version (either a Generally available or preview API version) to get the same results.

<a name="2015-08-19"></a>

### 2015-08-19

This is the initial release of the Management REST API. It provided APIs for service creation and deletion, provisioning replicas and partitions, and managing API keys.

## See also

+ [Create a search service](/azure/search/search-create-service-portal)
+ [Service administration using the portal](/azure/search/search-manage)
+ [PowerShell administration](/azure/search/search-manage-powershell)
+ [Monitoring Azure Cognitive Search](/azure/search/search-monitor-usage)
