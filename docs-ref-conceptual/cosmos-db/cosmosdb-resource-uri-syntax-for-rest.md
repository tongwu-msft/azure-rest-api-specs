---
title: "Azure Cosmos DB Resource URI Syntax for REST"
ms.custom: ""
ms.date: "03/29/2016"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a29019f2-ca97-4ee8-9a7d-c3a4408f8fdf
caps.latest.revision: 12
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
# Azure Cosmos DB Resource URI Syntax for REST
  The base URI for the rest of the resources is based on the URI endpoint created for the database account name. Using the example above, the URL would be https://contosomarketing.documents.azure.com.  
  
 The following table shows the base URI for each of the resources. The base URL for a resource is composed of the database account name, and a list of resource types and names of the requested resource and its parents.  
  
|**Resources**|**Base URI**|  
|-|-|  
|Database|'https://{databaseaccount}.documents.azure.com/dbs/{db}'|  
|User|'https://{databaseaccount}.documents.azure.com/dbs/{db}/users/{user}'|  
|Permission|'https://{databaseaccount}.documents.azure.com/dbs/{db}/users/{user}/permissions/{perm}'|  
|Collection|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}'|  
|Stored Procedure|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}/sprocs/{sproc}'|  
|Trigger|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}/triggers/{trigger}'|  
|UDF|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}/udfs/{udf}'|  
|Document|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}/docs/{doc}'|  
|Attachment|'https://{databaseaccount}.documents.azure.com/dbs/{db}/colls/{coll}/docs/{doc}/attachments/{attch}'|  
|Offer|'https://{databaseaccount}.documents.azure.com/offers/{offer}'|  
  
 Each allowable operation for the respective resources is discussed in the following operation articles:  
  
-   [Offers](offers.md)  
  
-   [Databases](databases.md)  
  
-   [Users](users.md)  
  
-   [Permissions](permissions.md)  
  
-   [Documents](documents.md)  
  
-   [Collections](collections.md)  
  
-   [Attachments](attachments.md)  
  
-   [Stored Procedures](stored-procedures.md)  
  
-   [User-Defined Functions](user-defined-functions.md)  
  
-   [Triggers](triggers.md)  
  
**See also**  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
  

