---
title: Status and error codes (REST API) - Azure Storage
description: Status and error codes for Azure Storage REST API operations.
author: pemari-msft
ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Status and error codes

REST API operations for Azure Storage return standard HTTP status codes, as defined in the [HTTP/1.1 Status Code Definitions](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html).  
  
API operations can also return additional error information that is defined by the service. This additional error information is returned in the response body.  
  
The body of the error response follows the basic format shown here. The `code` element indicates the error code string, whereas the `message` element indicates the error message string.  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<Error>  
  <Code>string-value</Code>  
  <Message>string-value</Message>  
</Error>  
```  
  
For version 2017-07-29 and later, failed API operations also return the Azure Storage error code string in a response header.
 
|Response header|Description|  
|---------------------|-----------------|  
|`x-ms-error-code`|A value that indicates the error code string.|  

A particular error response might also include additional error information to provide the developer with more information. For example, the following error response indicates that a query parameter specified on the request URI is invalid, and provides additional information about the invalid parameter's name and value, and the reason for the error.  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<Error>  
  <Code>InvalidQueryParameterValue</Code>  
  <Message>Value for one of the query parameters specified in the request URI is invalid.</Message>  
  <QueryParameterName>popreceipt</QueryParameterName>  
  <QueryParameterValue>33537277-6a52-4a2b-b4eb-0f905051827b</QueryParameterValue>  
  <Reason>invalid receipt format</Reason>  
</Error>  
```  
  
The following topics provide lists of error codes that you might find useful:  
  
- [Common REST API error codes](Common-REST-API-Error-Codes.md)  
  
- [Blob Storage error codes](Blob-Service-Error-Codes.md)  
  
- [Queue Storage error codes](Queue-Service-Error-Codes.md)  
  
- [Table Storage error codes](Table-Service-Error-Codes.md)  
  
- [Azure Files error codes](File-Service-Error-Codes.md)  
  
## Error responses for Table Storage  

Error responses for Table Storage comply with the error format described in section 19 of the [OData specification](https://go.microsoft.com/fwlink/?LinkId=301473). Additional error information might be included, but the error response always complies with the `OData` spec.  
  
Batch error responses are similar to standard Table Storage error responses. For more information, see [Performing entity group transactions](Performing-Entity-Group-Transactions.md).  
  
> [!NOTE]
> JSON is the recommended payload format for Table Storage. It's the only format supported for version 2015-12-11 and later.  
  
The following shows the basic error body in JSON format (version 2013-08-15 and later):  
  
```  
{"odata.error":{"code":"ResourceNotFound","message":{"lang":"en-US","value":"The specified resource does not exist.\nRequestId:102a2b55-eb35-4254-9daf-854db78a47bd\nTime:2014-06-04T16:18:20.4307735Z"}}}  
  
```  
  
The following shows the basic error body in Atom format (versions prior to 2015-12-11):  
  
```  
<?xml version="1.0" encoding="utf-8"?>  
<error xmlns="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">  
  <code>ResourceNotFound</code>  
  <message xml:lang="en-US">The specified resource does not exist.  
RequestId:e288ba1e-f5dd-4014-9e09-f1263d223dec  
Time:2014-06-04T16:18:20.7088013Z</message>  
</error>  
  
```  
  
## See also  

[Troubleshooting API operations](Troubleshooting-API-Operations.md)   
[HttpStatusCode enumeration](https://go.microsoft.com/fwlink/?LinkId=152845)   
[Storage services REST](Azure-Storage-Services-REST-API-Reference.md)