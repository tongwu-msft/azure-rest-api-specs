<properties
	pageTitle="How to use the Management REST API (Azure Search) | Microsoft Azure"
	description="Administer your hosted cloud Azure Search service using a Management REST API"
	services="search"
	documentationCenter=""
	authors="HeidiSteen"
	manager="jhubbard"
	editor=""/>

<tags
	ms.service="search"
	ms.devlang="rest-api"
	ms.workload="search"
	ms.topic="article"
	ms.tgt_pltfrm="na"
	ms.date="03/27/2017"
	ms.author="heidist"/>

# How to use the Management REST API (Azure Search)

The Management REST API of Azure Search provides programmatic access to much of the functionality available through the portal, allowing administrators to automate the following operations:

-  Create or delete an Azure Search service
-  Create, regenerate, or retrieve `api-keys` for routine changes to the administrative keys used for authenticating data operations
-  Adjust the scale of an Azure Search service in response to changes in query volume or storage requirements

To fully administer your service programmatically, you will need two APIs: the Management REST API of Azure Search, plus the common [Azure Resource Manager REST API](http://msdn.microsoft.com/library/azure/dn790568.aspx).

The Resource Manager API is used for general purpose operations that are not service specific, such as querying subscription data, listing geo-locations, and so forth. To create and manage Azure Search services in your subscription, make sure your HTTP request includes the Resource Manager endpoint, subscription ID, provider (in this case, Azure Search), and the Search service-specific operation.

## Endpoint

The endpoint for service administration operations is the URL of Azure Resource Manager: `https://management.azure.com`.

Note that all management API calls must include the subscription ID.

## Version

The current version of the Management REST API is `2015-08-19`.

## Authentication and Access Control

The Azure Search Management REST API is an extension of the Azure Resource Manager and shares its dependencies. As such, Active Directory is a prerequisite to service administration of Azure Search. All administrative requests from client code must be authenticated using Azure Active Directory before the request reaches the resource manager.

Note that if your application code handles *service administration operations* as well as *data operations* on search indexes or documents, you'll be using two authentication approaches for each of the Azure Search service APIs:

-   Service and key administration, due to the dependency on Resource Manager, relies on Active Directory for authentication.

-   Data requests against the Azure Search service endpoint, such as [Create Index &#40;Azure Search Service REST API&#41;](https://msdn.microsoft.com/library/azure/dn798941.aspx) or [Search Documents &#40;Azure Search Service REST API&#41;](https://msdn.microsoft.com/library/azure/dn798927.aspx), use an `api-key` in the request header. See [Azure Search Service REST](https://msdn.microsoft.com/library/azure/dn798935.aspx) for information about authenticating a data request.

Authentication documentation for ARM can be found at [Use Resource Manager authentication API to access subscriptions](https://docs.microsoft.com/azure/azure-resource-manager/resource-manager-api-authentication).

Access control for Azure Resource Manager uses the built-in Owner, Contributor, and Reader roles. By default, all service administrators are members of the Owner role. For details, see [Role-based access control in the Azure portal](http://azure.microsoft.com/documentation/articles/role-based-access-control-configure/).

## Next steps

Visit these links for more information about service and index administration:

- [Service administration in Azure Search](https://azure.microsoft.com/documentation/articles/search-manage/)
- [Enable and use traffic analytics](https://azure.microsoft.com/documentation/articles/search-traffic-analytics/)
- [Performance optimization](https://azure.microsoft.com/documentation/articles/search-performance-optimization/)
- [Scale capacity in Azure Search](https://azure.microsoft.com/documentation/articles/search-capacity-planning/)
