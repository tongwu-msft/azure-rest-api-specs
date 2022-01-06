---
title: "Azure Cosmos DB REST API Reference"
description: Lists different REST API versions for Azure Cosmos DB
ms.date: "04/20/2021"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: f174cfcb-644c-4006-a5e9-2ad30c39b38a
caps.latest.revision: 38
author: "SnehaGunda"
ms.author: "sngun"
manager: "kfile"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
service_description: To be added
---
# Azure Cosmos DB: REST API Reference
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for creating, querying, and managing document resources using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  

The Azure Cosmos DB REST API provides programmatic access to Azure Cosmos DB resources to create, query, and delete databases, document collections, and documents. To perform operations on Azure Cosmos DB resources, you send HTTPS requests with a supported method: `GET`, `POST`, `PUT`, or `DELETE` to an endpoint that targets a resource collection or a specific resource. This section explains how to work with resources by using the REST API.

> [!NOTE]
> These API reference articles shows how to create resources using the Azure Cosmos DB data plane API. With the data plane API you can configure basic options such as indexing policy, partition keys much like you can with Cosmos DB SDKs. If you require complete feature support for all Azure Cosmos DB resources, we recommend using the [Cosmos DB Resource Provider](../cosmos-db-resource-provider/index.md). API reference articles are listed below.

## Supported REST API Versions
The following table lists the supported REST API versions by the Azure Cosmos DB service. The version must be specified via the `x-ms-version` header in every request. If not specified, the service defaults to the latest version `2017-02-22`.

|Version|Change introduced|Retirement date|  
|-------------|---------------------|-----------------------|  
|2018-12-31|[Partitioned collections automatic migration](/azure/cosmos-db/sql/migrate-containers-partitioned-to-nonpartitioned)|
|2018-09-17|[Composite and additional spatial indexing](/azure/cosmos-db/index-policy#composite-indexes)|
|2018-08-31|Dynamic collection scaling improvements|
|2018-06-18|[Multi-region write support](/azure/cosmos-db/how-to-manage-database-account)|
|2017-11-15|Multi-region Strong Consistency|
|2017-05-03|Large partition key|
|2017-02-22|[Consistent prefix](/azure/cosmos-db/consistency-levels)||
|2017-01-19|Lowered minimum throughput for partitioned collections to 2500 RU/s||
|2016-07-11|[Change feed](/azure/cosmos-db/change-feed)||  
|2015-12-16|[Partitioned collections](/azure/cosmos-db/partition-data)||  
|2015-08-06|Upsert||  
|2015-06-03|Order By support||  
|2015-04-08|DocumentDB general availability (now part of Azure Cosmos DB)||  
|2014-08-21|DocumentDB public preview (now part of Azure Cosmos DB)|February 29th, 2016|  
    
## Cosmos DB Resources  
The following articles describe the supported REST APIs for each resource type. For general information about the resource model, see [Resource model](/azure/cosmos-db/sql-api-resources) and [Cosmos DB resource URIs](cosmosdb-resource-uri-syntax-for-rest.md).
  
* [Databases](databases.md)  
* [Collections](collections.md)  
* [Documents](documents.md)  
* [Attachments](attachments.md)  
* [Stored Procedures](stored-procedures.md)  
* [User Defined Functions](user-defined-functions.md)  
* [Triggers](triggers.md)  
* [Users](users.md)  
* [Permissions](permissions.md)  
* [Offers](offers.md)

See [Access control](access-control-on-cosmosdb-resources.md) for how to authorize requests. For general information about request and response options, see the following articles:

* [Status codes](http-status-codes-for-cosmosdb.md)  
* [Common request headers](common-cosmosdb-rest-request-headers.md)  
* [Common response headers](common-cosmosdb-rest-response-headers.md)  
* [Supported operations](common-tasks-using-the-cosmosdb-rest-api.md)  

## See Also  
* [Azure Cosmos DB](/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

