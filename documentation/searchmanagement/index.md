---
ms.assetid: 771a0ae3-24b4-4e7b-b591-7630019ed1f6
ms.title: Search Management
ms.prod: azure
ms.service: search
author: HeidiSteen
ms.author: heidist
ms.manager: jhubbard
---

# Search Management

Azure Search provides a REST API used with [Azure Resource Manager](http://msdn.microsoft.com/library/azure/dn790568.aspx) to provision and administer a search service in your Azure subscription. To manage your search service programmatically, specify the ARM endpoint `https://management.azure.com` with a search management operation: `PUT   https://management.azure.com/subscriptions/[subscriptionId]/resourceGroups/[resourceGroupName]/providers/Microsoft.Search/searchServices/[serviceName]?api-version=2015-08-19`.

You can [use PowerShell](https://azure.microsoft.com/documentation/articles/search-manage-powershell/) for search management or write code that includes an HTTP client. Currently, the Azure Search.NET SDK does not support service administration.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
| [Admin Keys](./AdminKeys)  | Create or refresh admin api-keys providing read-write access to a service. |
| [Query Keys](./QueryKeys)  | Create or delete query api-query providing read-only access to a service from a calling application. |
| [Services](./Services)  | Create, update, delete, or list search services in your Azure subscription. |

## See Also

- [How to use the search management API](search-howto-management-rest-api.md)
- [Get started with Azure Search management API](http://go.microsoft.com/fwlink/p/?LinkId=516968)
- [Azure Search documentation](https://azure.microsoft.com/documentation/services/search/)
