---
title: "Replace a Stored Procedure"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 738a3a0f-d988-4fb0-9259-e2dfbb753b1a
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
# Replace a Stored Procedure
  Performing a PUT operation on a specific stored procedure resource replaces the entire stored procedure resource. All user settable properties, including the id and the body, must be submitted in the body to perform the replacement.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/sprocs/{sproc-name}|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database where the stored procedure will be replaced, not the system generated id (rid). The {coll-id} value is the name of the collection where the stored procedure will be replaced. The {sproc-name} value is the name of the stored procedure to be replaced.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|The user generated unique name for the stored procedure. No two stored procedures can have the same ids. This is a string that must not be more than 255 characters.|  
|**body**|Required|String|The body of the stored procedure.|  
  
```  
{  
    "body": "function (personToGreet) {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, \" + personToGreet);\r\n}",  
    "id": "sproc_hello_world"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|404 Not Found|The stored procedure to be replaced is no longer a resource, i.e. the stored procedure was deleted.|  
|409 Conflict|The id provided for the stored procedure has been taken by an existing stored procedure.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "body": "function (personToGreet) {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, \" + personToGreet);\r\n}",  
    "id": "sproc_hello_world",  
    "_rid": "Sl8fALN4sw4DAAAAAAAAgA==",  
    "_ts": 1449684031,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4DAAAAAAAAgA==\/",  
    "_etag": "\"0600b5e2-0000-0000-0000-56686c3f0000\""  
}  
  
```  
  
## Example  
  
```  
PUT https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world HTTP/1.1  
x-ms-session-token: 36  
x-ms-date: Wed, 09 Dec 2015 18:00:31 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d7G0d%2b6neXwXcfD36WU4lUD97Gk7cgAbrs3iaTKgfd%2bM%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=36  
Content-Length: 371  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "body": "function (personToGreet) {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, \" + personToGreet);\r\n}",  
    "id": "sproc_hello_world"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "0600b5e2-0000-0000-0000-56686c3f0000"  
x-ms-resource-quota: storedProcedures=25;  
x-ms-resource-usage: storedProcedures=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 36  
x-ms-session-token: 37  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 1c4f917f-c34d-41c2-9874-851f033696b2  
Set-Cookie: x-ms-session-token=37; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 18:00:32 GMT  
Content-Length: 388  
  
{  
    "body": "function (personToGreet) {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, \" + personToGreet);\r\n}",  
    "id": "sproc_hello_world",  
    "_rid": "Sl8fALN4sw4DAAAAAAAAgA==",  
    "_ts": 1449684031,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4DAAAAAAAAgA==\/",  
    "_etag": "\"0600b5e2-0000-0000-0000-56686c3f0000\""  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

