---
title: "Delete a User Defined Function"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 318e2c9c-854e-465c-984e-13aa96c7c9f0
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
# Delete User Defined Function
The `Delete User Defined Function` operation deletes an existing user defined function in a collection. 
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/udfs/{udf-id}`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription.|  
  
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
|204 No Content|The delete operation was successful.|  
|404 Not Found|The user defined function to be deleted is not found.|  
  
### Body  
None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/udfs/simpleTaxUDF HTTP/1.1  
x-ms-session-token: 40  
x-ms-date: Wed, 09 Dec 2015 19:22:08 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d5tDc%2fQMIeHx7GwggxdfjbVv2Lo9i5To15al97tikccI%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=40  
Content-Length: 0  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/udfs/simpleTaxUDF  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-resource-quota: functions=25;  
x-ms-resource-usage: functions=0;  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-session-token: 41  
x-ms-request-charge: 4.95  
x-ms-activity-id: 27e268fd-7b3c-4c97-9239-f70fc380ef37  
Set-Cookie: x-ms-session-token=41; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
Date: Wed, 09 Dec 2015 19:22:09 GMT  
  
```  
  
## See also  
* [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
* [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
* [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net) 
  
  

