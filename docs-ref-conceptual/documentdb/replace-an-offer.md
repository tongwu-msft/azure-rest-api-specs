---
title: "Replace an Offer"
ms.custom: ""
ms.date: "2016-03-29"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ce8d5627-c71a-4d01-9548-fbc37f04b628
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
# Replace an Offer
  To replace an entire offer resource, perform a PUT operation on the specific user resource. There are two versions of offers currently supported – V1 for pre-defined throughput and V2 for user-defined throughput. You can modify the offer of collection for the following cases:  
  
-   OfferVersion V1: Between offerType values S1, S2, and S3.  
  
-   OfferVersion V2: If your collection is a single-partition collection i.e. created between 400 and 10,000 request units per second, then it can be modified to a value within 400-10,000 request units.  
  
-   OfferVersion V2:  If your collection is a partitioned collection i.e. created between 10,100 and 250,000 request units per second, then it can be modified to a value within 10,100-250,000 request units.  
  
-   Between V1 and V2: You can move between S1, S2, S3 and a V2 offer between 400 and 10,000 request units per second.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|`https://{databaseaccount}.documents.azure.com/offers/{_rid-offer}`|Note that {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription. The {_rid-offer} value is the system generated resource ID of the offer.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests  
  
### Body  
  
|Property|Required|Description|  
|--------------|--------------|-----------------|  
|**offerVersion**|Required|This can be V1 for pre-defined throughput levels and V2 for user-defined throughput levels.|  
|**offerType**|Required|This is a user settable property, which must be set to S1, S2, or S3 for pre-defined performance levels, and Invalid for user-defined performance levels.|  
|**content**|Optional|Contains information about the offer – for V2 offers, this contains the throughput of the collection.|  
|**resource**|Required|When creating a new collection, this property is set to the self-link of the collection e.g. dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**|Required|During creation of a collection, this property is automatically associated to the resource id, i.e. **_rid** of the collection. In the example above, the **_rid** for the collection is pLJdAOlEdgA=.|  
|**id**|Required|This is a system generated property. The **id** for the offer resource is automatically generated when it is created. It has the same value as the **_rid** for the offer.|  
|**_rid**|Required|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
  
```  
{  
  "id": "uT2L",  
  "_rid": "uT2L",  
  "_self": "offers/uT2L/",  
  "_ts": 1459273815,  
  "_etag": "\"0000a600-0000-0000-0000-56fac0570000\"",  
  "offerVersion": "V1",  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerType": "S2",  
  "offerResourceId": "rgkVAMHcJww="  
}  
  
```  
  
## Response  
 Returns the updated offer resource.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|401 Unauthorized|The Authorization or x-ms-date header is not set. 401 is also returned when the Authorization header is set to an invalid authorization token.|  
|404 Not Found|The offer is no longer a resource, i.e. the resource was deleted.|  
  
### Body  
  
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
  
```  
{  
  "offerVersion": "V1",  
  "_rid": "uT2L",  
  "offerType": "S2",  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a900-0000-0000-0000-56fac05a0000\"",  
  "_ts": 1459273818  
}  
  
```  
  
## Example  
  
```  
PUT https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1  
x-ms-date: Tue, 29 Mar 2016 17:50:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dRdNwi9H3molMOsEoHXCUHa56N8U5eFDlfuewcSoiHgc%3d  
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.Documents.Client/1.6.0.0 samples-net/3  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Content-Length: 234  
Expect: 100-continue  
  
{  
  "id": "uT2L",  
  "_rid": "uT2L",  
  "_self": "offers/uT2L/",  
  "_ts": 1459273815,  
  "_etag": "\"0000a600-0000-0000-0000-56fac0570000\"",  
  "offerVersion": "V1",  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerType": "S2",  
  "offerResourceId": "rgkVAMHcJww="  
}  
  
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
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:54:09.213 GMT  
etag: "0000a900-0000-0000-0000-56fac05a0000"  
x-ms-schemaversion: 1.1  
x-ms-quorum-acked-lsn: 8110  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: fa543c39-a64e-44bd-ba9a-c4f313a9d7d4  
x-ms-session-token: M:8111  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 17:50:20 GMT  
  
{  
  "offerVersion": "V1",  
  "_rid": "uT2L",  
  "offerType": "S2",  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a900-0000-0000-0000-56fac05a0000\"",  
  "_ts": 1459273818  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

