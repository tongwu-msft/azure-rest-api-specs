---
title: "Users - Azure Cosmos DB REST API"
ms.date: "02/12/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 98f97aa4-91e8-4dce-9cf7-6663cc736676
caps.latest.revision: 7
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
---
# Users
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for managing user [resources](/azure/cosmos-db/sql-api-resources) using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  

A user is a logical namespace for scoping permissions on collections, documents, attachment, stored procedures, triggers, and user-defined functions. The user construct lives under a database resource and thus cannot cross the database boundary it is under. The user resource is represented by users in the Azure Cosmos DB REST resource model. It is a system resource, and thus contains a fixed schema.  
  
The following example shows an example JSON representation for a user:  
  
```  
{  
   "id":"JohnSmith@contoso.com",  
   "_rid":"rnYYACFnVAA=",  
   "_ts":1408056023,  
   "_self":"dbs\/rnYYAA==\/users\/rnYYACFnVAA=\/",  
   "_etag":"00004a00-0000-0000-0000-53ed3ad70000",  
   "_permissions":"permissions\/"  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Required. It is the only user settable property. It is a unique name that identifies a user, that is, no two users share the same ID within a database. The name must not exceed 255 characters.|  
|**_rid**|It is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the user resource.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system generated property representing the resource etag required for optimistic concurrency control.|  
|**_permissions**|It is a system generated property denoting the addressable path of the feed of permissions resource.|  
  
## Tasks  
 You can do the following with users:  
  
-   [Create a User](create-a-user.md)  
-   [List Users](list-users.md)  
-   [Get a User](get-a-user.md)  
-   [Replace a User](replace-a-user.md)  
-   [Delete a User](delete-a-user.md)  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

