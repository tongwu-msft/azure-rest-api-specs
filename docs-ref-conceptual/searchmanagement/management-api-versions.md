---
title: API versions of Management REST API 
titleSuffix: Azure Cognitive Search
description: Lists the generally available and preview versions of the management REST APIs for Azure Cognitive Search.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 06/29/2021
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Versions of Management REST API (Azure Cognitive Search)

## Stable versions

| Version | Specification | API updates |
|---------|---------------|-----------------|
| `api-version=2020-08-01` (Latest) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-08-01) |  [Release note](#2020-08-01) |
| `api-version=2020-03-13` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2020-03-13) | [Release note](#2020-03-13) |
| `api-version=2015-08-19` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19) |  [Release note](#2015-08-19) |

## Preview versions

Preview versions are released to test new functionality, gather feedback, and discover and fix issues. Preview APIs are provided without a service level agreement, and are not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

| Version | Specification | API updates |
|---------|---------------|-----------------|
| `api-version=2021-04-01-Preview` (Latest) | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2021-04-01-preview) | [Release note](#2021-04-01-Preview) |
| `api-version=2020-08-01-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2020-08-01-preview) | [Release note](#2020-08-01-Preview) |
| `api-version=2019-10-01-Preview` | [Swagger specification](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2019-10-01-preview) | [Release note](#2019-10-01-Preview) |  

## Release notes

<a name="2021-04-01-Preview"></a>

### 2021-04-01-Preview

This preview API has all of the features of the previous preview API, and adds the following functionality.

+ Support for *UserAssigned* identity type for the search service. In addition to enabling a *SystemAssigned* identity, customers can now assign an identity they own and manage. A service can now have either a *SystemAssigned* identity, or a *UserAssigned* identity or both. (*SystemAssigned, UserAssigned*)

+ Customers can now configure how client requests are authenticated. In addition to the original key-based authentication, the preview API adds support for Azure Active Directory (Azure AD) role-based authentication. The ability use to Azure AD roles must be specified when the service is created or updated.

+ [Semantic search (preview)](https://docs.microsoft.com/azure/search/semantic-search-overview) is a premium feature that runs on Standard tier services. In this preview API, you can enable or disable semantic search at the service level to prohibit any query that invokes semantic ranking.

+ Customers can enforce new search services to require encryption of data plane resources via Customer Managed Keys (CMK). Existing search services that don't meet this requirement will be marked as non-compliant.

+ Customers can disable scenarios that push data stored in Azure Cognitive Search indexes to external data stores.

<a name="2020-08-01-Preview"></a>

### 2020-08-01-Preview

This preview API is equivalent to the generally available version `2020-08-01`, and adds the following .

+ Added `sharedPrivateLinkResources` support for two new resource types. New `groupId` values include `mysqlServer` (Azure database for MySQL) and `sites` (Azure Functions/app services).

<a name="2020-08-01"></a>

### 2020-08-01

This generally available version added [Shared Private Link Resources](/rest/api/searchmanagement/2020-08-01/shared-private-link-resources) support for all outbound-accessed resources except those noted in the preview version

<a name="2020-03-13"></a>

### 2020-03-13

This generally available version added support for [Private Endpoint Connections](/rest/api/searchmanagement/2020-08-01/private-endpoint-connections) through Azure Private Link, and network IP rules for new services.

<a name="2019-10-01-Preview"></a>

### 2019-10-01-Preview

This the first preview version. There were no preview features introduced in this list. This preview is functionally equivalent to 2020-03-13. It remains available. Any script or code that calls that version will work, but we recommend customers to update to using a more recent API version (either a Generally available or preview API version) to get the same results.

<a name="2015-08-19"></a>

### 2015-08-19

This is the initial release of the Management REST API. It provided APIs for service creation and deletion, provisioning replicas and partitions, and managing API keys.

## See also

+ [Create a search service](https://docs.microsoft.com/azure/search/search-create-service-portal)
+ [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
+ [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
+ [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
