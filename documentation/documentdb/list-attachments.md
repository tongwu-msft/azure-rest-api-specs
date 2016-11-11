---
title: "List Attachments"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2d161201-c886-46b1-b0d8-35778d20420d
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
# List Attachments
  Returns a list of attachments under the document.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|GET|https:// {databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-name}/attachments|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection the document is contained in. The {doc-name} value is the name of the document associated with the attachment.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
### Status codes  
 The following table lists common status codes returned by this operation. For a full list of status codes, see [HTTP Status Codes](https://msdn.microsoft.com/library/azure/dn783364.aspx).  
  
|HTTP status code|Description|  
|----------------------|-----------------|  
|200 Ok|The operation was successful.|  
  
### Body  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the attachment resource.|  
|**_count**|This is the number of attachments returned by the list operation.|  
|**Attachments**||  
|**id**|The unique name that identifies the attachment.|  
|**contentType**|The content type of the attachment.|  
|**media**|The URL link or file path where the attachment resides.|  
|**_rid**|This is a [system generated property](http://azure.microsoft.com/documentation/articles/documentdb-resources/#system-vs-user-defined-resources). The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the document resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAA==",  
    "Attachments": [{  
        "contentType": "application/octet-stream",  
        "id": "image1.jpg",  
        "media": "/media/Sl8fALN4sw4CAAAAAAAAAOo3S2UB",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAAOo3S2U=",  
        "_ts": 1449679020,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOo3S2U=",  
        "_etag": "\"06007fe0-0000-0000-0000-566858ac0000\""  
    },  
    {  
        "id": "attachment_2",  
        "contentType": "image/png",  
        "media": "www.microsoft.com",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAAPmgj5c=",  
        "_ts": 1449678581,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAPmgj5c=",  
        "_etag": "\"060056e0-0000-0000-0000-566856f50000\""  
    },  
    {  
        "id": "attachment_1",  
        "contentType": "image/jpg",  
        "media": "www.bing.com",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAANlN49I=",  
        "_ts": 1449678550,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAANlN49I=",  
        "_etag": "\"060053e0-0000-0000-0000-566856d60000\""  
    }],  
    "_count": 3  
}  
  
```  
  
## Example  
  
```  
GET https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d/attachments HTTP/1.1  
x-ms-date: Wed, 09 Dec 2015 16:37:55 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dmQaFwFJ2%2boYDlFgFQIQsMjys6wxa70CgF5HM6%2bk0Skw%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
x-ms-max-item-count: 3  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
  
```  
  
```  
HTTP/1.1 200 Ok  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Content-Location: https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d/attachments  
Server: Microsoft-HTTPAPI/2.0  
x-ms-max-media-storage-usage-mb: 2048  
x-ms-media-storage-usage-mb: 0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Thu, 26 Nov 2015 05:00:57.592 GMT  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=285;collectionSize=368;  
x-ms-item-count: 3  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d  
x-ms-content-path: Sl8fALN4sw4CAAAAAAAAAA==  
x-ms-session-token: 28  
x-ms-request-charge: 1  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: 92037beb-8550-4476-89f2-9de5b9f6161a  
Set-Cookie: x-ms-session-token=28; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-continuation: Sl8fALN4sw4CAAAAAAAAANlN49I=  
x-ms-gatewayversion: version=1.5.57.3  
Date: Wed, 09 Dec 2015 16:38:35 GMT  
Content-Length: 994  
  
{  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAA==",  
    "Attachments": [{  
        "contentType": "application/octet-stream",  
        "id": "image1.jpg",  
        "media": "/media/Sl8fALN4sw4CAAAAAAAAAOo3S2UB",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAAOo3S2U=",  
        "_ts": 1449679020,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOo3S2U=",  
        "_etag": "\"06007fe0-0000-0000-0000-566858ac0000\""  
    },  
    {  
        "id": "attachment_2",  
        "contentType": "image/png",  
        "media": "www.microsoft.com",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAAPmgj5c=",  
        "_ts": 1449678581,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAPmgj5c=",  
        "_etag": "\"060056e0-0000-0000-0000-566856f50000\""  
    },  
    {  
        "id": "attachment_1",  
        "contentType": "image/jpg",  
        "media": "www.bing.com",  
        "_rid": "Sl8fALN4sw4CAAAAAAAAANlN49I=",  
        "_ts": 1449678550,  
        "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAANlN49I=",  
        "_etag": "\"060053e0-0000-0000-0000-566856d60000\""  
    }],  
    "_count": 3  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](../Topic/Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  