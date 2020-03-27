---
ms.assetid: 7b406a24-3966-484a-b926-af54421b1dc1
title: "Azure Cosmos DB: REST Resource Provider for Core (SQL) API"
ms.date: "03/27/2020"
ms.service: cosmos-db
author: markjbrown
ms.author: mjbrown
service_description: Azure Cosmos DB is a distributed NoSQL database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA.
---

# Azure Cosmos DB: REST Resource Provider for the Core (SQL) API

[Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/) is a distributed NoSQL database service designed to enable you to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA. The Resource Provider REST API enables you to manage your SQL API account and keys programmatically. Do you want to manage your SQL API database, collection, and documents via REST? If so, see [REST API Reference](https://docs.microsoft.com/rest/api/cosmos-db/).

The Resource Provider API requires all requests to be versioned. To make a request, you must specify the version that you want to use for that operation. The latest  supported version is 2020-03-01.

## Authorization Token

All Azure Resource Manager REST calls require a valid authorization token in the request header to succeed. See  [Create the request: Acquire an access token](~/index.md#create-the-request) for details on how to obtain this authorization token.

## REST Operation Groups

| Operation Group | Description |
|-----------------|-------------|
|[Database Accounts](~/docs-ref-autogen/cosmos-db-resource-provider/databaseaccounts.yml)| Provides operations to manage Azure Cosmos DB accounts, including key management, and failover region priority changes for geo-distributed accounts. |
|[Core (SQL) API Resources](~/docs-ref-autogen/cosmos-db-resource-provider/sqlresources.yml)| Provides operations to manage Azure Cosmos DB accounts for Core (SQL) API including managing database and container resources and setting throughput. |
|[Cassandra API Resources](~/docs-ref-autogen/cosmos-db-resource-provider/cassandraresources.yml)| Provides operations to manage Azure Cosmos DB accounts for Cassandra API including managing keyspace and table resources and setting throughput. |
|[MongoDB API Resources](~/docs-ref-autogen/cosmos-db-resource-provider/mongodbresources.yml)| Provides operations to manage Azure Cosmos DB accounts for MongoDB API including managing database and collection resources and setting throughput. |
|[Gremlin API Resources](~/docs-ref-autogen/cosmos-db-resource-provider/gremlinresources.yml)| Provides operations to manage Azure Cosmos DB accounts for Gremlin API including managing database and graph resources and setting throughput. |
|[Table API Resources](~/docs-ref-autogen/cosmos-db-resource-provider/tableresources.yml)| Provides operations to manage Azure Cosmos DB accounts for Table API including managing table resources and setting throughput. |

## See Also

- [Azure Cosmos DB](https://azure.microsoft.com/services/cosmos-db/)
- [Azure Cosmos DB REST API](https://docs.microsoft.com/rest/api/cosmos-db/)
