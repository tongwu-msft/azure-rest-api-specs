---
title: "User Defined Functions - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "02/12/2016"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: dc8276d9-62e1-4ec5-a861-05f192c86ace
caps.latest.revision: 6
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
# User Defined Functions
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for managing user-defined function [resources](/azure/cosmos-db/sql-api-resources) (udfs) using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  

A user-defined function (UDF) is a side effect free piece of application logic written in JavaScript. It allows developers to construct a query operator, thus extending the core of the Cosmos DB query language. Like stored procedures, UDFs live in the confines of a collection, thus confining the application logic to the collection.  
  
Similar to stored procedures, the UDFs resource has a fixed schema. The body property contains the application logic. The following example illustrates the JSON construct of a user-defined function.  
  
```  
{  
"id":"simpleTaxUDF",  
"body": "  
function tax(income) {  
        if(income == undefined)   
            throw 'no input';  
        if (income < 1000)   
            return income * 0.1;  
        else if (income < 10000)   
            return income * 0.2;  
        else  
            return income * 0.4;  
    }  
",  
"_rid":"hLEEAI1YjgcBAAAAAAAAgA==",  
"_ts":1408058682,  
"_self":"dbs\/hLEEAA==\/colls\/hLEEAI1Yjgc=\/udfs\/hLEEAI1YjgcBAAAAAAAAgA==\/",  
"_etag":"00004100-0000-0000-0000-53ed453a0000"  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|Required. It is a user settable property. It is a unique name to identify the UDF. The **ID** must not exceed 255 characters.|  
|**body**|Required. It is a user settable property. It is the body of the UDF.|  
|**_rid**|It is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the UDF resource.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
## Tasks  
You can do the following with user-defined functions:  
  
-   [Create a User Defined Function](create-a-user-defined-function.md)  
  
-   [Replace a User Defined Function](replace-a-user-defined-function.md)  
  
-   [List User Defined Functions](list-user-defined-functions.md)  
  
-   [Delete a User Defined Function](delete-a-user-defined-function.md)  
  
For information on how UDFs work, including executing an UDF in a query, see [Cosmos DB programming: Stored procedures, triggers, and UDFs](/azure/cosmos-db/programming/).  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  

