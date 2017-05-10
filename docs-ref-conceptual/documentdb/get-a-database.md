---
title: "Get a Database"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 913ce1db-fe8c-4045-9c65-506b13d716a7
caps.latest.revision: 7
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
# Get a Database
  To retrieve a database resource, perform a GET on the database resource.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}`|Note that {databaseaccount} is the name of the Azure Cosmos DB account you created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid).|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
|404 Not Found|The database is no longer a resource, i.e. the resource was deleted.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|The unique user generated name for the database.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource id (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the database resource.|  
|**_ts**|This is a system generated property. It denotes the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_colls**|This is a system generated property that specifies the addressable path of the collections resource.|  
|**_users**|This is a system generated property that specifies the addressable path of the users resource.|  
  
```  
{  
    "id": "volcanodb",  
    "_rid": "Sl8fAA==",  
    "_ts": 1448049502,  
    "_self": "dbs\/Sl8fAA==\/",  
    "_etag": "\"00000100-0000-0000-0000-564f7b5e0000\"",  
    "_colls": "colls\/",  
    "_users": "users\/"  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:41:22 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d0kZDPXylaMLpTI%2bxJYe7Xk5HiSv%2bX%2bpUGPKBMtY3My8%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:34.442 GMT  
etag: "00000100-0000-0000-0000-564f7b5e0000"  
x-ms-resource-quota: databases=100;  
x-ms-resource-usage: databases=15;  
x-ms-schemaversion: 1.1  
x-ms-session-token: 860  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: d319e186-8e5f-4861-bcd0-59fb249769f3  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:41:21 GMT  
Content-Length: 168  
  
{  
    "id": "volcanodb",  
    "_rid": "Sl8fAA==",  
    "_ts": 1448049502,  
    "_self": "dbs\/Sl8fAA==\/",  
    "_etag": "\"00000100-0000-0000-0000-564f7b5e0000\"",  
    "_colls": "colls\/",  
    "_users": "users\/"  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
