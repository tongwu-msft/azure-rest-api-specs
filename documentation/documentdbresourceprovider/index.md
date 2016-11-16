---
ms.assetid: 7b406a24-3966-484a-b926-af54421b1dc1
ms.title: Azure DocumentDB Resource Provider REST API reference
ms.prod: azure
ms.service: documentdb
author: mimig1
ms.author: mimig
ms.manager: jhubbard

---

# Azure DocumentDB Resource Provider REST API

[Azure DocumentDB](https://azure.microsoft.com/services/documentdb/) is a fully managed NoSQL database service built for fast and predictable performance, high availability, elastic scaling, global distribution, and ease of development. The Azure DocumentDB Resource Provider REST API enables you to manage your DocumentDB account and keys programmatically. Do you want to manage your DocumentDB database, collection, and documents via REST? If so, see [Azure DocumentDB REST API](https://msdn.microsoft.com/library/azure/dn781481.aspx).

The DocumentDB Resource Provider API requires all requests to be versioned. To make a request, you must specify the version that you want to use for that operation. The currently supported version is 2015-05-08.

> [!TIP]
> The Resource Provider content is also available as a [PDF download](https://aka.ms/docdb-resourceprovider), which includes sample request and response calls. 

## Authorization Token
All Azure Resource Manager REST calls require a valid authorization token in the request header to succeed. See  [Create the request: Acquire an access token](~/api-index/index.md#create-the-request) for details on how to obtain this authorization token.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Database Accounts](~/api-ref/documentdbresourceprovider/databaseaccounts.json)| Provides operations to manage DocumentDB accounts, including key management, and failover region priority changes for geo-distributed accounts. |


## See Also

- [Azure DocumentDB](https://azure.microsoft.com/services/documentdb/)
- [Azure DocumentDB REST API](/rest/api/documentdb)
