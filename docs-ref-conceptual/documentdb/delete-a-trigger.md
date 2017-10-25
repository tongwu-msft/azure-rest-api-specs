---
title: "Delete a Trigger - Azure Cosmos DB REST API"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmos-db"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 353a32fd-5d75-450b-af34-dca4bf42ca11
caps.latest.revision: 7
author: "mimig1"
ms.author: "mimig"
manager: "jhubbard"
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
# Delete a Trigger
The `Delete Trigger` operation deletes an existing trigger in a collection. 
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/triggers/{trigger-id}`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription.|  
  
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
|404 Not Found|The trigger to be deleted is not found.|  
  
### Body  
None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers/PostTrigger-UpdateMetaAll HTTP/1.1  
x-ms-session-token: 43  
x-ms-date: Wed, 09 Dec 2015 19:44:56 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d4Soa81DkXWbCrNdUdfsMJqXtr%2buagicTe%2fOMN6YV9tw%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=43  
Content-Length: 0  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/triggers/PostTrigger-UpdateMetaAll  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-resource-quota: triggers=25;  
x-ms-resource-usage: triggers=0;  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 43  
x-ms-session-token: 44  
x-ms-request-charge: 6.29  
x-ms-activity-id: 0b9efb82-979d-438b-91da-88547673772d  
Set-Cookie: x-ms-session-token=44; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
Date: Wed, 09 Dec 2015 19:44:58 GMT  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB: DocumentDB API](https://docs.microsoft.com/azure/cosmos-db/documentdb-introduction)   
* [Azure Cosmos DB SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-sdk-dotnet)   
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
 
  
  

