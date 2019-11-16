---
title: "Replace an Offer - Azure Cosmos DB REST API"
ms.date: "03/19/2019"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: ce8d5627-c71a-4d01-9548-fbc37f04b628
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
# Replace an Offer
  To replace an entire offer resource, perform a PUT operation on the specific user resource. There are two versions of offers currently supported – V1 for pre-defined throughput and V2 for user-defined throughput. To learn more about the maximum and minimum provisioned throughput that can be set on a container or a database, see the [Provision throughput on containers and databases](https://docs.microsoft.com/azure/cosmos-db/set-throughput) article.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|`https://{databaseaccount}.documents.azure.com/offers/{_rid-offer}`|{databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription. The {_rid-offer} value is the system-generated resource ID of the offer.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests  
  
### Body  
  
|Property|Required|Description|  
|--------------|--------------|-----------------|  
|**offerVersion**|Required|It can be V1 for pre-defined throughput levels and V2 for user-defined throughput levels.|  
|**offerType**|Optional|This property is only applicable in V1 offer version. A user can explicitly set this property. You should set it to S1, S2, or S3 for pre-defined performance levels, and Invalid for user-defined performance levels.|  
|**content**|Required|Contains information about the offer – for V2 offers, this value contains the throughput of the collection.|  
|**resource**|Required|When creating a new collection, this property is set to the self-link of the collection for example, dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**|Required|During creation of a collection, this property is automatically associated to the resource ID, that is, **_rid** of the collection. In the example above, the **_rid** for the collection is pLJdAOlEdgA=.|  
|**id**|Required|It is a system-generated property. The **ID** for the offer resource is automatically generated when it is created. It has the same value as the **_rid** for the offer.|  
|**_rid**|Required|It is a system-generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
  
```  
{   
  "offerVersion": "V2",   
  "offerType": "Invalid",   
  "content": {   
    "offerThroughput": 4000   
  },   
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",   
  "offerResourceId": "rgkVAMHcJww=",   
  "id": "uT2L",   
  "_rid": "uT2L",   
}   
  
```  
  
## Response  
 Returns the updated offer resource.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|401 Unauthorized|The Authorization or x-ms-date header is not set. 401 is also returned when the Authorization header is set to an invalid authorization token.|  
|404 Not Found|The offer is no longer a resource, that is, the resource was deleted.|  
| 429 Too Many Requests | The replace offer is throttled because the offer scale down operation is attempted within the idle timeout period, that is 4 hours. Refer to the “x-ms-retry-after-ms response” header to see how long you should wait before retrying this operation. |
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**offerVersion**| This value can be V1 for pre-defined throughput levels and V2 for user-defined throughput levels.|  
|**offerType**| Pre-defined performance levels S1, S2, or S3 for V1 Offers. Its set to Invalid for user-defined performance levels.|  
|**content**|  It contains information about the offer. For V2 offers, it contains the throughput of the collection.|  
|**resource**|When creating a new collection, this property is set to the self-link of the collection for example, dbs/pLJdAA==/colls/pLJdAOlEdgA=/.|  
|**offerResourceId**| During creation of a collection, this property is automatically associated to the resource ID, that is, **_rid** of the collection. In the example above, the **_rid** for the collection is  pLJdAOlEdgA=.|  
|**id**|It is a system-generated property. The **ID** for the offer resource is automatically generated when it is created. It has the same value as the **_rid** for the offer.|  
|**_rid**|It is a system-generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the offer.|  
|**_ts**|It is a system-generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system-generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system-generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
  "offerVersion": "V2",  
  "_rid": "uT2L", 
   "content": {  
    "offerThroughput": 4000 
  }, 
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_self": "offers/uT2L/"
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
  "offerVersion": "V2",  
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "content": {  
    "offerThroughput": 4000 
   }, 
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
  "content": {  
    "offerThroughput": 4000 
  }, 
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a900-0000-0000-0000-56fac05a0000\"",  
  "_ts": 1459273818  
}  
  
```

## Remarks 

 To learn more about the maximum and minimum provisioned throughput that can be set on a container or a database, see the [Provision throughput on containers and databases](https://docs.microsoft.com/azure/cosmos-db/set-throughput) article.    
 
Perform GET on the offer resource to retrieve the minimum throughput that could be set for a given container or a database. The response header `x-ms-cosmos-min-throughput` denotes the system determined minimum throughput.
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

