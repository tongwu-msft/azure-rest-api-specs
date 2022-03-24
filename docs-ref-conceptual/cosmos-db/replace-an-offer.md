---
title: "Replace an Offer - Azure Cosmos DB REST API"
description: Learn how to replace an offer's properties by using a REST API request, the request and response object formats for this operation. 
ms.date: "08/06/2020"
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
  To replace an entire offer resource, perform a PUT operation on the specific offer resource. To learn more about the maximum and minimum provisioned throughput that can be set on a container or a database, see the [Provision throughput on containers and databases](/azure/cosmos-db/set-throughput) article. 
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|`https://{databaseaccount}.documents.azure.com/offers/{_rid-offer}`|{databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription. The {_rid-offer} value is the system-generated resource ID of the offer.|  

> [!TIP]
> To find the _rid of the offer associated with a database or collection, first [GET the database](get-a-database.md) or [GET the collection](get-a-collection.md) and note the _rid property of the resource. Then, [query the offers](querying-offers.md) to find the _rid-offer that corresponds to the database or collection's _rid. Typically, a database _rid is length 8, a collection _rid is length 12, and an offer _rid is length 4.
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests  
  
### Body  
  
|Property|Required|Description|  
|--------------|--------------|-----------------|  
|**offerVersion**|Required|It can be V1 for the [legacy S1, S2, and S3 levels](/azure/cosmos-db/performance-levels) and V2 for [user-defined throughput levels](/azure/cosmos-db/set-throughput) (recommended).
|**offerType**|Optional|This property is only applicable in the V1 offer version. Set it to S1, S2, or S3 for V1 offer types. It is invalid for user-defined performance levels or provisioned throughput based model.|  
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
| 429 Too Many Requests | The replace offer is throttled because the offer scale down operation is attempted within the idle timeout period, that is 4 hours. Refer to the "x-ms-retry-after-ms response" header to see how long you should wait before retrying this operation. |
  
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
  
## Example 1  
This example shows how to change the manual throughput (RU/s) of a collection to 1000 RU/s.
```  
PUT https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1 

x-ms-date: Tue, 29 Mar 2016 17:50:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dRdNwi9H3molMOsEoHXCUHa56N8U5eFDlfuewcSoiHgc%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
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
    "offerThroughput": 1000 
   }, 
  "offerResourceId": "rgkVAMHcJww="  
}  
  
```  
Below is a sample response. 
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
  "offerVersion": "V2",
  "_rid": "uT2L",  
  "content": {  
    "offerThroughput": 1000
  },
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",  
  "_self": "offers/uT2L/",  
  "_etag": "\"0000a900-0000-0000-0000-56fac05a0000\"",  
  "_ts": 1459273818  
}  
  
```
## Example 2 
This example shows how to change the max throughput (RU/s) of an offer with autoscale throughput to 8000 RU/s (scales between 800 - 8000 RU/s)

```
PUT https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1

x-ms-version: 2018-12-31
x-ms-date: Thu, 23 Jul 2020 00:04:41 GMT
authorization: type%3dmaster%26ver%3d1.0%26sig%3dRdNwi9H3molMOsEoHXCUHa56N8U5eFDlfuewcSoiHgc%3d  
Accept: application/json
Content-Type: application/json
User-Agent: contoso/1.0
Host: querydemo.documents.azure.com:443
Connection: keep-alive
Content-Length: 278

{   
  "offerVersion": "V2",   
  "offerType": "Invalid",   
  "content": {   
    "offerAutopilotSettings": {"maxThroughput": 8000}
  },
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww="  
  "id": "uT2L",  
  "_rid": "uT2L"
}
```

## Example 3 
This example shows how to migrate an offer with manual throughput to autoscale throughput. The header ``x-ms-cosmos-migrate-offer-to-autopilot`` with value ``true`` is required.

When migrating, Azure Cosmos DB automatically determines the new autoscale max RU/s based on the current resource settings. The `maxThroughput` property in the response object represents the default autoscale max RU/s set by the system.

In the body, the ``content`` property with a defined ``offerThroughput`` is required, but the value will be ignored by the service. The following example uses -1.

After the change is complete, you can follow [Example 2](#example-2) to change the autoscale max RU/s to a custom value.

[Learn more about migrating to autoscale](/azure/cosmos-db/autoscale-faq#how-does-the-migration-between-autoscale-and-standard-manual-provisioned-throughput-work).


```
PUT https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1

x-ms-version: 2018-12-31
x-ms-date: Wed, 22 Jul 2020 23:33:41 GMT
authorization: type%3dmaster%26ver%3d1.0%26sig%3dRdNwi9H3molMOsEoHXCUHa56N8U5eFDlfuewcSoiHgc%3d  
Accept: application/json
x-ms-cosmos-migrate-offer-to-autopilot: true
Content-Type: application/json
User-Agent: contoso/1.0  
Host: querydemo.documents.azure.com  
Connection: keep-alive
Content-Length: 254

