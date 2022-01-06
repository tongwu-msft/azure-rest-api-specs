---
ms.assetid: 7b406a24-3966-484a-b926-af54421b1dc1
title: "Azure Cosmos DB Resource Provider REST API"
description: Learn how to run REST API commands on different Azure Cosmos DB resources.
ms.date: 01/05/2022
ms.service: cosmos-db
author: markjbrown
ms.author: mjbrown
service_description: Azure Cosmos DB is a distributed NoSQL database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA.
---

# Azure Cosmos DB Resource Provider REST API

[Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/) is a distributed NoSQL database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA. The Resource Provider REST API enables you to manage your Azure Cosmos DB resources programmatically. 

> [!NOTE]
> These API reference articles shows how to create and manage resources using the Azure Cosmos DB resource provider. The REST API for the Azure Cosmos DB data plane API that allows you to manage SQL API database, collection, and documents can be found at [Data Plane REST API Reference](https://docs.microsoft.com/rest/api/cosmos-db/).

The Resource Provider API requires all requests to be versioned. To make a request, you must specify the version that you want to use for that operation. The latest supported version is in the Reference folder below. For a complete listing of all preview and stable api versions see, [Azure Cosmos DB resource provider swagger spec on GitHub](https://github.com/Azure/azure-rest-api-specs/tree/master/specification/cosmos-db/resource-manager)

## Authorization Token

All Azure Resource Manager REST calls require a valid authorization token in the request header to succeed. See  [Create the request: Acquire an access token](~/index.md#create-the-request) for details on how to obtain this authorization token.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Database Accounts](/rest/api/cosmos-db-resource-provider/2021-10-15/database-accounts)| Provides operations to manage Azure Cosmos DB accounts, including key management, and failover region priority changes for geo-distributed accounts. |
|[Core (SQL) API Resources](/rest/api/cosmos-db-resource-provider/2021-10-15/sql-resources)| Provides operations to manage Azure Cosmos DB accounts for Core (SQL) API including managing database and container resources and setting throughput. |
|[Cassandra API Resources](/rest/api/cosmos-db-resource-provider/2021-10-15/cassandra-resources)| Provides operations to manage Azure Cosmos DB accounts for Cassandra API including managing keyspace and table resources and setting throughput. |
|[MongoDB API Resources](/rest/api/cosmos-db-resource-provider/2021-10-15/mongodb-resources)| Provides operations to manage Azure Cosmos DB accounts for MongoDB API including managing database and collection resources and setting throughput. |
|[Gremlin API Resources](/rest/api/cosmos-db-resource-provider/2021-10-15/gremlin-resources)| Provides operations to manage Azure Cosmos DB accounts for Gremlin API including managing database and graph resources and setting throughput. |
|[Table API Resources](/rest/api/cosmos-db-resource-provider/2021-10-15/table-resources)| Provides operations to manage Azure Cosmos DB accounts for Table API including managing table resources and setting throughput. |

## See Also

- [Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/)
- [Azure Cosmos DB REST API](../cosmos-db/index.md)
