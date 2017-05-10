---
title: "List Databases"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "cosmosdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ca9ca696-fd60-4e21-8107-5ea293f20cdb
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
# List Databases
  To list the databases under the database account, perform a GET on the databases resource, i.e. the dbs URI path.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|`https://{databaseaccount}.documents.azure.com/dbs`|Note that the {databaseaccount} is the name of the Azure Cosmos DB account created under your subscription.|  
  
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
|200 OK|The operation is successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The **_rid** value is empty for this operation.|  
|**_count**|This property shows the number of databases returned as part of list operation.|  
|**Databases**|This the array containing the databases returned as part of the list operation.<br />Properties of the database resource|  
|**id**|The unique user generated name for the database.|  
|**_rid**|This is a system generated property. The resource id (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement of and navigation to the database resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property representing the resource **etag** required for optimistic concurrency control.|  
|**_colls**|This is a system generated property that specifies the addressable path of the collections resource.|  
|**_users**|This is a system generated property that specifies the addressable path of the users resource.|  
  
```  
{  
    "_rid": "",  
    "Databases": [{  
        "id": "iot2",  
        "_rid": "qicAAA==",  
        "_ts": 1446192371,  
        "_self": "dbs\/qicAAA==\/",  
        "_etag": "\"00001800-0000-0000-0000-563324f30000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    },  
    {  
        "id": "TestDB2",  
        "_rid": "KI0YAA==",  
        "_ts": 1446243863,  
        "_self": "dbs\/KI0YAA==\/",  
        "_etag": "\"00001f00-0000-0000-0000-5633ee170000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    },  
    {  
        "id": "FoodDB",  
        "_rid": "vdoeAA==",  
        "_ts": 1442511602,  
        "_self": "dbs\/vdoeAA==\/",  
        "_etag": "\"00000100-0000-0000-0000-55fafaf20000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    }],  
    "_count": 3  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs HTTP/1.1  
x-ms-date: Tue, 08 Dec 2015 19:33:17 GMT  
x-ms-max-item-count: 3  
authorization: type%3dmaster%26ver%3d1.0%26sig%3d8aZP3gx24rXdqshQ3f4EIfwiD%2bBFxmqypnVg9GQkpwU%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs  
Server: Microsoft-HTTPAPI/2.0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Thu, 26 Nov 2015 06:37:26.906 GMT  
x-ms-resource-quota: databases=100;collections=5000;users=500000;permissions=2000000;  
x-ms-resource-usage: databases=15;collections=34;users=0;permissions=0;  
x-ms-item-count: 3  
x-ms-schemaversion: 1.1  
x-ms-session-token: 860  
x-ms-request-charge: 2  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 67b6b831-3516-46ed-a36e-6b34fb345a29  
x-ms-continuation: vdoeAA==  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 19:37:57 GMT  
Content-Length: 533  
  
{  
    "_rid": "",  
    "Databases": [{  
        "id": "iot2",  
        "_rid": "qicAAA==",  
        "_ts": 1446192371,  
        "_self": "dbs\/qicAAA==\/",  
        "_etag": "\"00001800-0000-0000-0000-563324f30000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    },  
    {  
        "id": "TestDB2",  
        "_rid": "KI0YAA==",  
        "_ts": 1446243863,  
        "_self": "dbs\/KI0YAA==\/",  
        "_etag": "\"00001f00-0000-0000-0000-5633ee170000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    },  
    {  
        "id": "FoodDB",  
        "_rid": "vdoeAA==",  
        "_ts": 1442511602,  
        "_self": "dbs\/vdoeAA==\/",  
        "_etag": "\"00000100-0000-0000-0000-55fafaf20000\"",  
        "_colls": "colls\/",  
        "_users": "users\/"  
    }],  
    "_count": 3  
}  
  
```  
  
## See Also  
 [Azure Cosmos DB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](https://go.microsoft.com/fwlink/?linkid=834805)   
 [Azure Cosmos DB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  
