---
title: "Offers"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c2f6c2eb-de00-4dea-9c2a-11950a1347da
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
# Offers
  The DocumentDB REST API supports basic CRUD operations on the resources under a database account. This topic outlines the operations that can be executed on a DocumentDB offer.  
  
 Each DocumentDB collection is provisioned with an associated performance level represented as an **Offer** resource in the REST model. DocumentDB supports offers representing both user-defined performance levels and pre-defined performance levels. Each offer has an associated request unit (RU) rate limit. This is the throughput that will be reserved for a collection based on its performance level, and is available for use by that collection exclusively.  
  
||Details|Throughput Limits|Storage Limits|Version|APIs|  
|-|-------------|-----------------------|--------------------|-------------|----------|  
|User-defined performance|Storage metered based on usage in GB.<br /><br /> Throughput in units of 100 RU/s|Unlimited. 400 - 250,000 request units/s by default (higher by request)|Unlimited. 250 GB by default (higher by request)|V2|API 2015-12-16 and newer|  
|Pre-defined performance|10 GB reserved storage.<br /><br /> S1 = 250 RU/s, S2 = 1000 RU/s, S3 = 2500 RU/s|2500 RU/s|10 GB|V1|Any|  
  
The offer resource is represented by offers in the DocumentDB resource model. Here’s an example of the URI: https://mydbaccount.documents.azure.com/offers.  
  
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
  
 The following example illustrates the JSON construct of an offer with pre-defined throughput (V1):  
  
```  
{  
  "offerVersion": "V1",  
  "_rid": "4P74",  
  "offerType": "S2",  
  "resource": "dbs/LfcsAA==/colls/LfcsAIZufQw=/",  
  "offerResourceId": "LfcsAIZufQw=",  
  "id": "4P74",  
  "_self": "offers/4P74/",  
  "_etag": "\"00009700-0000-0000-0000-56fa9ac20000\"",  
  "_ts": 1459264194  
}  
  
```  
  
|Property|Description|  
|--------------|-----------------|  
|**offerVersion**|**Required**. This can be V1 for pre-defined throughput levels and V2 for user-defined throughput levels.|  
|**offerType**|**Required**. This is a user settable property, which must be set to S1, S2, or S3 for pre-defined performance levels, and Invalid for user-defined performance levels.|  
|**content**|**Required** for V2. Contains information about the offer – for V2 offers, this contains the throughput of the collection.|  
|**resource**|**Required**. When creating a new collection, this property is set to the self-link of the collection e.g. dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**|**Required**. During creation of a collection, this property is automatically associated to the resource id, i.e. **_rid** of the collection.  In the example above, the **_rid** for the collection is  pLJdAOlEdgA=.|  
|**id**|This is a system generated property. The **id** for the offer resource is automatically generated when it is created. It has the same value as the **_rid** for the offer.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
 **Properties of Content**  
  
|Property|Description|  
|--------------|-----------------|  
|**offerThroughput**|**Required**. The provisioned throughput in request units per second as a number. Must be in multiple of 100.<br /><br /> For partitioned collections (with a partition key in the definition), this can be between 10,100 and 250,000 request units per second or higher by request.<br /><br /> For single-partition collections (without a partition key in the definition), this can be between 400 and 10,000 request units per second.|  
  
## Tasks  
 You can do the following with offers:  
  
-   [Get an Offer](get-an-offer.md)  
  
-   [List Offers](list-offers.md)  
  
-   [Replace an Offer](replace-an-offer.md)  
  
-   [Querying Offers](querying-offers.md)  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  