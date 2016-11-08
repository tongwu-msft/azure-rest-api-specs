---
title: "List Stored Procedures"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 3d2a982f-93d6-42ae-b085-9ec9586967a9
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
# List Stored Procedures
  Performing a GET on the stored procedures resource of a particular database, i.e. the sprocs URI path, returns a list of the stored procedures in the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/sprocs|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database where the stored procedures reside, not the system generated id (rid). The {coll-id} value is the name of the collection where the stored procedures reside.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the attachment resource.|  
|**_count**|This is the number of stored procedures returned by the list operation.|  
|**StoredProcedures**||  
|**id**|The user generated unique name for the stored procedure. No two stored procedures can have the same ids.|  
|**body**|The body of the stored procedure.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "_rid": "Sl8fALN4sw4=",  
    "StoredProcedures": [{  
        "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World!\");\r\n}",  
        "id": "sproc_hello_world",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAgA==",  
        "_ts": 1449681197,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4CAAAAAAAAgA==\/",  
        "_etag": "\"06003ce1-0000-0000-0000-5668612d0000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs HTTP/1.1  
x-ms-session-token: 30  
x-ms-date: Wed, 09 Dec 2015 17:21:18 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3de2MusUZ1kECqjcd8795sSfUNyWWHZ5Ka4m55GyCuwxg%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=30  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Tue, 08 Dec 2015 03:07:34.686 GMT  
x-ms-resource-quota: storedProcedures=25;  
x-ms-resource-usage: storedProcedures=1;  
x-ms-item-count: 1  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-session-token: 30  
x-ms-request-charge: 1  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: e3c8809f-a2b4-41d2-9955-b931dff240d6  
Set-Cookie: x-ms-session-token=30; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 17:21:20 GMT  
Content-Length: 421  
  
{  
    "_rid": "Sl8fALN4sw4=",  
    "StoredProcedures": [{  
        "body": "function () {\r\n    var context = getContext();\r\n    var response = context.getResponse();\r\n\r\n    response.setBody(\"Hello, World!\");\r\n}",  
        "id": "sproc_hello_world",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAgA==",  
        "_ts": 1449681197,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/sprocs\/Sl8fALN4sw4CAAAAAAAAgA==\/",  
        "_etag": "\"06003ce1-0000-0000-0000-5668612d0000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  