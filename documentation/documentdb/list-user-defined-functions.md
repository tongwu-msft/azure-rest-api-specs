---
title: "List User Defined Functions"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2010560f-f02e-4e25-85c5-bada9dfc682c
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
# List User Defined Functions
  Performing a GET on the UDF resource of a particular database, i.e. the udfs URI path, returns a list of the UDFs in the collection.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/udfs`|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database where the UDFs reside, not the system generated id (rid) of the database. The {coll-id} value is the name of the collection where the UDFs reside.|  
  
### Headers  
 See [Common DocumentDB REST request headers](../DocumentDBREST/common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Body  
 None.  
  
## Response  
  
### Headers  
 See [Common DocumentDB REST response headers](../DocumentDBREST/common-documentdb-rest-response-headers.md) for headers that are returned by all DocumentDB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the UDF resource.|  
|**_count**|The number of UDFs returned.|  
|**UserDefinedFunctions**||  
|**id**|This is a unique name to identify the UDF.|  
|**body**|This is the body of the UDF.|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the UDF resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource etag required for optimistic concurrency control.|  
  
```  
{  
    "_rid": "Sl8fALN4sw4=",  
    "UserDefinedFunctions": [{  
        "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
        "id": "simpleTaxUDF",  
        "_rid": "Sl8fALN4sw4BAAAAAAAAYA==",  
        "_ts": 1449688293,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/udfs\/Sl8fALN4sw4BAAAAAAAAYA==\/",  
        "_etag": "\"060072e4-0000-0000-0000-56687ce50000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/udfs HTTP/1.1  
x-ms-session-token: 39  
x-ms-date: Wed, 09 Dec 2015 19:15:47 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dFwVMfm53ehSj5bK4rVu1PUvwRljDiBqD3PLfv1rkymk%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=39  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/udfs  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Thu, 26 Nov 2015 05:55:14.602 GMT  
x-ms-resource-quota: functions=25;  
x-ms-resource-usage: functions=1;  
x-ms-item-count: 1  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-session-token: 39  
x-ms-request-charge: 1  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 06e8f9c5-00a2-4bb2-8b09-b00b47ddf914  
Set-Cookie: x-ms-session-token=39; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 19:15:48 GMT  
Content-Length: 528  
  
{  
    "_rid": "Sl8fALN4sw4=",  
    "UserDefinedFunctions": [{  
        "body": "function tax(income) {\r\n    if(income == undefined) \r\n        throw 'no input';\r\n    if (income < 1000) \r\n        return income * 0.1;\r\n    else if (income < 10000) \r\n        return income * 0.2;\r\n    else\r\n        return income * 0.4;\r\n}",  
        "id": "simpleTaxUDF",  
        "_rid": "Sl8fALN4sw4BAAAAAAAAYA==",  
        "_ts": 1449688293,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/udfs\/Sl8fALN4sw4BAAAAAAAAYA==\/",  
        "_etag": "\"060072e4-0000-0000-0000-56687ce50000\""  
    }],  
    "_count": 1  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  