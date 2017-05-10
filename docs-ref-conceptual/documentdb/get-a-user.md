---
title: "Get a User"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4bc0071b-8832-4aee-8e62-3b56d7667933
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
# Get a User
  To retrieve a specific user resource within a specific database, perform a GET operation on the user.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {user-name} value is the name of the user.|  
  
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
|200 OK|The operation was successful.|  
|404 Not Found|The user is no longer a resource, i.e. the user was deleted.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**id**|The unique user generated name for the user.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the user resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_permissions**|This is a system generated property that specifies the addressable path of the permissions resource.|  
  
```  
{  
    "id": "a_user",  
    "_rid": "Sl8fAFEKCQA=",  
    "_ts": 1449603893,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
    "_etag": "\"00000b00-0000-0000-0000-566733350000\"",  
    "_permissions": "permissions\/"  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:49:05 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3deQXTD1sMkhhn9657uwqO72KCPRDnlQkk0emPfJh0biw%3d  
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
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:34.442 GMT  
etag: "00000b00-0000-0000-0000-566733350000"  
x-ms-resource-quota: users=500000;  
x-ms-resource-usage: users=2;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb  
x-ms-content-path: Sl8fAA==  
x-ms-session-token: 862  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 4b2e6bdd-6cc7-423e-b8b1-32781166e0b1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:49:05 GMT  
Content-Length: 183  
  
{  
    "id": "a_user",  
    "_rid": "Sl8fAFEKCQA=",  
    "_ts": 1449603893,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
    "_etag": "\"00000b00-0000-0000-0000-566733350000\"",  
    "_permissions": "permissions\/"  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
