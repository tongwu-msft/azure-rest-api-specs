---
title: "List Users"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 75b24c9e-7adc-401a-aa42-dfdfc7d05b36
caps.latest.revision: 13
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
# List Users
  To return a list of the users under a database, performing a GET operation on the users resource of a particular database, i.e. the users URI path.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users`|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid).|  
  
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
|200 Ok|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is the resource ID for the database where the users have been created.|  
|**_count**|This property shows the number of users returned as part of the list operation.|  
|**Users**|This the array containing the users returned as part of the list operation.<br /><br /> Properties of the user resource|  
|**id**|The unique user generated name for the user.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the user resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that represents the resource **etag** required for optimistic concurrency control.|  
|**_permissions**|This is a system generated property that specifies the addressable path of the permissions resource.|  
  
```  
{  
    "_rid": "Sl8fAA==",  
    "Users": [{  
        "id": "a_user",  
        "_rid": "Sl8fAFEKCQA=",  
        "_ts": 1449603893,  
        "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
        "_etag": "\"00000b00-0000-0000-0000-566733350000\"",  
        "_permissions": "permissions\/"  
    }],  
    "_count": 1  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/users HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:47:28 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3due2e%2fHxTsLU%2fEftrjRd176ku%2bKC5efuw8CHzy7B4%2bTc%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:34.442 GMT  
x-ms-resource-quota: users=500000;  
x-ms-resource-usage: users=2;  
x-ms-item-count: 1  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb  
x-ms-content-path: Sl8fAA==  
x-ms-session-token: 862  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: ed9bf479-65fe-48f6-923f-572920b57c21  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:47:28 GMT  
Content-Length: 224  
  
{  
    "_rid": "Sl8fAA==",  
    "Users": [{  
        "id": "a_user",  
        "_rid": "Sl8fAFEKCQA=",  
        "_ts": 1449603893,  
        "_self": "dbs\/Sl8fAA==\/users\/Sl8fAFEKCQA=\/",  
        "_etag": "\"00000b00-0000-0000-0000-566733350000\"",  
        "_permissions": "permissions\/"  
    }],  
    "_count": 1  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  