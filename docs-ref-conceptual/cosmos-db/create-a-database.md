---
title: "Create a Database - Azure Cosmos DB REST API"
description: Create database REST API syntax. Request and response headers, body, status codes and examples.
ms.date: "04/20/2021"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 44241df4-7d91-4236-ad56-5c57ba3f449b
caps.latest.revision: 10
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
# Create Database
The `Create Database` operation creates a new database in the database account.

> [!NOTE]
> These API reference articles shows how to create resources using the Azure Cosmos DB data plane API. With the data plane API you can configure basic options such as indexing policy, partition keys much like you can with Cosmos DB SDKs. If you require complete feature support for all Azure Cosmos DB resources, we recommend using the [Cosmos DB Resource Provider](../cosmos-db-resource-provider/index.md).
  
## Request  
  
|Method|Request URI|Description|  
|-|-|-|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs`|The {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  

|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**x-ms-offer-throughput**|Optional|Number|The user specified manual throughput (RU/s) for the database expressed in units of 100 request units per second. The minimum is 400 up to 1,000,000 (or higher by requesting a limit increase).<br /><br /> Only one of `x-ms-offer-throughput` or `x-ms-cosmos-offer-autopilot-settings` must be specified. These headers cannot be specified together.|
|**x-ms-cosmos-offer-autopilot-settings**|Optional|JSON|The user specified autoscale max RU/s of the database. The value is a JSON with the property `maxThroughput`. For example: `{"maxThroughput": 4000}`.<br /><br /> Only one of `x-ms-offer-throughput` or `x-ms-cosmos-offer-autopilot-settings` must be specified. These headers cannot be specified together.|   
> [!NOTE]
> If you set throughput on a database, this creates a [shared throughput database](/azure/cosmos-db/set-throughput#set-throughput-on-a-database) where all collections inside it share the provisioned throughput. There is a limit of 25 containers in a shared throughput database. If you do not plan to use a shared throughput database, create a database without setting the above throughput headers. [Learn more](/azure/cosmos-db/set-throughput).

### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|id|Required|String|The user-generated unique name for the database. It is a string that must not be more than 255 characters.|  
  
```  
{  
  "id": "volcanodb2"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](http-status-codes-for-cosmosdb.md).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|Returned when the operation is successful.|  
|400 Bad Request|Returned when the JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|Returned when the ID provided for the new database has been taken by an existing database.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|The user-generated unique name for the database.|  
|**_rid**|It is a [system generated property](/azure/cosmos-db/stored-procedures-triggers-udfs). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the database resource.|  
|**_ts**|It is a system-generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system-generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system-generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_colls**|It is a system-generated property that specifies the addressable path of the collections resource.|  
|**_users**|It is a system-generated property that specifies the addressable path of the users resource.|  
  
```  
{  
    "id": "volcanodb2",  
    "_rid": "CqNBAA==",  
    "_ts": 1449602962,  
    "_self": "dbs\/CqNBAA==\/",  
    "_etag": "\"00000a00-0000-0000-0000-56672f920000\"",  
    "_colls": "colls\/",  
    "_users": "users\/"  
}  
  
```  
  
## Example 1
The following example creates a database.
  
```  
POST https://contosomarketing.documents.azure.com/dbs HTTP/1.1  
x-ms.date: 04/20/2021
authorization: type%3dmaster%26ver%3d1.0%26sig%3dsc0%2fu25RB8wSqbY1%2bUZqTGD0yCQC5KkGOAP%2bgnHFceQ%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 19  
Expect: 100-continue  
  
{"id":"volcanodb2"}  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
etag: "00000a00-0000-0000-0000-56672f920000"  
x-ms-resource-quota: databases=100;  
x-ms-resource-usage: databases=15;  
x-ms-schemaversion: 1.1  
x-ms-quorum-acked-lsn: 859  
x-ms-session-token: 860  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: f171e571-994e-4dc2-b443-7c3d5fa4a293  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:29:21 GMT  
Content-Length: 169  
  
{  
    "id": "volcanodb2",  
    "_rid": "CqNBAA==",  
    "_ts": 1449602962,  
    "_self": "dbs\/CqNBAA==\/",  
    "_etag": "\"00000a00-0000-0000-0000-56672f920000\"",  
    "_colls": "colls\/",  
    "_users": "users\/"  
}  
  
```  

## Example 2

The following example creates a [shared throughput database](/azure/cosmos-db/set-throughput.md#set-throughput-on-a-database) with manual throughput of 400 RU/s. `x-ms-offer-throughput` header is used to set the throughput (RU/s) value. It accepts a number with minimum 400 that increments by units of 100.

```  
POST https://contosomarketing.documents.azure.com/dbs HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:29:22 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dsc0%2fu25RB8wSqbY1%2bUZqTGD0yCQC5KkGOAP%2bgnHFceQ%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
x-ms-offer-throughput = 400
Host: contosomarketing.documents.azure.com  
Content-Length: 19  
Expect: 100-continue  
  
{"id":"volcanodb2"}  
```  
## Example 3
The following example creates a [shared throughput database](/azure/cosmos-db/set-throughput.md#set-throughput-on-a-database) with [autoscale max throughput](/azure/cosmos-db/set-throughput/provision-throughput-autoscale) of 4000 RU/s (scales between 400 - 4000 RU/s). `x-ms-cosmos-offer-autopilot-settings` header is used to set the `maxThroughput`, which is the autoscale max RU/s value. It accepts a number with minimum 4000 that increments by units of 1000.

> [!NOTE]
> To enable autoscale on an existing database or container, or switch from autoscale to manual throughput, see the article [Replace an Offer](replace-an-offer.md).

```
POST https://contosomarketing.documents.azure.com:443/dbs HTTP/1.1 
x-ms-version: 2018-12-31
x-ms-date: Wed, 22 Jul 2020 20:09:50 GMT
authorization: type%3dmaster%26ver%3d1.0%26sig%3dsc0%2fu25RB8wSqbY1%2bUZqTGD0yCQC5KkGOAP%2bgnHFceQ%3d 
Accept: application/json
x-ms-cosmos-offer-autopilot-settings: {"maxThroughput": 4000}
Content-Type: application/json
User-Agent: contoso/1.0
Postman-Token: 81c0a4ac-4b7c-4f98-8d46-8c662969bc7e
Host: contosomarketing.documents.azure.com:443
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
Content-Length: 27

{"id":"volcanodb3"}

```

## See Also  
* [Azure Cosmos DB](/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

