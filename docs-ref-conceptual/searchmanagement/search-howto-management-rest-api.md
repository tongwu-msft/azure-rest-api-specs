---
title: How to use search management REST APIs in Azure Cognitive Search
description: Script or automate Azure Cognitive Search service provisioning, key management, or resource configuration using REST APIs and Resource Manager APIs.
ms.prod: azure
ms.service: search
ms.topic: "language-reference"

ms.date: 03/11/2019
author: HeidiSteen
ms.author: heidist
ms.manager: cgronlun
---

# How to use the Management REST API (Azure Cognitive Search)

The Management REST API of Azure Cognitive Search provides programmatic access to much of the functionality available through the portal, allowing administrators to automate the following operations:

-  Create or delete an Azure Cognitive Search service
-  Create, regenerate, or retrieve `api-keys` for routine changes to the administrative keys used for authenticating data operations
-  Adjust the scale of an Azure Cognitive Search service in response to changes in query volume or storage requirements

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Cognitive Search, plus the common [Azure Resource Manager REST API](https://docs.microsoft.com/rest/api/searchmanagement/).

The Resource Manager API is used for general-purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. To create and manage Azure Cognitive Search services in your subscription, make sure your HTTP request includes the Resource Manager endpoint, subscription ID, provider (in this case, Azure Cognitive Search), and the search service-specific operation.

## Endpoint

The endpoint for service administration operations is the URL of Azure Resource Manager: `https://management.azure.com`.

Note that all management API calls must include the subscription ID.

## Version

- Stable versions

    - `2015-08-19` (Latest): [Reference](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19).
    - `2015-02-28`: [Reference](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/stable/2015-02-28).

- Preview versions

    - `2019-10-01-Preview`: [Reference](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/search/resource-manager/Microsoft.Search/preview/2019-10-01-preview).
    
        - Support for IP access control and Azure Private Endpoint
        - Available in following regions:

            - East US 2 EUAP
            - West US 2
            - West Central US
            - East US
            - South Central US

## Authentication and Access Control

The Azure Cognitive Search Management REST API is an extension of the Azure Resource Manager and shares its dependencies. As such, Active Directory is a prerequisite to service administration of Azure Cognitive Search. All administrative requests from client code must be authenticated using Azure Active Directory before the request reaches the Resource Manager.

Note that if your application code handles *service administration operations* as well as *data operations* on search indexes or documents, you'll be using two authentication approaches for each of the Azure Cognitive Search service APIs:

-   Service and key administration, due to the dependency on Resource Manager, relies on Active Directory for authentication.

-   Data requests against the Azure Cognitive Search service endpoint, such as [Create Index &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/create-index) or [Search Documents &#40;Azure Cognitive Search REST API&#41;](https://docs.microsoft.com/rest/api/searchservice/search-documents), use an `api-key` in the request header. See [Azure Cognitive Search REST APIs](https://docs.microsoft.com/rest/api/searchservice/) for information about authenticating a data request.

Authentication documentation for Resource Manager can be found at [Use Resource Manager authentication API to access subscriptions](https://docs.microsoft.com/azure/azure-resource-manager/resource-manager-api-authentication).

Access control for Azure Resource Manager uses the built-in Owner, Contributor, and Reader roles. By default, all service administrators are members of the Owner role. For details, see [Role-based access control in the Azure portal](https://docs.microsoft.com/azure/search/search-security-rbac).

## Next steps

Visit these links for more information about service and index administration:

- [Service administration using the portal](https://docs.microsoft.com/azure/search/search-manage)
- [PowerShell administration](https://docs.microsoft.com/azure/search/search-manage-powershell)
- [Monitoring Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-monitor-usage)
- [Deployment strategies and best practices](https://docs.microsoft.com/azure/search/search-performance-optimization)
- [Scale an Azure Cognitive Search service](https://docs.microsoft.com/azure/search/search-capacity-planning)
