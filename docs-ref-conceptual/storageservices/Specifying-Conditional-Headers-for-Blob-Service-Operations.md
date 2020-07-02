---
title: Specifying conditional headers for Blob service operations (REST API) - Azure Storage
description: Several Blob service operations support the use of conditional headers. You can specify conditional headers to carry out an operation only if a specified condition has been met.
author: pemari-msft

ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Specifying conditional headers for Blob service operations

Several Blob service operations support the use of conditional headers. You can specify conditional headers to carry out an operation only if a specified condition has been met.  
  
 The Blob service follows the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478) for conditional headers.  
  
##  <a name="Subheading1"></a> Supported Conditional Headers  
 The supported conditional headers are described in the following table.  
  
|Conditional header|Description|  
|------------------------|-----------------|  
|`If-Modified-Since`|A `DateTime` value. Specify this header to perform the operation only if the resource has been modified since the specified time.|  
|`If-Unmodified-Since`|A `DateTime` value. Specify this header to perform the operation only if the resource has not been modified since the specified date/time.|  
|`If-Match`|An ETag value. Specify this header to perform the operation only if the resource's ETag matches the value specified. For versions 2011-08-18 and newer, the ETag can be specified in quotes.|  
|`If-None-Match`|An ETag value, or the wildcard character (*). Specify this header to perform the operation only if the resource's ETag does not match the value specified. For versions 2011-08-18 and newer, the ETag can be specified in quotes.<br /><br /> Specify the wildcard character (\*) to perform the operation only if the resource does not exist, and fail the operation if it does exist.|  
  
## Specifying Conditional Headers for Blob Service Read Operations in Version 2013-08-15 or Later  
 Beginning with version 2013-08-15, the [Get Blob](Get-Blob.md) and [Get Blob Properties](Get-Blob-Properties.md) operations support multiple conditional headers. You can specify any combination of supported conditional headers. The Blob service will evaluate these conditions according to following expression:  
  
 `If-Match && If-Unmodified-Since && (If-None-Match || If-Modified-Since)`  
  
 You can also provide multiple comma-separated values for `If-Match` and `If-None-Match`. If you specify multiple values for `If-Match`, then the Blob service performs a logical `OR` operation on all of the provided values before evaluating the entire expression. If you specify multiple values for `if-None-Match`, then the service performs a logical `AND` operation before evaluating the entire expression. Specifying multiple values for `If-Modified-Since` and `If-Unmodified-Since` is not supported and results in error code 400 (`Bad Request`).  
  
 This feature is enabled in order to comply with [HTTP/1.1 specification](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html) and to cater to scenarios where a Content Delivery Network (CDN) or proxy server adds additional conditional headers to an inflight request. Below are some examples of different combinations of conditional headers.  
  
 **Example 1:**  
  
 Consider a [Get Blob](Get-Blob.md) request containing the `If-Match` and `If-Modified-Since` headers. The following table indicates the result if the headers are evaluated individually, and the result if they are evaluated in combination.  
  
