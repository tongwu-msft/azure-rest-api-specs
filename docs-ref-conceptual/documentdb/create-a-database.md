---
title: "Create a Database"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 44241df4-7d91-4236-ad56-5c57ba3f449b
caps.latest.revision: 10
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
# Create Database
The `Create Database` operation creates a new database in the database account. 
  
## Request  
  
|Method|Request URI|Description|  
|-|-|-|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|id|Required|String|The user generated unique name for the database. This is a string that must not be more than 255 characters.|  
  
```  
{  
  "id": "volcanodb2"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|Returned when the operation is successful.|  
|400 Bad Request|Returned when the JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|Returned when the id provided for the new database has been taken by an existing database.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|The user generated unique name for the database.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the database resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_colls**|This is a system generated property that specifies the addressable path of the collections resource.|  
|**_users**|This is a system generated property that specifies the addressable path of the users resource.|  
  
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
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:29:22 GMT  
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
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

