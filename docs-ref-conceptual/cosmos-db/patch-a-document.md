---
title: "Patch a Document - Azure Cosmos DB REST API"
description: Patch document REST API syntax. Request and response headers, body, status codes, and examples.
ms.date: "09/11/2021"
ms.service: "cosmos-db"
ms.topic: "reference"
ms.assetid: c341c439-b854-4a5d-8982-448ff5e22f22
caps.latest.revision: 9
author: "sajeetharan"
ms.author: "sasinnat"
manager: "saranyas"
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
# Patch Document
Azure Cosmos DB is a globally distributed multi-model database with support for multiple APIs. This article covers the SQL API for Azure Cosmos DB. 

The `Patch Document` operation does path-level updates to specific files/properties in a single document. 
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|PATCH|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{id}|The {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription. The {db-id} value is the user-generated name/ID of the database, not the system-generated ID (rid). The {coll-id} value is the name of the collection that contains the document. The id is the value of the {id} in the document|  
  
### Headers  
 See [Common Azure Cosmos DB REST request headers](common-cosmosdb-rest-request-headers.md) for headers that are used by all Azure Cosmos DB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**x-ms-documentdb-partitionkey**|Optional|Array|The partition key value for the document to be patched. Must be included if and only if the collection is created with a **partitionKey** definition.|  

### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**operations**|Required|Array|  [Patch supports either a single, or multiple, operations](https://docs.microsoft.com/azure/cosmos-db/partial-document-update#supported-operations) that should be passed as an array |

### Single operation
  
```  
{
  "operations": [
    {
      "op": "set",
      "path": "/Parents/0/FamilyName",
      "value": "Bob"
    }
  ]
}  
```  

### Multiple operations
  
```  
{
   "operations":[
      {
         "op":"add",
         "path":"/Parents/0/ZipCode",
         "value":80000
      },
       {
      "op": "set",
       "path": "/Parents/0/FamilyName",
       "value": "Bob"
      }
   ]
}
```  

### Conditional Patch operation
  
```  
{
   "condition":"from c where c.Address.ZipCode ='98101' ",
   "operations":[
      {
         "op":"replace",
         "path":"/Address/ZipCode",
         "value":98107
      }
   ]
}
```  
  
## Response  
 Returns the body of the patched document.  
  
### Headers  
 See [Common Azure Cosmos DB REST response headers](common-cosmosdb-rest-response-headers.md) for headers that are returned by all Azure Cosmos DB responses.  
  
|Property|Type|Description|  
|--------------|----------|-----------------|  
|**x-ms-request-charge**|Number|The number of request units consumed by the operation.|  
|**x-ms-session-token**|String|A string token used with session level consistency. Clients must save this value and set it for subsequent read requests for session consistency.|  
|**Content-Location**|String|URL of the patch content being passed. 
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 OK|The operation was successful.|  
|400 Bad Request|The JSON body is invalid.|  
|412 Precondition Failed| The specified pre-condition isn't met

  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|It is a system-generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|It is a [system generated property](/azure/cosmos-db/stored-procedures-triggers-udfs). It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|It is a system-generated property that has URI for the resource.|  
|**_etag**|It is a system-generated property that specifies the resource **etag** required for optimistic concurrency control.|  
|**_attachments**|It is a system-generated property that specifies the addressable path for the attachments resource.|  
  
```json
{
    "id": "Andersen.1",
    "LastName": "Andersen",
    "Parents": [
        {
            "FamilyName": "Bob",
            "FirstName": "Thomas"
        },
        {
            "FamilyName": null,
            "FirstName": "Mary Kay"
        }
    ],
    "Children": [
        {
            "FamilyName": null,
            "FirstName": "Henriette Thaulow",
            "Gender": "female",
            "Grade": 5,
            "Pets": [
                {
                    "GivenName": "Fluffy"
                }
            ]
        }
    ],
    "Address": {
        "State": "WA",
        "County": "King",
        "City": "Seattle"
    },
    "IsRegistered": false,
    "_rid": "2pFqAMMTYY8BAAAAAAAAAA==",
    "_self": "dbs/2pFqAA==/colls/2pFqAMMTYY8=/docs/2pFqAMMTYY8BAAAAAAAAAA==/",
    "_etag": "\"00000000-0000-0000-d40e-691edfa901d7\"",
    "_attachments": "attachments/",
    "_ts": 1636313638
}
```  
## Example  
  
```  
PATCH https://querydemo.documents.azure.com/dbs/FamilyDatabase/colls/FamilyContainer/docs/Andersen.1 HTTP/1.1  
x-ms-documentdb-partitionkey: ["Andersen"]  
x-ms-date: Tue, 29 Mar 2016 02:28:29 GMT  
Authorization: type%3dmaster%26ver%3d1.0%26sig%3d92WMAkQv0Zu35zpKZD%2bcGSH%2b2SXd8HGxHIvJgxhO6%2fs%3d
Content-Type:application/json_patch+json
Cache-Control: no-cache  
User-Agent: Microsoft.Azure.DocumentDB/2.16.12  
x-ms-version: 2015-12-16  
Accept: application/json  
Host: querydemo.documents.azure.com  
Cookie: x-ms-session-token#0=602; x-ms-session-token=602  
Content-Length: calculated when request is sent  
Connection: keep-alive
  
{"operations":[{ "op" :"set", "path":"/Parents/0/FamilyName","value":"Bob" }]}  
```   
```  
HTTP/1.1 200 OK  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Transfer-Encoding: chunked  
Content-Type: application/json 
Content-Location : https://querydemo.documents.azure.com/dbs/FamilyDatabase/colls/FamilyContainer/docs/Andersen.1
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Fri, 25 Mar 2016 22:39:02.501 GMT  
etag: "00003200-0000-0000-0000-56f9e84d0000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=1;collectionSize=1;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/testdb/colls/testcoll  
x-ms-quorum-acked-lsn: 602  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 12.38  
x-ms-serviceversion: version=1.6.52.5  
x-ms-activity-id: 856acd38-320d-47df-ab6f-9761bb987668  
x-ms-session-token: 0:603  
Set-Cookie: x-ms-session-token#0=603; Domain=querydemo.documents.azure.com; Path=/dbs/1KtjAA==/colls/1KtjAImkcgw=  
Set-Cookie: x-ms-session-token=603; Domain=querydemo.documents.azure.com; Path=/dbs/1KtjAA==/colls/1KtjAImkcgw=  
x-ms-gatewayversion: version=1.6.52.5  
Date: Tue, 29 Mar 2016 02:28:30 GMT  
  
{
    "id": "Andersen.1",
    "LastName": "Andersen",
    "Parents": [
        {
            "FamilyName": "Bob",
            "FirstName": "Thomas"
        },
        {
            "FamilyName": null,
            "FirstName": "Mary Kay"
        }
    ],
    "Children": [
        {
            "FamilyName": null,
            "FirstName": "Henriette Thaulow",
            "Gender": "female",
            "Grade": 5,
            "Pets": [
                {
                    "GivenName": "Fluffy"
                }
            ]
        }
    ],
    "Address": {
        "State": "WA",
        "County": "King",
        "City": "Seattle"
    },
    "IsRegistered": false,
    "_rid": "2pFqAMMTYY8BAAAAAAAAAA==",
    "_self": "dbs/2pFqAA==/colls/2pFqAMMTYY8=/docs/2pFqAMMTYY8BAAAAAAAAAA==/",
    "_etag": "\"00000000-0000-0000-d464-a585d94d01d7\"",
    "_attachments": "attachments/",
    "_ts": 1636350676
}
  
```  
  
## See Also  
* [Partial document update in Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/partial-document-update)
* [Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) 
* [Azure Cosmos DB SQL API](https://docs.microsoft.com/azure/cosmos-db/sql-api-introduction)   
* [Azure Cosmos DB SQL API SDKs](/azure/cosmos-db/sql-api-sdk-dotnet)    
* [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  