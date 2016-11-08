---
title: "Create an Attachment"
ms.custom: ""
ms.date: "2016-02-25"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "documentdb"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: bf341d94-196b-441c-b3df-5e1e400105ab
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
# Create an Attachment
  There are two ways to create an attachment resource – post the media content to DocumentDB like in the [AtomPub Protocol](https://tools.ietf.org/html/rfc5023), or post just the attachment metadata to media stored externally.  
  
 The first is to POST the raw media in the body payload to store it in the provided attachment storage under your DocumentDB account. For the attachment storage quota, see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/). To create this type of attachment, developers include the raw attachment (video, audio, file, blob, etc.) as the body of the POST. Two headers must be set: Content-Type and Slug. The Content-Type header is set to the MIME type of the attachment while the Slug header is set to the name of the attachment.  
  
 The second way to create an attachment resource is to POST the attachment resource properties noting the type and media link of the attachment. Unlike the first type of attachment resource, the Content-Type and Slug headers are not to be set as the raw media is not part of the request payload.  
  
## Request  
  
|Method|Request URI|Description|  
|------------|-----------------|-----------------|  
|POST|https://{databaseaccount}.documents.azure.com/dbs/{db-id}/colls/{coll-id}/docs/{doc-name}/attachments.|Note that the {databaseaccount} is the name of the DocumentDB account created under your subscription. The {db-id} value is the user generated name/id of the database, not the system generated id (rid). The {coll-id} value is the name of the collection the document is contained in. The {doc-name} value is the name of the document associated with the attachment.|  
  
### Headers  
 See [Common DocumentDB REST request headers](common-documentdb-rest-request-headers.md) for headers that are used by all DocumentDB requests.  
  
|Header|Required|Type|Description|  
|------------|--------------|----------|-----------------|  
|**Slug**|Optional|String|The name of the attachment. This is only required when raw media is submitted to the DocumentDB attachment storage. For more details, refer to [AtomPub Protocol](https://tools.ietf.org/html/rfc5023).|  
  
### Body  
  
|Property|Required|Type|Description|  
|--------------|--------------|----------|-----------------|  
|**id**|Optional|String|Not Required to be set when attaching raw media. This is a user settable property. It is the unique name that identifies the attachment, i.e. no two attachments will share the same **id**. The **id** must not exceed 255 characters.|  
|**contentType**|Optional|String|Not Required to be set when attaching raw media. This is a user settable property. It notes the content type of the attachment. When submitting the attachment bits as body, DocumentDB sets the **contentType** to the type set in the **Content-Type** header.|  
|**Media**|Optional|String|Not Required to be set when attaching raw media. This is the URL link or file path where the attachment resides.|  
  
```  
{  
    "id": "image_id",  
    "contentType": "image/jpg",  
    "media": "www.bing.com"  
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
|409 Conflict|The id or Slug provided for the new attachment has been taken by an existing attachment.|  
|413 Entity Too Large|The document size in the request exceeded the allowable document size in a request. For more information on document size limits, see [DocumentDB limits](http://azure.microsoft.com/documentation/articles/documentdb-limits/).|  
  
### Body  
 Creating an attachment results in the creation of an attachment resource with the following response body.  
  
|Property|Description|  
|--------------|-----------------|  
|**_rid**|This is a system generated property. The resource ID (**_rid**) is a unique identifier that is also hierarchical per the resource stack on the resource model. It is used internally for placement and navigation of the attachment resource.|  
|**_ts**|This is a system generated property. It specifies the last updated timestamp of the resource. The value is a timestamp.|  
|**_self**|This is a system generated property. It is the unique addressable URI for the resource.|  
|**_etag**|This is a system generated property that specifies the resource **etag** required for optimistic concurrency control.|  
  
```  
{  
    "id": "image_id",  
    "contentType": "image/jpg",  
    "media": "www.bing.com",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_ts": 1449606296,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_etag": "\"060091c2-0000-0000-0000-56673c980000\""  
}  
  
```  
  
## Example  
  
```  
POST https://contosomarketing.documents.azure.com/dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d/attachments HTTP/1.1  
x-ms-session-token: 16  
x-ms-date: Tue, 08 Dec 2015 20:24:56 GMT  
authorization: type%3dmaster%26ver%3d1.0%26sig%3dQ8MDtRExrtOeDL5TSaHvXhPTNyKiRrrIC3IjTSpf958%3d  
Cache-Control: no-cache  
User-Agent: contoso/1.0  
x-ms-version: 2015-08-06  
Accept: application/json  
Host: contosomarketing.documents.azure.com  
Cookie: x-ms-session-token=16  
Content-Length: 66  
Expect: 100-continue  
Connection: Keep-Alive  
{  
    "id": "image_id",  
    "contentType": "image/jpg",  
    "media": "www.bing.com"  
}  
  
```  
  
```  
HTTP/1.1 201 Created  
Cache-Control: no-store, no-cache  
Pragma: no-cache  
Content-Type: application/json  
Server: Microsoft-HTTPAPI/2.0  
x-ms-max-media-storage-usage-mb: 2048  
x-ms-media-storage-usage-mb: 0  
Strict-Transport-Security: max-age=31536000  
x-ms-last-state-change-utc: Sun, 29 Nov 2015 19:20:18.154 GMT  
etag: "060091c2-0000-0000-0000-56673c980000"  
x-ms-resource-quota: documentSize=10240;documentsSize=10485760;collectionSize=10485760;  
x-ms-resource-usage: documentSize=0;documentsSize=291;collectionSize=369;  
x-ms-schemaversion: 1.1  
x-ms-alt-content-path: dbs/volcanodb/colls/volcano1/docs/c3bb1fef-fcb1-56e3-0389-f88583c3ce0d  
x-ms-content-path: Sl8fALN4sw4CAAAAAAAAAA==  
x-ms-quorum-acked-lsn: 18  
x-ms-session-token: 19  
x-ms-current-write-quorum: 3  
x-ms-current-replica-set-size: 4  
x-ms-request-charge: 4.95  
x-ms-serviceversion: version=1.5.57.3  
x-ms-activity-id: c03c09bf-a791-4dad-b2f8-fa88fa1bce04  
Set-Cookie: x-ms-session-token=19; Domain=contosomarketing.documents.azure.com; Path=/dbs/volcanodb/colls/volcano1  
x-ms-gatewayversion: version=1.5.57.3  
Date: Tue, 08 Dec 2015 20:24:57 GMT  
Content-Length: 292  
  
{  
    "id": "image_id",  
    "contentType": "image/jpg",  
    "media": "www.bing.com",  
    "_rid": "Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_ts": 1449606296,  
    "_self": "dbs\/Sl8fAA==\/colls\/Sl8fALN4sw4=\/docs\/Sl8fALN4sw4CAAAAAAAAAA==\/attachments\/Sl8fALN4sw4CAAAAAAAAAOnTcEc=",  
    "_etag": "\"060091c2-0000-0000-0000-56673c980000\""  
}  
  
```  
  
## See Also  
 [DocumentDB documentation](http://azure.microsoft.com/documentation/services/documentdb/)   
 [Azure DocumentDB Reference Documentation](Azure%20DocumentDB%20Reference%20Documentation.md)   
 [DocumentDB SDKs](https://azure.microsoft.com/documentation/articles/documentdb-sdk-dotnet/)   
 [REST from .NET Sample](https://github.com/Azure/azure-documentdb-dotnet/tree/master/samples/rest-from-.net)  
  
  