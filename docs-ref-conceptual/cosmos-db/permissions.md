---
title: "Permissions - Azure Cosmos DB REST API"
description: Create, query, and manage permissions using REST API. Request and response headers, body, status codes and examples.
ms.date: "02/12/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 7298025b-bcf1-4fc7-9b54-6e7ca8c64f49
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
# Permissions
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for managing permission [resources](/azure/cosmos-db/sql-api-resources) using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  
  
A permission is an authorization token associated with a user for authorized access to a specific resource. It is used to manage access to collections, documents, attachments, stored procedures, triggers, and user-defined functions for a particular user.  
  
You can associate only one permission to a particular resource for a user. For example, MarketingCollection with _rid xynsa== can only be associated with one permission for user JanetSmith@contoso.com. An attempt to add another permission to MarketingCollection for Janet results in an error (409 Conflict).  
  
There are only two permission modes, **All** and **Read.** The **All** mode provides read, write, and delete access to a resource. The **Read** mode provides read-only access to a resource. A resource token is created every time a GET, PUT, or POST is performed on a permission. By default, the validity period of a resource token is one hour. The validity period can be overridden to up to 5 hours. The following example illustrates the JSON construct of a permission:  
  
```  
{  
   "id":"permision2",  
   "permissionMode":"All",  
   "resource":"dbs/ruJjAA==/colls/ruJjAM9UnAA=/",  
   "_rid":"ruJjAFjqQABUp3QAAAAAAA==",  
   "_ts":1408237846,  
   "_self":"dbs/ruJjAA==/users/ruJjAFjqQAA=/permissions/ruJjAFjqQABUp3QAAAAAAA==/",  
   "_etag":"00004900-0000-0000-0000-53f001160000",  
   "_token":"type=resource&ver=1&sig=m32/00W65F8ADb3psljJ0g==;v0kQGihedau1pVGGQmuPgzlEcfsYDWSdfn2kyjDc1qF1aZfPHXzIS/BFMcuZQRUr6C5c5PgiyCSwhiAgZMJne2DorfMbE/GUHmxBLjOnykLARqwn3zpZpz9b2axWtL8+qQFX81nocdEDvBVzFuobyul6QimbmeZ7D6D1K4qJT9feuJkIBfczeAp/sKaSupXEgB3qyih0rej5N6Wv14Gufohh1QTlCRIzK3FqQv4xjcY=;"  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Required. It is a user settable property. It is the unique name that identifies the permission, that is, no two permissions share the same ID within a user. The **ID** must not exceed 255 characters.|  
|**permissionMode**|Required. The access mode on the resource for the user: **All** or **Read**. **All** provides read, write, and delete access to a resource. **Read** restricts the user to read access on the resource.|  
|**resource**|Required. The full addressable path of the resource associated with the permission. For example, dbs/ruJjAA==/colls/ruJjAM9UnAA=/.|  
|**_rid**|It is a [system generated property](/azure/cosmos-db/stored-procedures-triggers-udfs). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
|**_token**|It is a system generated resource token for the particular resource and user.|  
  
## Tasks  
 You can do the following tasks with permissions:  
  
- [Create a Permission](create-a-permission.md)  
- [List Permissions](list-permissions.md)  
- [Get a Permission](get-a-permission.md)  
- [Replace a Permission](replace-a-permission.md)  
- [Delete a Permission](delete-a-permission.md)  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

