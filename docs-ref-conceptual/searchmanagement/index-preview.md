---
title: Preview REST API (Search Management)
titleSuffix: Azure Cognitive Search
description: API reference for the preview version of Azure Cognitive Search REST APIs.
ms.service: cognitive-search
ms.topic: "language-reference"

ms.date: 09/01/2020
author: HeidiSteen
ms.author: heidist
ms.manager: nitinme
---

# Preview Management REST APIs

Preview versions are released to test new functionality, gather feedback, and discover and fix issues.

> [!Important]
> Preview APIs are provided without a service level agreement, and are not recommended for production workloads. For more information, see [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/).

The following describes in detail a list of features, bug fixes, and general improvements for the most recent preview management REST APIs.

## 2021-04-01-Preview

`2021-04-01-Preview` includes all the features, bug fixes, and improvements from `2020-08-01-Preview`. Features, bug fixes, and improvements exclusive to `2021-04-01-Preview` are listed below.

+ Support for *UserAssigned* identity type for the search service. In addition to enabling a *SystemAssigned* identity, customers can now assign an identity they own and manage. A service can now have either a *SystemAssigned* identity, or a *UserAssigned* identity or both. (*SystemAssigned, UserAssigned*)

+ Customers can now configure how client requests are authenticated. In addition to the original key-based authentication, the preview API adds support for Azure Active Directory (Azure AD) role-based authentication. The ability use to Azure AD roles must be specified when the service is created or updated.

+ [Semantic search (preview)](https://docs.microsoft.com/azure/search/semantic-search-overview) is a premium feature that runs on Standard tier services. In this preview API, you can enable or disable semantic search at the service level to prohibit any query that invokes semantic ranking.

+ Customers can enforce new search services to require encryption of data plane resources via Customer Managed Keys (CMK). Existing search services that don't meet this requirement will be marked as non-compliant.

+ Customers can disable scenarios that push data stored in Azure Cognitive Search indexes to external data stores.

## 2020-08-01-Preview

`2020-08-01-Preview` includes all the features, bug fixes, and improvements from the Generally available API version `2020-08-01`. Features, bug fixes, and improvements exclusive to `2020-08-01-Preview` are listed below.

+ Support for created `sharedPrivateLinkResources` to 2 new resource types. 2 new `groupId` values are supported: `mysqlServer` (Azure database for MySQL) and `sites` (Azure Functions/app services)

## Old Preview API versions

The first preview version, `api-version=2019-10-01-Preview`, remains available. Any script or code that calls that version will work, but we recommend customers to update to using a more recent API version (either a Generally available or preview API version) to get the same results.