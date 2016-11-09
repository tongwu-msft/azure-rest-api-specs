---
title: "Databases"
ms.custom: ""
ms.date: "2016-02-16"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 575036a3-9192-4918-ab61-d0a7d8ede8ba
caps.latest.revision: 9
author: "mimig1"
ms.author: "mimig"
manager: "jhubbard"
robots: noindex,nofollow
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
  The DocumentDB REST API supports basic CRUD operations on the resources under a database account. This topic outlines the operations that can be executed on a DocumentDB database.  
  
 Each DocumentDB account supports multiple independent named databases. A database is a logical container of document storage, partitioned across collections. A database is also a container of users. It is a system resource and thus contains a fixed schema representing the construct of a database. The database resource is represented by **dbs** in the [DocumentDB resource model](http://azure.microsoft.com/documentation/articles/documentdb-resources/). Here’s an example of the URI: https://mydbaccount.documents.azure.com/dbs.  
  
 The following example illustrates the JSON construct of a database:  
  
```  
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
|id|Required. This is the only [user settable property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). It is a unique name that identifies the database, i.e. no two databases will share the same name in an account. The name must not exceed 255 characters.|  
|_rid|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the database.|  
|_ts|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|_self|This is a system generated property. It is the unique addressable URI for the resource.|  
|_etag|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
|_colls|This is a system generated property that specifies the addressable path of the **collections** resource.|  
|_users|This is a system generated property that specifies the addressable path of the **users** resource.|  
  
## Tasks  
 You can do the following with databases:  
  
-   [Create a Database](create-a-database.md)  
  
-   [List Databases](list-databases.md)  
  
-   [Get a Database](get-a-database.md)  
  
-   [Delete a Database retired](delete-a-database1.md)  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  