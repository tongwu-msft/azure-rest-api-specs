---
title: "Replace a Permission"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 0d979c7a-00ca-4753-bb84-e081afae2eb5
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
# Replace a Permission
  Performing a PUT operation on a specific permission resource replaces the entire user resource. All user settable properties, the **id**, **permissionMode**, and **resource**, must be submitted in the body to perform the replacement. While all settable properties have to be submitted in the request body, not all properties have to have changes. A new resource token is created upon successful replacement of the permission. The new resource token expires in one hour, which is the default period, unless overridden by using the **x-ms-documentdb-expiry-seconds** header.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PUT|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}/permissions/{permission-name}|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {user-name} value is the name of the user. The {permission-name} value is the name of the permission to be replaced.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-expiry-seconds**|Optional|Integer|The validity period of the resource token returned by the operation. By default, a resource token is valid for one hour. To override the default, set this header with the desired validity period in seconds. The max override value is 18000, which is five hours.|  
  
### Body  
  
|Property|Required|Description|  
|--------------|--------------|-----------------|  
|**id**|Required|This is a unique name that identifies the permission, i.e. no two permissions owned by a user can share the same id. The **id** must not exceed 255 characters|  
|**permissionMode**|Required|The access mode on the resource for the user: **All** or **Read**. **All** provides read, write and delete access to a resource. **Read** restricts the user to read access on the resource.|  
|**resource**|Required|The full addressable path of the resource associated with the permission. For example, dbs/ruJjAA==/colls/ruJjAM9UnAA=/.|  
  
```  
{  
    "id": "another_permission",  
    "permissionMode": "All",  
    "resource": "dbs/volcanodb/colls/volcano1"  
}  
```  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The replace operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes. In addition, 400 is returned when at least one of the settable properties is not in the request body. Please check to ensure all three settable properties are included.|  
|404 Not Found|The user to be replaced is no longer a resource, i.e. the permission was deleted.|  
|409 Conflict|The id provided for the permission has been taken by an existing permission. 409 is also returned when the new permission has already been assigned to another permission for the user.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that represents the resource **etag** required for optimistic concurrency control.|  
|**_token**|This is a system generated resource token for the particular resource and user.|  
  
```  
{  
    "id": "another_permission",  
    "permissionMode": "All",  
    "resource": "dbs/volcanodb/colls/volcano1",  
    "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
    "_ts": 1449605172,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
    "_etag": "\"00000f00-0000-0000-0000-566738340000\"",  
    "_token": "type=resource&ver=1&sig=liT1vyY6rvPBZXRuXNluPA==;A4zwoVw1GcQUSF3N2d1D5J1s3DhN0547KlhdYkkfT5UzGWecIDJf+LInlbYjqgZKwHKrFfeHLJWq0OFfH9KUOaeMCkPPlu8yKNM098las28ClqVNwmi9Ir\/jC3UVFU\/yFQl4z4wiMxxbrCkpnA\/ZsKqmxZ1LAosimPgF4zKvC9isWjgmB1N8+X9pH49wDg62tGkHF0HoSu+KpF7bkjP4VpHfo9u9jV86l7brrOvUYyE=;"  
}  
  
```  
  
## Example  
  
```  
PUT https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions/a_permission HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 20:06:11 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d8PTpiHHJvUq7ra07iWGYpiLJ%2fMyglgJZxfyGKHWjbaQ%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=866  
Content-Length: 554  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "id": "another_permission",  
    "permissionMode": "All",  
    "resource": "dbs/volcanodb/colls/volcano1",  
    "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
    "_ts": 1449604760,  
    "_self": "dbs/volcanodb/users/a_user/permissions/a_permission",  
    "_etag": "\"00000e00-0000-0000-0000-566736980000\"",  
    "_token": "type=resource&ver=1&sig=zv2AYJFeWMhks0Ezv2WVKQ==;x2fUwajIajvwi+vfQ6GHmf82HTK4qppkhRHMk1Nx8ei0g8zuxIBQ6cyu0d3hOV06fC/PdyIj2/bmNCwpfkxFI++QI1eVPP0/tGTQuMPyqNVCCM5t8KFx6rVNUReBHlWNp0y8iAZ3pRvA2Wl6uaE0K7tFQKmPKqUbumYbOMWKk1kDCfCeCF0Qkt7RYUXlmvawFNoYnVRN/mgnpzX23vW63mU/GoeRXnMOI1HXcdrnf4M=;"  
}  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions/a_permission  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
etag: "00000f00-0000-0000-0000-566738340000"  
x-ms-resource-quota: permissions=2000000;  
x-ms-resource-usage: permissions=2;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/users/a_user  
x-ms-content-path: Sl8fAG8cXgA=  
x-ms-quorum-acked-lsn: 866  
x-ms-session-token: 867  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 9.9  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 4b91c955-ebd4-4059-a58e-91c99226f225  
Set-Cookie: x-ms-session-token=867; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/users/a_user  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 20:06:10 GMT  
Content-Length: 581  
  
{  
    "id": "another_permission",  
    "permissionMode": "All",  
    "resource": "dbs/volcanodb/colls/volcano1",  
    "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
    "_ts": 1449605172,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
    "_etag": "\"00000f00-0000-0000-0000-566738340000\"",  
    "_token": "type=resource&ver=1&sig=liT1vyY6rvPBZXRuXNluPA==;A4zwoVw1GcQUSF3N2d1D5J1s3DhN0547KlhdYkkfT5UzGWecIDJf+LInlbYjqgZKwHKrFfeHLJWq0OFfH9KUOaeMCkPPlu8yKNM098las28ClqVNwmi9Ir\/jC3UVFU\/yFQl4z4wiMxxbrCkpnA\/ZsKqmxZ1LAosimPgF4zKvC9isWjgmB1N8+X9pH49wDg62tGkHF0HoSu+KpF7bkjP4VpHfo9u9jV86l7brrOvUYyE=;"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  