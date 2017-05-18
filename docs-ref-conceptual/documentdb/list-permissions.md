---
title: "List Permissions"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 11ab7146-eca8-412a-8274-f7f168e0ca83
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
# List Permissions
  To list the permissions resource of a particular a database, perform a GET operation on the permissions URI path, which returns a list of permissions for the user. All of the resource tokens are recreated for the respective permissions returned as part of the response. The new tokens have the default validity period (one hour) unless it is overridden.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-name}/permissions|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {user-name} value is the name of the user.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-expiry-seconds**|Optional|Integer|The validity period of the resource token returned from the operation. By default, a resource token is valid for one hour. To override the default, set this header with the desired validity period in seconds. The max override value is 18000, which is five hours.|  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|Code|Description|  
|----------|-----------------|  
|200 Ok|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is the resource ID of the user who owns the permissions.|  
|**_count**|This property shows the number of users returned as part of list operation.|  
|**Permissions**|This the array containing the permissions returned as part of the list operation.|  
|**id**|The user generated unique name for the permission.|  
|**permissionMode**|The access mode on the resource for the user: **All** or **Read**. **All** provides read, write, and delete access to a resource. **Read** restricts the user to read access on the resource.|  
|**resource**|The full addressable path of the resource associated with the permission. For example, dbs/ruJjAA==/colls/ruJjAM9UnAA=/.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the user resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that represents the resource **etag** required for optimistic concurrency control.|  
|**_token**|This is a system generated resource token for the particular resource and user.|  
  
```  
{  
    "_rid": "Sl8fAG8cXgA=",  
    "Permissions": [{  
        "id": "a_permission",  
        "permissionMode": "Read",  
        "resource": "dbs/volcanodb/colls/volcano1",  
        "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
        "_ts": 1449604760,  
        "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
        "_etag": "\"00000e00-0000-0000-0000-566736980000\"",  
        "_token": "type=resource&ver=1&sig=lxKlPHeqlIx2\/J02rFs3jw==;20MwFhNUO9xNOuglK9gyL18Mt5xIhbN48pzSq6FaR\/7sKFtGd6GaxCooIoPP6rYxRHUeCabHOFkbIeT4ercXk\/F1FG70QkQTD9CxDqNJx3NImgZJWErK1NlEjxkpFDV5uslhpJ4Y3JBnc72\/vlmR95TibFS0rC\/cdND0uRvoOOWXZYvVAJFKEUKyy3GTlYOxY1nKT313ZCOSUQF7kldjo9DE3XEBf8cct1uNKMILImo=;"  
    }],  
    "_count": 1  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 20:01:24 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dIBouMlVA5x5WqHIydZ0OSYHRPAkwoliqqkAJCCeNhjw%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
x-ms-max-item-count: 3  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/a_user/permissions  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Thu, 26 Nov 2015 06:37:26.906 GMT  
x-ms-resource-quota: permissions=2000000;  
x-ms-resource-usage: permissions=1;  
x-ms-item-count: 1  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/users/a_user  
x-ms-content-path: Sl8fAG8cXgA=  
x-ms-session-token: 866  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: fb0095e8-ab6b-4423-bd6f-7af9f6f6ff68  
Set-Cookie: x-ms-session-token=866; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/users/a_user  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 20:01:58 GMT  
Content-Length: 629  
  
{  
    "_rid": "Sl8fAG8cXgA=",  
    "Permissions": [{  
        "id": "a_permission",  
        "permissionMode": "Read",  
        "resource": "dbs/volcanodb/colls/volcano1",  
        "_rid": "Sl8fAG8cXgBn6Ju2GqNsAA==",  
        "_ts": 1449604760,  
        "_self": "dbs\/Sl8fAA==\/users\/Sl8fAG8cXgA=\/permissions\/Sl8fAG8cXgBn6Ju2GqNsAA==\/",  
        "_etag": "\"00000e00-0000-0000-0000-566736980000\"",  
        "_token": "type=resource&ver=1&sig=lxKlPHeqlIx2\/J02rFs3jw==;20MwFhNUO9xNOuglK9gyL18Mt5xIhbN48pzSq6FaR\/7sKFtGd6GaxCooIoPP6rYxRHUeCabHOFkbIeT4ercXk\/F1FG70QkQTD9CxDqNJx3NImgZJWErK1NlEjxkpFDV5uslhpJ4Y3JBnc72\/vlmR95TibFS0rC\/cdND0uRvoOOWXZYvVAJFKEUKyy3GTlYOxY1nKT313ZCOSUQF7kldjo9DE3XEBf8cct1uNKMILImo=;"  
    }],  
    "_count": 1  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure Cosmos DB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
