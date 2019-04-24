---
title: "Offers - Azure Cosmos DB REST API"
ms.date: "12/13/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: c2f6c2eb-de00-4dea-9c2a-11950a1347da
caps.latest.revision: 9
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
# Offers
[Azure Cosmos DB](/azure/cosmos-db/introduction) is a globally distributed multi-model database that supports the document, graph, and key-value data models. The content in this section is for creating, querying, and managing offers using the [SQL API](/azure/cosmos-db/sql-api-introduction) via REST.  

Each Azure Cosmos DB collection is provisioned with an associated performance level represented as an **Offer** resource in the REST model. Azure Cosmos DB supports offers representing both user-defined performance levels and pre-defined performance levels. Each offer has an associated request unit (RU) rate limit. It is the throughput that is reserved for a collection based on its performance level, and is available for use by that collection exclusively.  
  
The offer resource is represented by offers in the Cosmos DB resource model. Here’s an example of the URI: https://mydbaccount.documents.azure.com/offers.  
  
The following example illustrates the JSON construct of an offer with user-defined throughput (V2):  
  
```  
{  
  "offerVersion": "V2",  
  "offerType": "Invalid",  
  "_rid": "Hu+t",  
  "content": {  
    "offerThroughput": 500  
  },  
  "resource": "dbs/yEcCAA==/colls/yEcCAPX6aAw=/",  
  "offerResourceId": "yEcCAPX6aAw=",  
  "id": "Hu+t",  
  "_self": "offers/Hu+t/",  
  "_etag": "\"00009100-0000-0000-0000-56fa9a1f0000\"",  
  "_ts": 1459264031  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|**offerVersion**|**Required**. `V2` is the current version for request unit-based throughput.|  
|**content**|**Required**. Contains information about the offer – for V2 offers, this contains the throughput of the collection.|  
|**resource**|**Required**. When creating a new collection, this property is set to the self-link of the collection for example, dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**|**Required**. During creation of a collection, this property is automatically associated to the resource ID, that is, **_rid** of the collection. In the example above, the **_rid** for the collection is  pLJdAOlEdgA=.|  
|**ID**|It is a system generated property. The **id** for the offer resource is automatically generated when it is created. It has the same value as the **_rid** for the offer.|  
|**_rid**|It is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
 **Properties of Content**  
  
|Property|Description|  
|--------------|-----------------|  
|**offerThroughput**|**Required**. The provisioned throughput in request units per second as a number. <br/> Must be in multiple of 100, starting at 2500.<br />For collections without a partition key, valid between 400-10000. <br/>|  
  
## Tasks  
 You can do the following with offers:  
  
-   [Get an Offer](get-an-offer.md)  
-   [List Offers](list-offers.md)  
-   [Replace an Offer](replace-an-offer.md)  
-   [Querying Offers](querying-offers.md)  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

