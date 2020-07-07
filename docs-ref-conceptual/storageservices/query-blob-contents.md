---
title: Query Blob Contents (REST API) - Azure Storage
description: The `Query Blob Contents` API applies a simple Structured Query Language (SQL) statement on a blob's contents and returns only the queried subset of the data.
author: pemari-msft

ms.date: 07/06/2020
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Query Blob Contents
The `Query Blob Contents` API applies a simple Structured Query Language (SQL) statement on a blob's contents and returns only the queried subset of the data. You can also call `Query Blob Contents` to query the contents of a version or snapshot.
  
## Request  
 The `Query Blob Contents` request may be constructed as follows. HTTPS is recommended. Replace *myaccount* with the name of your storage account:  
  
|POST Method Request URI|HTTP Version|  
|----------------------------|------------------|  
|`https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=query`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=query&snapshot=<DateTime>`<br /><br /> `https://myaccount.blob.core.windows.net/mycontainer/myblob?comp=query&versionid=<DateTime>`|HTTP/1.0<br /><br /> HTTP/1.1|  
  
### URI Parameters  
 The following additional parameters may be specified on the request URI.  
  
|Parameter|Description|  
|---------------|-----------------|  
|`snapshot`|Optional. The snapshot parameter is an opaque `DateTime` value that, when present, specifies the blob snapshot to query. For more information on working with blob snapshots, see [Creating a Snapshot of a Blob](Creating-a-Snapshot-of-a-Blob.md).|  
|`versionid`| Optional, version 2019-12-12 and newer. The versionid parameter is an opaque DateTime value that, when present, specifies the Version of the blob to retrieve.|
|`timeout`|Optional. The `timeout` parameter is expressed in seconds. For more information, see [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md).|  
  
### Request Headers  
 The following table describes required and optional request headers.  
  
