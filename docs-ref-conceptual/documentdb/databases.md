---
title: "Databases - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "2016-02-16"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 575036a3-9192-4918-ab61-d0a7d8ede8ba
caps.latest.revision: 9
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
# Databases
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a a globally distributed multi-model databases that supports the document, graph, and key-value data models. The content in this section is for creating, querying, and managing database [resources](/azure/cosmos-db/documentdb-resources) using the [DocumentDB API](/azure/cosmos-db/documentdb-introduction) via REST.  
  
Each Azure Cosmos DB account supports multiple independently named databases. A database is a logical namespace for collections, users, and permissions. The database resource is represented by **dbs** in the [Azure Cosmos DB resource model](/azure/cosmos-db/documentdb-resources/). Here’s an example of the URI: https://mydbaccount.documents.azure.com/dbs.
  
Here is a sample representation of a database in Azure Cosmos DB:  
  
```json
{  
  "id":"ContosoDB",  
  "_rid":"rnYYAA==",  
  "_ts":1408056022,  
  "_self":"dbs\/rnYYAA==\/",  
  "_etag":"00004800-0000-0000-0000-53ed3ad60000",  
  "_colls":"colls\/",  
  "_users":"users\/"
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|id|Required. This is the only [user settable property](/azure/cosmos-db/documentdb-resources#system-vs-user-defined-resources). It is a unique name that identifies the database, i.e. no two databases will share the same name in an account. The name must not exceed 255 characters.|  
|_rid|This is a [system generated property](/azure/cosmos-db/documentdb-resources#system-vs-user-defined-resources). The resource ID (**_rid**) is a system-generated identifier.|  
|_ts|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|_self|This is a system generated property. It is the unique addressable URI for the resource.|  
|_etag|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
|_colls|This is a system generated property that specifies the addressable path of the **collections** resource.|  
|_users|This is a system generated property that specifies the addressable path of the **users** resource.|  
  
## Tasks  
 You can do the following with databases:  
  
* [Create a Database](create-a-database.md)  
* [List Databases](list-databases.md)  
* [Get a Database](get-a-database.md)  
* [Delete a Database](delete-a-database.md)
* Query Databases  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/cosmos-db/documentdb-introduction)   
* [Azure Cosmos DB SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