|Conditional headers|Result if evaluated individually|Result if evaluated in combination|  
|-------------------------|--------------------------------------|----------------------------------------|  
|`If-Match`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-Match`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|200 (OK)|200 (OK)|  
|`If-Match`|200 (OK)|304 (Not Modified)|  
|`If-Modified-Since`|304 (Not Modified)|304 (Not Modified)|  
  
 **Example 2:**  
  
 Consider a request containing `If-None-Match` and `If-Modified-Since` headers.  
  
|Conditional headers|Result if evaluated individually|Result if evaluated in combination|  
|-------------------------|--------------------------------------|----------------------------------------|  
|`If-None-Match`|304 (Not Modified)|200 (OK)|  
|`If-Modified-Since`|200 (OK)|200 (OK)|  
|`If-None-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|200 (OK)|200 (OK)|  
|`If-None-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|304 (Not Modified)|200 (OK)|  
|`If-None-Match`|304 (Not Modified)|304 (Not Modified)|  
|`If-Modified-Since`|304 (Not Modified)|304 (Not Modified)|  
  
 **Example 3:**  
  
 Consider a request containing `If-Modified-Since`, `If-Match` and `If-Unmodified-Since` headers.  
  
|Conditional headers|Result if evaluated individually|Result if evaluated in combination|  
|-------------------------|--------------------------------------|----------------------------------------|  
|`If-Modified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-Match`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-Modified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-Match`|200 (OK)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-Match`|200 (OK)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|304 (Not Modified)|304 (Not Modified)|  
|`If-Match`|200 (OK)|304 (Not Modified)|  
|`If-Unmodified-Since`|200 (OK)|304 (Not Modified)|  
  
 **Example 4:**  
  
 Consider a request containing `If-Modified-Since`, `If-None-Match`, `If-Unmodified-Since` and `If-Match` headers.  
  
|Combination|Individual http status code|Get Blob status result|  
|-----------------|---------------------------------|----------------------------|  
|`If-Modified-Since`|200 (OK)|200 (OK)|  
|`If-None-Match`|200 (OK)|200 (OK)|  
|`If-Unmodified-Since`|200 (OK)|200 (OK)|  
|`If-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-None-Match`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Match`|200 (OK)|412 (Precondition Failed)|  
|`If-Modified-Since`|200 (OK)|200 (OK)|  
|`If-None-Match`|304 (Not Modified)|200 (OK)|  
|`If-Unmodified-Since`|200 (OK)|200 (OK)|  
|`If-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-None-Match`|200 (OK)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|200 (OK)|412 (Precondition Failed)|  
|`If-Match`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-None-Match`|200 (OK)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Match`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Modified-Since`|304 (Not Modified)|200 (OK)|  
|`If-None-Match`|200 (OK)|200 (OK)|  
|`If-Unmodified-Since`|200 (OK)|200 (OK)|  
|`If-Match`|200 (OK)|200 (OK)|  
|`If-Modified-Since`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-None-Match`|304 (Not Modified)|412 (Precondition Failed)|  
|`If-Unmodified-Since`|412 (Precondition Failed)|412 (Precondition Failed)|  
|`If-Match`|200 (OK)|412 (Precondition Failed)|  
  
## Specifying Conditional Headers for Read Operations in Versions Prior to 2013-08-15, and for Write Operations (All Versions)  
 When calling Blob service read operations ([Get Blob](Get-Blob.md) and [Get Blob Properties](Get-Blob-Properties.md)) with versions prior to 2013-08-15, and when calling any write operation regardless of version, keep in mind the following:  
  
-   If a request specifies both the `If-None-Match` and `If-Modified-Since` headers, the request is evaluated based on the criteria specified in `If-None-Match`.  
  
-   If a request specifies both the `If-Match` and `If-Unmodified-Since` headers, the request is evaluated based on the criteria specified in `If-Match`.  
  
-   With the exception of the two combinations of conditional headers listed above, a request may specify only a single conditional header. Specifying more than one conditional header results in status code 400 (`Bad Request`).  
  
-   If a response includes an ETag, verify the version of the request and response before processing the ETag. For example, version 2011-08-18 and later return a quoted ETag, but older versions do not. Ensure that your application can process both ETag formats before they are evaluated.  
  
