---
ms.assetid: 7b406a24-3966-484a-b926-af54421b1dc1
ms.title: "Azure Cosmos DB: REST Resource Provider for DocumentDB API"
ms.prod: azure
ms.service: cosmos-db
author: mimig1
ms.author: mimig
ms.manager: jhubbard
service_description: Azure Cosmos DB is a globally distributed database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA.
---

# Azure Cosmos DB: REST Resource Provider for the DocumentDB API

[Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/) is a globally distributed database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA. The Resource Provider REST API enables you to manage your DocumentDB API account and keys programmatically. Do you want to manage your DocumentDB API database, collection, and documents via REST? If so, see [DocumentDB REST API Reference](https://docs.microsoft.com/rest/api/documentdb/).

The Resource Provider API requires all requests to be versioned. To make a request, you must specify the version that you want to use for that operation. The currently supported version is 2015-05-08.

## Authorization Token
All Azure Resource Manager REST calls require a valid authorization token in the request header to succeed. See  [Create the request: Acquire an access token](~/index.md#create-the-request) for details on how to obtain this authorization token.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Database Accounts](~/docs-ref-autogen/documentdbresourceprovider/databaseaccounts.json)| Provides operations to manage Azure Cosmos DB accounts, including key management, and failover region priority changes for geo-distributed accounts. |


## See Also

- [Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/)
- [Azure Cosmos DB REST API](https://docs.microsoft.com/rest/api/documentdb/)