|Request Header|Description|  
|--------------------|-----------------|  
|`Authorization`|Required. Specifies the authentication scheme, account name, and signature. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`Date` or `x-ms-date`|Required. Specifies the Coordinated Universal Time (UTC) for the request. For more information, see [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md).|  
|`x-ms-version`|Required for all authenticated requests, optional for anonymous requests. Specifies the version of the operation to use for this request. For more information, see [Versioning for the Azure Storage Services](Versioning-for-the-Azure-Storage-Services.md).|  
|`Content-Type`|Required. The value of this header should be application/xml; charset=UTF-8.|
|`x-ms-lease-id:<ID>`|Optional. If this header is specified, the operation will be performed only if both of the following conditions are met:<br /><br /> -   The blob's lease is currently active.<br />-   The lease ID specified in the request matches that of the blob.<br /><br /> If this header is specified and both of these conditions are not met, the request will fail and the `Query Blob Contents` operation will fail with status code 412 (Precondition Failed).|  
|`Origin`|Optional. Specifies the origin from which the request is issued. The presence of this header results in cross-origin resource sharing (CORS) headers on the response.| 
|`x-ms-client-request-id`|Optional. Provides a client-generated, opaque value with a 1 KiB character limit that is recorded in the analytics logs when storage analytics logging is enabled. Using this header is highly recommended for correlating client-side activities with requests received by the server. For more information, see [About Storage Analytics Logging](About-Storage-Analytics-Logging.md) and [Azure Logging: Using Logs to Track Storage Requests](https://blogs.msdn.com/b/windowsazurestorage/archive/2011/08/03/windows-azure-storage-logging-using-logs-to-track-storage-requests.aspx).|  
  
 This operation also supports the use of conditional headers to query the blob contents only if a specified condition is met. For more information, see [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md).  
  
### Request Body
 The request body for this version of `Query Blob Contents` uses following XML format:  

```  
<?xml version="1.0" encoding="utf-8"?>  
<QueryRequest>
  <QueryType>String</QueryType>
  <Expression>String</Expression>
  <InputSerialization>
    <Format>
      <Type>String</Type>
          <DelimitedTextConfiguration>
            <ColumnSeparator>String</ColumnSeparator>
            <FieldQuote>String</FieldQuote>
            <RecordSeparator>String</RecordSeparator>
            <EscapeChar>String</EscapeChar>
            <HasHeaders>Boolean</HasHeaders>
          </DelimitedTextConfiguration>
          <JsonTextConfiguration>
            <RecordSeparator>String</RecordSeparator>
          </JsonTextConfiguration>
    </Format>
  </InputSerialization>
  <OutputSerialization>
    <Format>
      <Type>String</Type>
      <DelimitedTextConfiguration>
        <ColumnSeparator>String</ColumnSeparator >
        <FieldQuote>String</FieldQuote >
        <RecordSeparator>String</RecordSeparator>
        <EscapeChar>String</EscapeChar>
        <HasHeaders>Boolean</HasHeaders>
      </DelimitedTextConfiguration>
      <JsonTextConfiguration>
        <RecordSeparator>String</RecordSeparator>
      </JsonTextConfiguration>
      <ArrowConfiguration>
        <Schema>
            <Field>
                <Type>String</Type>
                <Name>String</Name>
            </Field>
            <Field>
                <Type>String</Type>
            </Field>
                .
                .
                .
            <Field>
                <Type>String</Type>
                <Precision>Integer</Precision>
                <Scale>Integer</Scale>
            </Field>
        </Schema>
      </ArrowConfiguration>
    </Format>
  </OutputSerialization>
</QueryRequest>

```  
The following table describes the elements of the request body:  
  
|Element Name|Description|  
|------------------|-----------------|  
|**QueryRequest**| Required. Groups the set of query request settings. |
|**QueryType**| Required. The type of the provided query expression. The only valid value for the current version is `SQL`.|
|**Expression**| Required. The query expression in SQL. The maximum size of the query expression is 256KiB. For more information about the expression syntax, please see [Query Acceleration: SQL Language Reference](https://docs.microsoft.com/azure/storage/blobs/query-acceleration-sql-reference).|
|**InputSerialization**| Optional. Groups the settings regarding the input serialization of the blob contents. If not specified, the delimited text configuration will be used.|
|**Format**| Required if **InputSerialization** is specified. Groups the settings regarding the format of the blob data.|
|**Type**|Required if **InputSerialization** is specified. The format type; valid values are `delimited`, `csv`, or `json`.|
|**DelimitedTextConfiguration**| Optional. Groups the settings used for interpreting the blob data if the blob is delimited text formatted.|
|**ColumnSeparator**|Optional. The string used to separate columns.|
|**FieldQuote**|Optional. The string used to quote a specific field.| 
|**RecordSeparator**|Optional. The string used to separate records.|
|**EscapeChar**|Optional. The string used as an escape character.|
|**HasHeaders**|Optional. Boolean representing whether the data has headers.|
|**JsonTextConfiguration**|Optional. Groups the settings used for interpreting the blob data if the blob is JSON formatted.|
|**RecordSeparator**|Optional. The string used to separate records. |
|**OutputSerialization**| Optional. The serialization format of the filtered contents of the blob returned in the response. If not specified, the delimited text configuration will be used.|
|**Format**|Required if **OutputSerialization** is specified. Groups the settings regarding the format of the response returned.|
|**Type**|Required if **OutputSerialization** is specified. The format type; valid values are `delimited`, `csv`, `json`, or `arrow`.|
|**DelimitedTextConfiguration**|Optional. Groups the settings used for formatting the response if the response should be delimited text formatted.|
|**ColumnSeparator**|Optional. The string used to separate columns.|
|**FieldQuote**|Optional. The string used to quote a specific field.| 
|**RecordSeparator**|Optional. The string used to separate records.|
|**EscapeChar**|Optional. The string used as an escape character.|
|**HasHeaders**|Optional. Boolean representing whether the data has headers.|
|**JsonTextConfiguration**|Optional. Groups the settings used for formatting the response if the response should be JSON formatted.|
|**RecordSeparator**|Optional. The string used to separate records. |
|**ArrowConfiguration**|Optional. Groups the settings used for formatting the response if the response should be Arrow formatted.|
|**Schema** |Required if **ArrowConfiguration** is specified. Groups the settings regarding the schema of the Arrow response returned.|
|**Field**|Optional. Groups settings regarding a specific field.|
|**Type**|Required if **Field** is specified. The field type; valid values are `Int`, `Float`, `Decimal`, or `Bool`.|
|**Precision**|Optional. The precision of the field.|
|**Scale**|Optional. The scale of the field.|
  
## Response  
 The response includes an HTTP status code, a set of response headers, and the response body. The response body is in `Avro\Binary` format. Since the response content length is unknown, the response is streamed with chunked encoding.
 
  
### Status Code  
 If the query request is well-formed and authorized then the operation returns status code 202 (Accepted). Any errors or progress messages encountered during the response streaming will be returned as a part of the response body.
  
 For information about status codes, see [Status and Error Codes](Status-and-Error-Codes2.md).  
  
### Response Headers  
 The response for this operation includes the following headers. The response may also include additional standard HTTP headers. All standard headers conform to the [HTTP/1.1 protocol specification](https://go.microsoft.com/fwlink/?linkid=150478).  
  
|Syntax|Description|  
|------------|-----------------|  
|`Last-Modified`|The date/time that the blob was last modified. The date format follows RFC 1123.<br /><br /> Any operation that modifies the blob, including an update of the blob's metadata or properties, changes the last-modified time of the blob.|  
|`Content-Type`|Specifies the format in which the results are returned. Currently this value is `avro/binary`.| 
|`ETag`|The ETag contains a value that you can use to perform operations conditionally. See [Specifying Conditional Headers for Blob Service Operations](Specifying-Conditional-Headers-for-Blob-Service-Operations.md) for more information. If the request version is 2011-08-18 or newer, the ETag value will be in quotes.|  
|`Content-Encoding`|This header returns the value that was specified for the `Content-Encoding` request header.|  
|`Content-Language`|This header returns the value that was specified for the `Content-Language` request header.|  
|`Cache-Control`|This header is returned if it was previously specified for the blob.|  
|`Content-Disposition`|Returned for requests against version 2013-08-15 and later. This header returns the value that was specified for the `x-ms-blob-content-disposition` header.<br /><br /> The `Content-Disposition` response header field conveys additional information about how to process the response payload, and also can be used to attach additional metadata. For example, if set to `attachment`, it indicates that the user-agent should not display the response, but instead show a **Save As** dialog with a filename other than the blob name specified.|  
|`x-ms-blob-type: <BlockBlob>`|Returns the blob's type.|  
|`x-ms-request-id`|This header uniquely identifies the request that was made and can be used for troubleshooting the request. For more information, see [Troubleshooting API Operations](Troubleshooting-API-Operations.md).|  
|`x-ms-version`|Indicates the version of the Blob service used to execute the request. Included for requests made using version 2009-09-19 and newer.<br /><br /> This header is also returned for anonymous requests without a version specified if the container was marked for public access using the 2009-09-19 version of the Blob service.|  
|`Date`|A UTC date/time value generated by the service that indicates the time at which the response was initiated.|  
|`Access-Control-Allow-Origin`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. This header returns the value of the origin request header in case of a match.|  
|`Access-Control-Expose-Headers`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule. Returns the list of response headers that are to be exposed to the client or issuer of the request.|  
|`Vary`|Returned with the value of the `Origin` header when CORS rules are specified. See [CORS Support for the Storage Services](Cross-Origin-Resource-Sharing--CORS--Support-for-the-Azure-Storage-Services.md) for details.|  
|`Access-Control-Allow-Credentials`|Returned if the request includes an `Origin` header and CORS is enabled with a matching rule that doesn’t allow all origins. This header will be set to true.|  
|`x-ms-blob-committed-block-count`|The number of committed blocks present in the blob. This header is returned only for append blobs.|  
|`x-ms-server-encrypted: true/false`|Version 2015-12-11 or newer. The value of this header is set to `true` if the blob data and application metadata are completely encrypted using the specified algorithm. Otherwise, the value is set to `false` (when the blob is unencrypted, or if only parts of the blob/application metadata are encrypted).| 

  
### Response Body  
 The response body contains the filtered contents of the blob sent as a series of messages in Avro Binary format following the below schema. 

{
    "type": "record",
    "name": "com.microsoft.azure.storage.queryBlobContents.resultData",
    "doc": "Holds result data in the format specified for this query (CSV, JSON, etc.).",
    "fields": [
      {
        "name": "data",
        "type": "bytes"
      }
    ]
  },
  {
    "type": "record",
    "name": "com.microsoft.azure.storage.queryBlobContents.error",
    "doc": "An error that occurred while processing the query.",
    "fields": [
      {
        "name": "fatal",
        "type": "boolean",
        "doc": "If true, this error prevents further query processing.  More result data may be returned, but there is no guarantee that all of the original data will be processed.  If false, this error does not prevent further query processing."
      },
      {
        "name": "name",
        "type": "string",
        "doc": "The name of the error"
      },
      {
        "name": "description",
        "type": "string",
        "doc": "A description of the error"
      },
      {
        "name": "position",
        "type": "long",
        "doc": "The blob offset at which the error occurred"
      }
    ]
  },
  {
    "type": "record",
    "name": "com.microsoft.azure.storage.queryBlobContents.progress",
    "doc": "Information about the progress of the query",
    "fields": [
      {
        "name": "bytesScanned",
        "type": "long",
        "doc": "The number of bytes that have been scanned"
      },
      {
        "name": "totalBytes",
        "type": "long",
        "doc": "The total number of bytes to be scanned in this query"
      }
    ]
  },
  {
    "type": "record",
    "name": "com.microsoft.azure.storage.queryBlobContents.end",
    "doc": "Sent as the final message of the response, indicating that all results have been sent.",
    "fields": [
      {
        "name": "totalBytes",
        "type": "long",
        "doc": "The total number of bytes to be scanned in this query"
      }
    ]
  }
]
 
  
### Sample Response  
  
```  
      "StatusCode": 200,
      "ResponseHeaders": {
        "Content-Type": "avro/binary",
        "Date": "Fri, 24 Apr 2020 20:25:42 GMT",
        "ETag": "\u00220x8D7E88DA9C0A75B\u0022",
        "Last-Modified": "Fri, 24 Apr 2020 20:25:43 GMT",
        "Transfer-Encoding": "chunked",
        "x-ms-blob-type": "BlockBlob",
        "x-ms-client-request-id": "f6d1983c-55e5-9f95-6d3d-80d74862d99e",
        "x-ms-creation-time": "Fri, 24 Apr 2020 20:25:43 GMT",
        "x-ms-lease-state": "available",
        "x-ms-lease-status": "unlocked",
        "x-ms-request-id": "46c09ab1-b01e-0001-1076-1acef2000000",
        "x-ms-version": "2019-12-12"
	},
	"ResponseBody":{...}
  
```  
  
## Authorization  
 If the container's access control list (ACL) is set to allow anonymous access to the blob, any client may call this operation. If the container is private, this operation can be performed by the account owner and by anyone with a Shared Access Signature that has permission to read the blob.  
  
## Remarks  
-  `Query Blob Contents` API is only supported on BlockBlob type. 
-  Querying the contents of a blob which is encrypted with Customer Provider Keys is not supported in this version of the API.
-  The `x-ms-version` header is required to retrieve a blob that belongs to a private container. If the blob belongs to a container that is available for full or partial public access, any client can read it without specifying a version; the service version is not required for retrieving a blob that belongs to a public container. See [Restrict Access to Containers and Blobs](/azure/storage/storage-manage-access-to-resources) for more information.  
-  `Query Blob Contents` API can be used to query only objects that have `Delimited/CSV` or `JSON` format.

## See Also  
 [Authentication for the Azure Storage Services](Authentication-for-the-Azure-Storage-Services.md)   
 [Status and Error Codes](Status-and-Error-Codes2.md)   
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Setting Timeouts for Blob Service Operations](Setting-Timeouts-for-Blob-Service-Operations.md)
 [Query Acceleration: SQL Language Reference](https://docs.microsoft.com/azure/storage/blobs/query-acceleration-sql-reference)