{   
  "offerVersion": "V2",   
  "offerType": "Invalid",   
  "content": {   
    "offerThroughput": -1  
  },
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",   
  "_rid": "uT2L"
}
```
Below is a sample response body. 

The property `maxThroughput` represents the autoscale max RU/s set by the system. The property `offerThroughput` represents the RU/s the system is currently scaled to.
```
{
    "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
    "offerType": "Invalid",
    "offerResourceId": "rgkVAMHcJww=",
    "offerVersion": "V2",
    "content": {
        "offerThroughput": 400,
        "offerIsRUPerMinuteThroughputEnabled": false,
        "offerMinimumThroughputParameters": {
            "maxThroughputEverProvisioned": 4000,
            "maxConsumedStorageEverInKB": 0
        },
        "offerLastReplaceTimestamp": 1595460122,
        "offerAutopilotSettings": {
            "maxThroughput": 4000
        }
    },
    "id": "uT2L",
    "_rid": "uT2L",
    "_self": "offers/uT2L/",
    "_etag": "\"2d002059-0000-0800-0000-5f18cbf80000\"",
    "_ts": 1595460600
}
```

## Example 4
This example shows how to migrate an offer with autoscale throughput to manual throughput. The header ``x-ms-cosmos-migrate-offer-to-manual-throughput`` with value ``true`` is required.

When migrating, Azure Cosmos DB automatically determines the new manual throughput (RU/s) based on the current resource settings. After the change is complete, you can follow [Example 1](#example-1) to change the manual RU/s to a custom value.


In the body, the ``content`` property with a defined ``offerAutopilotSettings`` and ``maxThroughput`` is required, but the value will be ignored by the service. Below we pass in -1.

[Learn more about migrating to manual throughput](/azure/cosmos-db/autoscale-faq.md#how-does-the-migration-between-autoscale-and-standard-manual-provisioned-throughput-work).

```
PUT https://querydemo.documents.azure.com/offers/uT2L HTTP/1.1  
x-ms-version: 2018-12-31
x-ms-date: Wed, 22 Jul 2020 23:43:03 GMT
authorization: type%3dmaster%26ver%3d1.0%26sig%3dRdNwi9H3molMOsEoHXCUHa56N8U5eFDlfuewcSoiHgc%3d  
Accept: application/json
x-ms-cosmos-migrate-offer-to-manual-throughput: true
Content-Type: application/json
User-Agent: contoso/1.0  
Host: querydemo.documents.azure.com
Connection: keep-alive
Content-Length: 280

{
  "offerVersion": "V2",
  "offerType": "Invalid",
  "content": {
    "offerAutopilotSettings": {"maxThroughput": -1}
  },
  "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
  "offerResourceId": "rgkVAMHcJww=",  
  "id": "uT2L",
  "_rid": "uT2L"
}
```
Below is a sample response body. The property ``offerThroughput`` represents the manual throughput (RU/s) set on the resource.

```
{
    "resource": "dbs/rgkVAA==/colls/rgkVAMHcJww=/",  
    "offerType": "Invalid",
    "offerResourceId": "rgkVAMHcJww=",
    "offerVersion": "V2",
    "content": {
        "offerThroughput": 4000,
        "offerIsRUPerMinuteThroughputEnabled": false,
        "offerMinimumThroughputParameters": {
            "maxThroughputEverProvisioned": 4000,
            "maxConsumedStorageEverInKB": 0
        },
        "offerLastReplaceTimestamp": 1595461384
    },
    "id": "uT2L",
    "_rid": "uT2L",
    "_self": "offers/uT2L/",
    "_etag": "\"2d002359-0000-0800-0000-5f18cf080000\"",
    "_ts": 1595461384
}
```

## Remarks

When you are changing the manual or autoscale throughput on a database or container, the system enforces constraints on the RU/s that can be set on the resource. To learn more about the minimum and maximum provisioned throughput (RU/s) that can be set with manual throughput, see the [Provision throughput on containers and databases](/azure/cosmos-db/set-throughput) article. To learn about the minimum autoscale max RU/s you can set, see the [autoscale FAQ](/azure/cosmos-db/autoscale-faq.md#can-i-change-the-max-rus-on-the-database-or-container).
 
To retrieve the minimum throughput that can be set on database or container, perform GET on the offer resource. The response header `x-ms-cosmos-min-throughput` denotes the system determined minimum throughput. This represents the minimum value you can set for the RU/s on a resource with manual throughput, or the minimum value you can set for the autoscale max RU/s on a resource with autoscale throughput. 
  
## See Also  
* [Azure Cosmos DB](/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
