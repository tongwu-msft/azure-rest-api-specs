---
title: "Create a User"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 40d7a257-3969-400f-bd74-25bed982a91b
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
# Create User
The `Create User` operation creates a new stored procedure in a database.
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid).|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|id|Required|String|The user generated unique name for the user. No two users share the same **id** value. This is a string that must not be more than 255 characters.|  
  
```  
{  
    "id": "a_user"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The id provided for the new user has been taken by an existing user.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the user resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_permissions**|This is a system generated property denoting the addressable path of the permissions resource.|  
  
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
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/users HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:44:53 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dkcsSpfnCwqkJEmIonYBaf%2fnRZSKwaQ0nagG7IthW130%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 15  
Expect: 100-continue  
  
{  
    "id": "a_user"  
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
etag: "00000b00-0000-0000-0000-566733350000"  
x-ms-resource-quota: users=500000;  
x-ms-resource-usage: users=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb  
x-ms-content-path: Sl8fAA==  
x-ms-quorum-acked-lsn: 861  
x-ms-session-token: 862  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: f123ec48-72ec-4aad-94bb-915a64f067cc  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:44:54 GMT  
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
 [Azure Cosmos DB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
