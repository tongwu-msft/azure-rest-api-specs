---
title: "Azure DocumentDB REST API Reference"
ms.custom: ""
ms.date: "2017-03-02"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
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
---
# Azure DocumentDB REST API Reference
The Azure DocumentDB REST API is a REST-based API that provides programmatic access to DocumentDB resources to create, query, and delete databases, document collections, and documents programmatically. [Azure DocumentDB](https://docs.microsoft.com/azure/documentdb/documentdb-introduction) is a fast and flexible NoSQL database service that is used for storing high-volume transactional and operational data with predictable single-digit millisecond latency for reads and writes. This makes it well-suited for IoT, gaming, retail, and operational logging applications. 

To perform operations on DocumentDB resources, you send HTTPS requests with a supported method: GET, POST, PUT, or DELETE to an endpoint that targets a resource collection or a specific resource. This section contains information about working with resources by using the REST API. 
  
## Supported REST API Versions
The following table lists the supported REST API versions by the Azure DocumentDB service. The version must be specified via the `x-ms-version` header in every request. If not specified, the service defaults to the latest version `2016-07-11`.

|Version|Change introduced|Retirement date|  
|-------------|---------------------|-----------------------|  
|2016-07-11|[Change feed](https://docs.microsoft.com/en-us/azure/documentdb/documentdb-change-feed)||  
|2015-12-16|[Partitioned collections](https://docs.microsoft.com/en-us/azure/documentdb/documentdb-partition-data)||  
|2015-08-06|Upsert||  
|2015-06-03|Order By support||  
|2015-04-08|DocumentDB general availability||  
|2014-08-21|DocumentDB public preview|February 29th, 2016|  
    

## DocumentDB Resources  
The following articles describe the supported REST APIs for each resource type. For general information about DocumentDB resources, see [Interact with DocumentDB Resources](https://docs.microsoft.com/azure/documentdb/documentdb-interactions-with-resources) and [DocumentDB Resource URI Syntax for REST](documentdb-resource-uri-syntax-for-rest.md). 
  
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

See [Access Control on DocumentDB Resources](access-control-on-documentdb-resources.md) for how to authorize requests to DocumentDB. For general information about DocumentDB request and response options, see the following articles:

* [Status Codes for DocumentDB](http-status-codes-for-documentdb.md)  
* [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md)  
* [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md)  
* [Common tasks using the DocumentDB REST API](common-tasks-using-the-documentdb-rest-api.md)  

## See Also  
* [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
