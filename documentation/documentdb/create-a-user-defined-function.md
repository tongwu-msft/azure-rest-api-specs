---
title: "Create a User Defined Function"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5e12ddeb-f275-424b-8e8a-82dc04890216
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
# Create a User Defined Function
  A new UDF can be created under a collection by executing an HTTPS POST request against the URI resource path udfs.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/udfs`|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database where where the UDF will be created, not the system generated id (rid) of the database. The {coll-id} value is the name of the collection where the UDF will be created.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Required|String|This is a unique name to identify the UDF. The **id** must not exceed 255 characters.|  
|**body**|Required|String|This is the body of the UDF.|  
  
```  
{  
    "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
    "id": "simpleTaxUDF"  
}  
  
```  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|201 Created|The operation was successful.|  
|400 Bad Request|The JSON body is invalid. Check for missing curly brackets or quotes.|  
|409 Conflict|The id provided for the new UDF has been taken by an existing UDF.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the UDF resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
    "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
    "id": "simpleTaxUDF",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAYA==",  
    "_ts": 1449687949,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/udfs\/Sl8fALN4sw4BAAAAAAAAYA==\/",  
    "_etag": "\"06003ee4-0000-0000-0000-56687b8d0000\""  
}  
  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/udfs HTTP/1.1  
x-ms-session-token: 37  
x-ms-date: Wed, 09 Dec 2015 19:05:49 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d6OaA6qWdazmZ%2fp5LjSROiDEjquzF5a9YIPFRqLQEenM%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=37  
Content-Length: 287  
Expect: 100-continue  
Connection: Keep-Alive  
  
{  
    "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
    "id": "simpleTaxUDF"  
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
etag: "06003ee4-0000-0000-0000-56687b8d0000"  
x-ms-resource-quota: functions=25;  
x-ms-resource-usage: functions=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 37  
x-ms-session-token: 38  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 2fdee379-7044-4275-a655-5367bf0a3798  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 19:05:51 GMT  
Content-Length: 468  
  
{  
    "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
    "id": "simpleTaxUDF",  
    "_rid": "Sl8fALN4sw4BAAAAAAAAYA==",  
    "_ts": 1449687949,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/udfs\/Sl8fALN4sw4BAAAAAAAAYA==\/",  
    "_etag": "\"06003ee4-0000-0000-0000-56687b8d0000\""  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  