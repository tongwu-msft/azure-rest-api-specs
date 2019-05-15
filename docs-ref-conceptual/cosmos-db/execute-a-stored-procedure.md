---
title: "Execute a Stored Procedure - Azure Cosmos DB REST API"
ms.date: "02/25/2016"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: fed94e04-fd7d-4b51-8a21-d896935877a4
caps.latest.revision: 7
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
# Execute a Stored Procedure
  Execute a stored procedure by performing a POST on a stored procedure resource. A stored procedure is a piece of application logic written in JavaScript that is registered and executed against a collection as a single transaction.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|`https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/sprocs/{sproc-name}`|The {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user generated name/ID of the database where the stored procedure resides, not the system generated ID (rid). The {coll-id} value is the name of the collection where the stored procedure resides. The {sproc-name} value is the name of the stored procedure to be executed.|  
  
### Headers  
 See [Common REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all SQL API requests.  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**\< parameters>**|**Required**|Array|An array of the parameters to pass to the stored procedure.|  
  
```  
[“World”]  
```  
  
## Response  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Cosmos DB responses.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**\<response>**|The response from the stored procedure.|  
  
```  
"Hello, World"  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world HTTP/1.1  
x-ms-date: Wed, 09 Dec 2015 18:05:07 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dwG%2f1OgCtY8aoSRprHecXxL%2fewTrqEIPjfCLcHDlVZQA%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Content-Type: application/json  
Host: contosomarketing.documents.azure.com  
Content-Length: 9  
Expect: 100-continue  
  
["World"]  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1/sprocs/sproc_hello_world  
x-ms-content-path: Sl8fALN4sw4=  
x-ms-quorum-acked-lsn: 37  
x-ms-session-token: 37  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 7.3  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 92012d9b-7d0d-4d4e-acd7-3db487c267f9  
Set-Cookie: x-ms-session-token=37; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 18:05:06 GMT  
Content-Length: 14  
  
"Hello, World"  
  
```  
  
## See Also  
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  

