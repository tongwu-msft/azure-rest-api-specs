---
title: "Create a Permission"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a64359ed-8eb3-4e7d-90e0-63a4d4710acd
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
# Create a Permission
  A new permission can be created by executing an HTTPS POST request against the URI resource path permissions.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}/permissions|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {user-name} value is the name of the user that owns the permission.|  
  
### Headers  
 See [Common DocumentDB REST request headers](../DocumentDBREST/common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|x-ms-documentdb-expiry-seconds|Optional|Integer|The validity period of the resource token returned by the operation. By default, a resource token is valid for one hour. To override the default, set this header with the desired validity period in seconds. The max override value is 18000, which is five hours.|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|This is a user settable property. It is a unique name to identify the permission, i.e. no two permissions owned by a user can share the same id. The **id** must not exceed 255 characters.|  
|**permissionMode**|Required|String|The access mode for the resource: **All** or **Read**. **All** provides read, write, and delete access to a resource. **Read** restricts the user to read access on the resource.|  
|**resource**|Required|String|The full addressable path of the resource associated with the permission. For example, dbs/ruJjAA==/colls/ruJjAM9UnAA=/.|  
  
```  
{  
    "id": "a_permission",  
    "permissionMode": "Read",  
    "resource": "dbs/volcanodb/colls/volcano1"  
}  
```  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](../DocumentDBREST/common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes. In addition, 400 is returned when at least one of the settable properties is not in the request body. Please check to ensure all three settable properties are included.|  
|409 Conflict|The id provided for the new permission has been taken by an existing permission. 409 is also returned when the new permission is assigned to a resource already associated with another permission for the user.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource id (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the permission resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that represents the resource **etag** required for optimistic concurrency control.|  
|**_token**|This is a system generated resource token for the particular resource and user.|  
  
```  
{  
    "id": "a_permission",  
    "permissionMode": "Read",  
    "resource": "dbs/volcanodb/colls/volcano1",  
    "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
    "_ts": 1449604760,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
    "_etag": "\"00000e00-0000-0000-0000-566736980000\"",  
    "_token": "type=resource&ver=1&sig=4\/IPvcZwC9TnN\/M1gPjuBg==;C1Q5UpZAgytiayVo\/GPAbBklnnRuGqGB2o\/42KTuZfmN4P6a83JP4LU34neSg25\/8Wt5wwINjy6Vf8rr9fG09FxnGX9jHAM+Zzhqyqjt4rv3Dk3pN+sjC0KTE5jDiTkCdAlxHv4TYaTLOnEWdeVUKevuAPFbmUQGSwk9ipjv11BqWPK\/cN4lUujSfRc3rRaI8pgf90p0bD6KBTJlB+0sFjdI3P1hzunNvd9s9CHJ09U=;"  
}  
  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:59:19 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dwBH%2bhvVN5L4fu508ixzH%2bc7pQNfg7meU62MydCoead0%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 87  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "id": "a_permission",  
    "permissionMode": "Read",  
    "resource": "dbs/volcanodb/colls/volcano1"  
}  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 02:25:35.212 GMT  
etag: "00000e00-0000-0000-0000-566736980000"  
x-ms-resource-quota: permissions=2000000;  
x-ms-resource-usage: permissions=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/users/a_user  
x-ms-content-path: Sl8fAG8cXgA=  
x-ms-quorum-acked-lsn: 865  
x-ms-session-token: 866  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 4069f7dc-3863-4ae0-8df8-828bc86d75dc  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:59:21 GMT  
Content-Length: 579  
  
{  
    "id": "a_permission",  
    "permissionMode": "Read",  
    "resource": "dbs/volcanodb/colls/volcano1",  
    "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
    "_ts": 1449604760,  
    "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
    "_etag": "\"00000e00-0000-0000-0000-566736980000\"",  
    "_token": "type=resource&ver=1&sig=4\/IPvcZwC9TnN\/M1gPjuBg==;C1Q5UpZAgytiayVo\/GPAbBklnnRuGqGB2o\/42KTuZfmN4P6a83JP4LU34neSg25\/8Wt5wwINjy6Vf8rr9fG09FxnGX9jHAM+Zzhqyqjt4rv3Dk3pN+sjC0KTE5jDiTkCdAlxHv4TYaTLOnEWdeVUKevuAPFbmUQGSwk9ipjv11BqWPK\/cN4lUujSfRc3rRaI8pgf90p0bD6KBTJlB+0sFjdI3P1hzunNvd9s9CHJ09U=;"  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  