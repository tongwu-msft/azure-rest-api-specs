---
title: "Replace a User"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: cf000996-6e1e-4921-a26c-bd9b765d1e7d
caps.latest.revision: 8
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
# Replace a User
  To replace an entire user resource, perform a PUT operation on the specific user resource. The only replaceable property is the id of the user. This replace operation does not impact the permissions of the user.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database where the user resides, not the system generated id (rid). The {user-name} value is the name of the user to be replaced.|  
  
### Headers  
 See [Common DocumentDB REST request headers](../DocumentDBREST/common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|Provide a new unique name for the user.|  
  
```  
{  
    "id": "another_user"  
}  
```  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](../DocumentDBREST/common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|404 Not Found|The user to be replaced is no longer a resource, i.e. the user was been deleted.|  
|409 Conflict|The id provided for the user has been taken by an existing user.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the user resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|A new resource **etag** is generated.|  
|**_permissions**|This is a system generated property denoting the addressable path of the permissions resource.|  
  
```  
{  
    "id": "another_user",  
    "_rid": "Sl8fAFEKCQA=",  
    "_ts": 1449604250,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
    "_etag": "\"00000c00-0000-0000-0000-5667349a0000\"",  
    "_permissions": "permissions\/"  
}  
```  
  
## Example  
  
```  
PUT https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:50:50 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d%2by3RxtfXTgRnAMx2zwCmMFx%2bbKetAvuaGmVYeS1psjE%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 148  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "id": "another_user",  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
etag: "00000c00-0000-0000-0000-5667349a0000"  
x-ms-resource-quota: users=500000;  
x-ms-resource-usage: users=2;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb  
x-ms-content-path: Sl8fAA==  
x-ms-quorum-acked-lsn: 862  
x-ms-session-token: 863  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 8089fc55-a82c-432f-83d2-6a9ad712addd  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:50:51 GMT  
Content-Length: 189  
  
{  
    "id": "another_user",  
    "_rid": "Sl8fAFEKCQA=",  
    "_ts": 1449604250,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
    "_etag": "\"00000c00-0000-0000-0000-5667349a0000\"",  
    "_permissions": "permissions\/"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  