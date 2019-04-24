---
title: "Delete a User - Azure Cosmos DB REST API"
ms.date: "02/25/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: 32decb78-36b9-4783-96a1-5dd481f0fa39
caps.latest.revision: 8
author: "SnehaGunda"
ms.author: "sngun"
manager: "kfile"
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
# Delete User
The `Delete User` operation deletes an existing user in a database. 
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|DELETE|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/users/{user-id}|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription.|  
  
### Headers  
See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Cosmos DB requests.  
  
### Body  
None.  
  
## Response  
  
### Headers  
See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|204 No Content|The delete operation was successful.|  
|404 Not Found|The user to be deleted is not found.|  
  
### Body  
None.  
  
## Example  
  
```  
DELETE https://contosomarketing.documents.azure.com/dbs/volcanodb/users/another_user HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:54:15 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d02AiXEjqafG01Xo%2fbKoK41ZuGbQRFeWwXBFlaB%2bQFIg%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 0  
Connection: Keep-Alive  
  
```  
  
```  
HTTP/1.1 204 No Content  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Length: 0  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/users/another_user  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-resource-quota: users=500000;  
x-ms-resource-usage: users=1;  
x-ms-alt-content-path: dbs/volcanodb  
x-ms-content-path: Sl8fAA==  
x-ms-session-token: 864  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 43377faf-90c3-421e-8c49-56a259a31167  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:54:15 GMT  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

