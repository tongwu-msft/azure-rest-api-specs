---
title: "Get an Offer"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1cebdf68-24c9-4c2b-acc3-bc8caf80595f
caps.latest.revision: 8
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
# Get an Offer
  To retrieve an offer resource, perform a GET on the **Offer** resource.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/offers/{_rid-offer}`|Note that {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription. The {_rid-offer} value is the system generated resource ID of the offer.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
 None.  
  
## Response  
 Returns the requested offer resource.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|404 Not Found|The offer is no longer a resource, i.e. the parent collection resource was deleted.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**offerVersion**|**Required**. This can be V1 for pre-defined throughput levels and V2 for user-defined throughput levels.|  
|**offerType**|**Required**. This is a user settable property, which must be set to **S1**, **S2**, or **S3** for pre-defined performance levels, and Invalid for user-defined performance levels.|  
|**content**|**Optional**. Contains information about the offer – for V2 offers, this contains the throughput of the collection.|  
|**resource**|**Required**. When creating a new collection, this property is set to the self-link of the collection e.g. dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**|**Required**. During creation of a collection, this property is automatically associated to the resource id, i.e. **_rid** of the collection. In the example above, the **_rid** for the collection is pLJdAOlEdgA=.|  
|**id**|This is a system generated property.  The **id** for the offer resource is automatically generated when it is created.  It has the same value as the **_rid** for the offer.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
  "offerVersion": "V2",  
  "offerType": "Invalid",  
  "content": {  
    "offerThroughput": 400  
  },  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_rid": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a600-0000-0000-0000-56fac0570000\"",  
  "_ts": 1459273815  
}  
  
```  
  
## Example  
  
```  
GET https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1  
x-ms-date: Tue, 29 Mar 2016 17:50:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dA9Y9JAZylsBHG%2bM1Rdb3PpzO3Fw7kMJbRUJ8Llh2kpo%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0 samples-net/3  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json  
Content-Location: https://querydemo.documents.azure.com/offers/uT2L  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 21:27:20.035 GMT  
etag: "0000a600-0000-0000-0000-56fac0570000"  
x-ms-schemaversion: 1.1  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: bfa5991d-46f5-4c40-b3f0-957fccd8df9e  
x-ms-session-token: M:8110  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 17:50:18 GMT  
  
{  
  "offerVersion": "V2",  
  "offerType": "Invalid",  
  "content": {  
    "offerThroughput": 400  
  },  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_rid": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a600-0000-0000-0000-56fac0570000\"",  
  "_ts": 1459273815  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

