---
ms.assetid: 771a0ae3-24b4-4e7b-b591-7630019ed1f6
ms.title: Search Management
ms.prod: azure
ms.service: search
author: HeidiSteen
ms.author: heidist
ms.manager: jhubbard
service_description: To be added
---

# Search Management

Azure Search provides a REST API used with [Azure Resource Manager](http://msdn.microsoft.com/library/azure/dn790568.aspx) to provision and administer a search service in your Azure subscription. To manage your search service programmatically, specify the ARM endpoint `https://management.azure.com` with a search management operation:

~~~~
GET  https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2015-08-19
~~~~

You can use [.NET](https://aka.ms/search-mgmt-sdk) or [PowerShell](https://azure.microsoft.com/documentation/articles/search-manage-powershell/) for search management, or write code that includes an HTTP client.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Admin Keys](../../docs-ref-autogen/searchmanagement/AdminKeys.json)  | Create or refresh admin api-keys providing read-write access to a service. |
| [Query Keys](../../docs-ref-autogen/searchmanagement/QueryKeys.json)  | Create, delete, or list query api-keys providing read-only access to a service from a calling application. |
| [Services](../../docs-ref-autogen/searchmanagement/Services.json)  | Create, update, delete, or list search services in your Azure subscription, or check that a candidate search service name is available for use. |

## See Also

- [How to use the search management API](search-howto-management-rest-api.md)
- [Azure Search documentation](https://azure.microsoft.com/documentation/services/search/)
- [Search Service REST](~/docs-ref-conceptual/searchservice/index.md)   
