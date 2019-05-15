---
title: "Create a Stored Procedure - Azure Cosmos DB REST API"
ms.date: "02/25/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 2f46ba51-a361-49c2-8448-3660f1eb790f
caps.latest.revision: 7
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
# Create Stored Procedure
The `Create Stored Procedure` operation creates a new stored procedure in a collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/sprocs|The {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/ID of the database where the stored procedure is created, not the system generated ID (rid). The {coll-id} value is the name of the collection where the stored procedure is created.|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|The user generated unique name for the stored procedure. No two stored procedures can have the same IDs. It is a string that must not be more than 255 characters.|  
|**body**|Required|String|The body of the stored procedure.|  
  
```  
{  
    "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World\");\r\n}",  
    "id": "sproc_1"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The ID provided for the new stored procedure has been taken by an existing stored procedure.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|It is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|It is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|It is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World\");\r\n}",  
    "id": "sproc_1",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAgA==",  
    "_ts": 1449680569,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4CAAAAAAAAgA==\/",  
    "_etag": "\"0600ffe0-0000-0000-0000-56685eb90000\""  
}  
  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs HTTP/1.1  
x-ms-session-token: 28  
x-ms-date: Wed, 09 Dec 2015 17:02:48 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d1puCtXMwS2AOFwQ19Y33nT9LspnXXZIFDnJnh%2b%2bOCKk%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=28  
Content-Length: 171  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World\");\r\n}",  
    "id": "sproc_1"  
}  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "0600ffe0-0000-0000-0000-56685eb90000"  
x-ms-resource-quota: storedProcedures=25;  
x-ms-resource-usage: storedProcedures=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 28  
x-ms-session-token: 29  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 6540fd9a-2428-49d8-b14d-31e7f0af7175  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 17:02:48 GMT  
Content-Length: 354  
  
{  
    "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World\");\r\n}",  
    "id": "sproc_1",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAgA==",  
    "_ts": 1449680569,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4CAAAAAAAAgA==\/",  
    "_etag": "\"0600ffe0-0000-0000-0000-56685eb90000\""  
}  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

