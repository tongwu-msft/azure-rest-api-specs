---
title: Find Blobs by Tags for a container (REST API) - Azure Storage
description: The Find Blobs by Tags operation returns all blobs whose tags match a search expression in a container.
author: akharit

ms.date: 03/22/2022
ms.service: storage
ms.topic: reference
ms.author: akharit
---

# Find Blobs by Tags in Container operation

The `Find Blobs by Tags` operation finds all blobs whose tags match a search expression in a container.  
  
## Request  

You can construct the `Find Blobs by Tags` request as follows. We recommend HTTPS. Replace *myaccount* with the name of your storage account and *mycontainer* with name of your storage container.  
  
|GET method request URI|HTTP version|  
|------------------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer?restype=container&comp=blobs&where=<expression>`|HTTP/1.1|  
  
### URI parameters
  
You can specify the following additional parameters on the request URI:  
  
|Parameter|Description|  
|---------------|-----------------|  
|`expression`|Required. Filters the result set to include only blobs whose tags match the specified expression. <br /><br /> For information on how to construct this expression, see [Remarks](#remarks) later in this article.|  
|`marker`|Optional. A string value that identifies the portion of the result set to be returned with the next operation. The operation returns a marker value within the response body if the returned result set was not complete. The marker value can then be used in a subsequent call to request the next set of items.<br /><br /> The marker value is opaque to the client.|  
|`maxresults`|Optional. Specifies the maximum number of blobs to return. If the request doesn't specify `maxresults` or specifies a value greater than 5,000, the server returns up to 5,000 items. If there are additional results to return, the service returns a continuation token in the `NextMarker` response element. In certain cases, the service might return fewer results than `maxresults` specifies. The service might also return a continuation token.<br /><br /> Setting `maxresults` to a value less than or equal to zero results in error response code 400 (Bad Request).|  
|`timeout`|Optional. Expressed in seconds. For more information, see [Set timeouts for Blob Storage operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request headers  

The following table describes required and optional request headers:  
  
|Request header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authorization scheme, account name, and signature. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md).|  
|`x-ms-version`|Required for all authorized requests, but optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage services](Versioning-for-the-Azure-Storage-Services.md).|  
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1-kibibyte (KiB) character limit that's recorded in the Azure Monitor logs when logging is configured. We highly recommend that you use this header to correlate client-side activities with requests that the server receives. For more information, see [Azure logging: Use logs to track storage requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
### Request body  

None.  
  
## Response  

The response includes an HTTP status code, response headers, and a response body.  
  
### Status code  

A successful operation returns status code 200 (OK).  
  
For information about status codes, see [Status and error codes](Status-and-Error-Codes2.md).  
  
### Response headers  

The response for this operation includes the following headers. The response might also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Response header|Description|  
|---------------------|-----------------|  
|`Content-Type`|Specifies `application/xml` as the content type.|  
|`Content-Length`|Specifies the size of the returned XML document, in bytes.|  
|`x-ms-request-id`|Uniquely identifies the request that was made. You can use it to troubleshoot the request. For more information, see [Troubleshoot API operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of Azure Blob Storage that was used to execute the request.|  
|`Date`|A UTC date/time value that indicates the time at which the service sent the response.|  
|`x-ms-client-request-id`|Can be used to troubleshoot requests and corresponding responses. The value of this header is equal to the value of the `x-ms-client-request-id` header, if it's present in the request and the value is at most 1,024 visible ASCII characters. If the `x-ms-client-request-id` header is not present in the request, this header won't be present in the response.|  
  
### Response body  

The format of the response body is as follows:  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<EnumerationResults ServiceEndpoint=http://myaccount.blob.core.windows.net/>  
  <Where>string-value</Where>  
  <Blobs>  
    <Blob>  
      <Name>blob-name</Name>  
      <ContainerName>container-name</ContainerName>  
      <Tags>
        <TagSet>
          <Tag>
            <Key>matching-tag-name1</Key>
            <Value>matching-tag-value1</Value>
          </Tag>
          <Tag>
            <Key>matching-tag-name2</Key>
            <Value>matching-tag-value2</Value>
          </Tag>
        </TagSet>
      </Tags> 
    </Blob>  
  </Blobs>  
  <NextMarker />  
</EnumerationResults>  
```
  
The response body is a well-formed UTF-8 XML document.
  
## Authorization  

The following users can perform this operation:

- The account owner
- Anyone with a shared access signature (SAS) who has permission to find blobs by tags (the `f` SAS permission)  
- Role-based access control (RBAC) users who have the `Microsoft.Storage/storageAccounts/blobServices/containers/blobs/filter/action` permission  
  
## Remarks  

The `Find Blobs by Tags` operation on a container is supported in REST API version 2021-04-10 and later.  
  
The secondary index that `Find Blobs by Tags` uses is eventually consistent. Updates to blob tags via `Set Blob Tags` might not be immediately visible to `Find Blobs by Tags` operations.  
  
### Constructing a search expression
  
The `where` URI parameter finds blobs in the storage account and container whose tags match an expression. The expression must evaluate to `true` for a blob to be returned in the result set.
  
The storage service supports a subset of the ANSI SQL `WHERE` clause grammar for the value of the `where=<expression>` query parameter. The storage service supports the following operators:
  
|Operator|Description|Example|  
|---------------|-----------------|-----------------|  
|`=`|Equal|`&where=Status = 'In Progress'`|  
|`>`|Greater than|`&where=LastModified > '2018-06-18 20:51:26Z'`|  
|`>=`|Greater than or equal|`&where=Priority >= '05'`|  
|`<`|Less than|`&where=Age < '032'`|  
|`<=`|Less than or equal|`&where=Reviewer <= 'Smith'`|  
|`AND`|Logical and|`&where=Name > 'C' AND Name < 'D'`<br />`&where=Age > '032' AND Age < '100'`|  
  
> [!NOTE]
> The value of the `where` URI parameter must be properly URI encoded (including spaces and operators). The preceding examples omit this for readability. `@container` is not supported when the container is part of a URI.

All tag values are strings. The supported binary relational operators use a lexicographic sorting of the tag values. To support non-string data types, including numbers and dates, you must use appropriate padding and sortable formatting. Tag values must be enclosed in single quotation marks.  
  
If tag names are regular SQL identifiers, they can be present without escaping. If they contain any special characters, they must be delimited with double quotation marks (for example, `"TagName"` = `TagValue`). We recommend that you always enclose tag names in double quotation marks.  
  
The storage service will reject any request that contains an invalid expression with error code 400 (Bad Request).  
  
## See also 

[Manage and find data on Azure Blob Storage with blob index tags](/azure/storage/blobs/storage-manage-find-blobs)  
[Authorize requests to Azure Storage](authorize-requests-to-azure-storage.md)  
[Status and error codes](Status-and-Error-Codes2.md)  
[Blob Storage error codes](Blob-Service-Error-Codes.md)  
