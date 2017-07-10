---
title: "Azure Cosmos DB REST API Reference"
ms.custom: ""
ms.date: "2017-03-02"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f174cfcb-644c-4006-a5e9-2ad30c39b38a
caps.latest.revision: 38
author: "mimig1"
ms.author: "mimig"
manager: "jhubbard"
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
# Azure Cosmos DB: DocumentDB REST API Reference
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a a globally distributed multi-model databases that supports the document, graph, and key-value data models. It supports the [DocumentDB API](/azure/documentdb/documentdb-introduction) for creating, querying, and managing resources. This article is a reference for the DocumentDB REST API.  

The Azure Cosmos DB REST API provides programmatic access to Azure Cosmos DB resources to create, query, and delete databases, document collections, and documents. To perform operations on Azure Cosmos DB resources, you send HTTPS requests with a supported method: `GET`, `POST`, `PUT`, or `DELETE` to an endpoint that targets a resource collection or a specific resource. This section contains information about working with resources by using the REST API. 
  
## Supported REST API Versions
The following table lists the supported REST API versions by the Azure Cosmos DB service. The version must be specified via the `x-ms-version` header in every request. If not specified, the service defaults to the latest version `2017-02-22`.

|Version|Change introduced|Retirement date|  
|-------------|---------------------|-----------------------|  
|2017-02-22|[Consistent prefix](/azure/documentdb/documentdb-consistency-levels)||
|2017-01-19|Lowered minimum throughput for partitioned collections to 2500 RU/s||
|2016-07-11|[Change feed](/azure/documentdb/documentdb-change-feed)||  
|2015-12-16|[Partitioned collections](/azure/documentdb/documentdb-partition-data)||  
|2015-08-06|Upsert||  
|2015-06-03|Order By support||  
|2015-04-08|Cosmos DB general availability||  
|2014-08-21|DocumentDB public preview|February 29th, 2016|  
    

## Cosmos DB Resources  
The following articles describe the supported REST APIs for each resource type. For general information about the resource model, see [Resource model](/azure/documentdb/documentdb-interactions-with-resources) and [Cosmos DB resource URIs](documentdb-resource-uri-syntax-for-rest.md). 
  
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

See [Access control using the DocumentDB API](access-control-on-documentdb-resources.md) for how to authorize requests. For general information about request and response options, see the following articles:

* [Status codes](http-status-codes-for-documentdb.md)  
* [Common request headers](common-documentdb-rest-request-headers.md)  
* [Common response headers](common-documentdb-rest-response-headers.md)  
* [Supported operations](common-tasks-using-the-documentdb-rest-api.md)  

## See Also  
* [Azure Cosmos DB](/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](/azure/documentdb/documentdb-introduction)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