-   [RFC 2616](http://www.ietf.org/rfc/rfc2616.txt) allows multiple ETag values in a single header, but requests to the Blob service can only include one ETag value. Specifying more than one ETag value results in status code 400 (`Bad Request`).  
  
##  <a name="Subheading2"></a> Operations Supporting Conditional Headers  
 The operations that support conditional headers are described in the following table.  
  
||||  
|-|-|-|  
|**REST Operation**|**Operation type**|**Supported conditional headers**|  
|[Append Block](Append-Block.md)<br /><br /> (version 2015-02-21 and later)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Append Block From URL](Append-Block-From-Url.md)<br /><br /> (version 2018-11-09 and later)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Copy Blob](Copy-Blob.md)|Read and Write|For conditions on the destination blob:<br /><br /> -                     **If-Modified-Since**<br /><br /> -                     **If-Unmodified-Since**<br /><br /> -                     **If-Match**<br /><br /> -                     **If-None-Match**<br /><br /> -                     **x-ms-if-tags**<br /><br /> For conditions on the source blob:<br /><br /> -                     **x-ms-source-if-modified-since**<br /><br /> -                     **x-ms-source-if-unmodified-since**<br /><br /> -                     **x-ms-source-if-match**<br /><br /> -                     **x-ms-source-if-none-match**<br /><br /> -                     **x-ms-source-if-tags**|  
|[Delete Blob](Delete-Blob.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Delete Container](Delete-Container.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**|  
|[Get Blob](Get-Blob.md)|Read|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Get Blob Metadata](Get-Blob-Metadata.md)|Read|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Get Blob Properties](Get-Blob-Properties.md)|Read|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Get Blob Tags](Get-Blob-Tags.md)<br /><br /> (version 2019-12-12 and later)|Read|**x-ms-if-tags**|  
|[Get Block List](Get-Block-List.md)|Read|**x-ms-if-tags**|  
|[Get Page Ranges](Get-Page-Ranges.md)|Read|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Lease Blob](Lease-Blob.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Lease Container](Lease-Container.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**|  
|[Put Blob](Put-Blob.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Put Block From URL](Put-Block-From-URL.md)<br /><br /> (version 2018-03-28 and later)|Write|**x-ms-source-If-Modified-Since**<br /><br /> **x-ms-source-If-Unmodified-Since**<br /><br /> **x-ms-source-If-Match**<br /><br /> **x-ms-source-If-None-Match**| 
|[Put Block List](Put-Block-List.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Put Page](Put-Page.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Put Page From URL](Put-Page-From-Url.md)<br /><br /> (version 2018-11-09 and later)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|    
|[Set Blob Metadata](Set-Blob-Metadata.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Set Blob Properties](Set-Blob-Properties.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
|[Set Container ACL](Set-Container-ACL.md)|Write|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**|  
|[Set Container Metadata](Set-Container-Metadata.md)|Write|**If-Modified-Since**|  
|[Set Blob Tags](Set-Blob-Tags.md)<br /><br /> (version 2019-12-12 and later)|Write|**x-ms-if-tags**|  
|[Set Blob Tier](set-blob-tier.md)|Read or Write|**x-ms-if-tags**|  
|[Snapshot Blob](Snapshot-Blob.md)|Read|**If-Modified-Since**<br /><br /> **If-Unmodified-Since**<br /><br /> **If-Match**<br /><br /> **If-None-Match**<br /><br /> **x-ms-if-tags**|  
  
 The following Blob service data operations do not currently support conditional headers:  
  
-   [Abort Copy Blob](Abort-Copy-Blob.md)  
  
-   [Create Container](Create-Container.md)  

-   [Find Blobs by Tags](find-blobs-by-tags.md)
  
-   [Get Container ACL](Get-Container-ACL.md)  
  
-   [Get Container Metadata](Get-Container-Metadata.md)  
  
-   [Get Container Properties](Get-Container-Properties.md)  
  
-   [List Blobs](List-Blobs.md)  
  
-   [List Containers](List-Containers2.md)  
  
-   [Put Block](Put-Block.md)  

-   [Undelete Blob](Undelete-Blob.md)  
  
##  <a name="Subheading3"></a> HTTP Response Codes for Operations Supporting Conditional Headers  
 If the request includes a conditional header and the specified condition is not met by the resource being requested, the Blob service returns an HTTP response code. The response codes returned are in accordance with the HTTP/1.1 protocol specification (RFC 2616).  
  
 Methods in the Azure .NET client library convert these error response codes into a StorageException object. 

### Read Operations  
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a read operation. Read operations use the verbs GET or HEAD.  
  
|Conditional header|Response code if condition has not been met|  
|------------------------|-------------------------------------------------|  
|`If-Modified-Since`|Not Modified (304 (Not Modified))|  
|`If-Unmodified-Since`|Precondition Failed (412 (Precondition Failed))|  
|`If-Match`|Precondition Failed (412 (Precondition Failed))|  
|`If-None-Match`|Not Modified (304 (Not Modified))|  
  
 Refer to the examples above for results when using multiple headers with versions 2013-08-15 or later.  
  
### Write Operations  
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a write operation. Write operations use the verbs PUT or DELETE.  
  
|Conditional header|Response code if condition has not been met|  
|------------------------|-------------------------------------------------|  
|`If-Modified-Since`|Precondition Failed (412 (Precondition Failed))|  
|`If-Unmodified-Since`|Precondition Failed (412 (Precondition Failed))|  
|`If-Match`|Precondition Failed (412 (Precondition Failed))|  
|`If-None-Match`|Precondition Failed (412 (Precondition Failed))|  
  
## Copy Operations  
 The following table indicates the response codes returned for an unmet condition for each conditional header when the operation is a copy operation. The [Copy Blob](Copy-Blob.md) operation uses the verbs PUT.  
  
|Conditional header|Response code if condition has not been met|  
|------------------------|-------------------------------------------------|  
|`If-Modified-Since`|Precondition Failed (412 (Precondition Failed))|  
|`If-Unmodified-Since`|Precondition Failed (412 (Precondition Failed))|  
|`If-Match`|Precondition Failed (412 (Precondition Failed))|  
|`If-None-Match`|Precondition Failed (412 (Precondition Failed))|  
|`x-ms-source-if-modified-since`|Precondition Failed (412 (Precondition Failed))|  
|`x-ms-source-if-unmodified-since`|Precondition Failed (412 (Precondition Failed))|  
|`x-ms-source-if-match`|Precondition Failed (412 (Precondition Failed))|  
|`x-ms-source-if-none-match`|Precondition Failed (412 (Precondition Failed))|  
  
## Tags Conditional Operations
 In addition to the standard HTTP conditional headers supported by the Blob service, several operations also support conditions against the tags on a blob resource.  
  
|Conditional header|Description|  
|------------------------|-----------------|  
|`x-ms-if-tags`|Version 2019-12-12 and newer. A `TagsPredicate` value. Specify this header to perform the operation only if the predicate evaluates to `true` against the blob's tags.|  
|`x-ms-source-if-tags`|Version 2019-12-12 and newer. Applies to Copy Blob only. A `TagsPredicate` value. Specify this header to perform the operation only if the predicate evaluates to `true` against the source blob's tags.|  
  
 If the `x-ms-if-tags` or `x-ms-source-if-tags` conditional header is present in a request and the `TagsPredicate` evaluates to `false`, the Blob service will return error code 412 (Precondition Failed) for the operation.  
  
 The caller must have permission to read the tags on a blob to use the `x-ms-if-tags` or `x-ms-source-if-tags` conditional headers.  
  
### Tags Predicate Syntax
 The Blob service supports a subset of the ANSI SQL WHERE clause grammar for the value of the `TagsPredicate` header. The following operators are supported:
  
|Operator|Description|Example|  
|---------------|-----------------|-----------------|  
|`=`|Equal|`Status = 'In Progress'`|  
|`<>`|Not equal|`Status <> 'Done'`|  
|`>`|Greater than|`LastModified > '2018-06-18 20:51:26Z'`|  
|`>=`|Greater than or equal|`Priority >= '05'`|  
|`<`|Less than|`Age < '032'`|  
|`<=`|Less than or equal|`Reviewer <= 'Smith'`|  
|`AND`|Logical and|`Name > 'C' AND Name < 'D'`<br />`Age > '032' AND Age < '100'`|  
|`OR`|Logical or|`Status = 'Done' or LastModified > '2018-06-18 20:51:26Z'`|  
  
 All tag values are strings, and the supported binary relational operators use a lexicographic sorting of the tag values. To support non-string data types, including numbers and dates, appropriate padding and sortable formatting must be employed.  Tag values must be enclosed in single quotes.  
  
 If tag names are regular SQL identifiers, they may be present without escaping; if they contain any special characters, they must be delimited with double quotes (e.g. "TagName" = 'TagValue').  
  
 Expressions may include comparisons for multiple tag names and values. Parenthesis (`(` and `)`) may be used to group logical expressions and control canonical order of operation. A `TagsPredicate` may include at most ten (10) logical operations.  
  
 The storage service will reject any request that contains an invalid expression with error code 400 (Bad Request).  
  
## See Also  
 [Blob Service Concepts](Blob-Service-Concepts.md)
