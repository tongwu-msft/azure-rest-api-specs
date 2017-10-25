---
title: "Common REST API Error Codes"
ms.custom: na
ms.date: 2017-04-27
ms.prod: azure
ms.reviewer: na
ms.service: storage
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.assetid: 1f47db15-ccb7-4ed8-81dd-a202d825327a
caps.latest.revision: 34
author: robinsh
manager: timlt
translation.priority.mt: 
  - de-de
  - es-es
  - fr-fr
  - it-it
  - ja-jp
  - ko-kr
  - pt-br
  - ru-ru
  - zh-cn
  - zh-tw
---
# Common REST API Error Codes
The error codes listed in the following table may be returned by an operation on any of the storage services.  
  
|Error code|HTTP status code|User message|  
|----------------|----------------------|------------------|  
|AccountAlreadyExists|Conflict (409)|The specified account already exists.|  
|AccountBeingCreated|Conflict (409)|The specified account is in the process of being created.|  
|AccountIsDisabled|Forbidden (403)|The specified account is disabled.|  
|AuthenticationFailed|Forbidden (403)|Server failed to authenticate the request. Make sure the value of the `Authorization` header is formed correctly including the signature.|  
|ConditionHeadersNotSupported|BadRequest (400)|Condition headers are not supported.|  
|ConditionNotMet|Not Modified (304)|The condition specified in the conditional header(s) was not met for a read operation.|  
|ConditionNotMet|Precondition Failed (412)|The condition specified in the conditional header(s) was not met for a write operation.|  
|EmptyMetadataKey|Bad Request (400)|The key for one of the metadata key-value pairs is empty.|  
|InsufficientAccountPermissions|Forbidden (403)|Read operations are currently disabled.|  
|InsufficientAccountPermissions|Forbidden (403)|Write operations are not allowed.|  
|InsufficientAccountPermissions|Forbidden (403)|The account being accessed does not have sufficient permissions to execute this operation.|  
|InternalError|Internal Server Error (500)|The server encountered an internal error. Please retry the request.|  
|InvalidAuthenticationInfo|Bad Request (400)|The authentication information was not provided in the correct format. Verify the value of `Authorization` header.|  
|InvalidHeaderValue|Bad Request (400)|The value provided for one of the HTTP headers was not in the correct format.|  
|InvalidHttpVerb|Bad Request (400)|The HTTP verb specified was not recognized by the server.|  
|InvalidInput|Bad Request (400)|One of the request inputs is not valid.|  
|InvalidMd5|Bad Request (400)|The MD5 value specified in the request is invalid. The MD5 value must be 128 bits and Base64-encoded.|  
|InvalidMetadata|Bad Request (400)|The specified metadata is invalid. It includes characters that are not permitted.|  
|InvalidQueryParameterValue|Bad Request (400)|An invalid value was specified for one of the query parameters in the request URI.|  
|InvalidRange|Requested Range Not Satisfiable (416)|The range specified is invalid for the current size of the resource.|  
|InvalidResourceName|Bad Request (400)|The specifed resource name contains invalid characters.|  
|InvalidUri|Bad Request (400)|The requested URI does not represent any resource on the server.|  
|InvalidXmlDocument|Bad Request (400)|The specified XML is not syntactically valid.|  
|InvalidXmlNodeValue|Bad Request (400)|The value provided for one of the XML nodes in the request body was not in the correct format.|  
|Md5Mismatch|Bad Request (400)|The MD5 value specified in the request did not match the MD5 value calculated by the server.|  
|MetadataTooLarge|Bad Request (400)|The size of the specified metadata exceeds the maximum size permitted.|  
|MissingContentLengthHeader|Length Required (411)|The `Content-Length` header was not specified.|  
|MissingRequiredQueryParameter|Bad Request (400)|A required query parameter was not specified for this request.|  
|MissingRequiredHeader|Bad Request (400)|A required HTTP header was not specified.|  
|MissingRequiredXmlNode|Bad Request (400)|A required XML node was not specified in the request body.|  
|MultipleConditionHeadersNotSupported|Bad Request (400)|Multiple condition headers are not supported.|  
|OperationTimedOut|Internal Server Error (500)|The operation could not be completed within the permitted time.|  
|OutOfRangeInput|Bad Request (400)|One of the request inputs is out of range.|  
|OutOfRangeQueryParameterValue|Bad Request (400)|A query parameter specified in the request URI is outside the permissible range.|  
|RequestBodyTooLarge|Request Entity Too Large (413)|The size of the request body exceeds the maximum size permitted.|  
|ResourceTypeMismatch|Conflict (409)|The specified resource type does not match the type of the existing resource.|  
|RequestUrlFailedToParse|Bad Request (400)|The url in the request could not be parsed.|  
|ResourceAlreadyExists|Conflict (409)|The specified resource already exists.|  
|ResourceNotFound|Not Found (404)|The specified resource does not exist.|  
|ServerBusy|Service Unavailable (503)|The server is currently unable to receive requests. Please retry your request.|  
|ServerBusy|Service Unavailable (503)|Ingress is over the account limit.|
|ServerBusy|Service Unavailable (503)|Egress is over the account limit.|
|ServerBusy|Service Unavailable (503)|Operations per second is over the account limit.|
|UnsupportedHeader|Bad Request (400)|One of the HTTP headers specified in the request is not supported.|  
|UnsupportedXmlNode|Bad Request (400)|One of the XML nodes specified in the request body is not supported.|  
|UnsupportedQueryParameter|Bad Request (400)|One of the query parameters specified in the request URI is not supported.|  
|UnsupportedHttpVerb|Method Not Allowed (405)|The resource doesn't support the specified HTTP verb.|  
  
## See Also  
 [Blob Service Error Codes](Blob-Service-Error-Codes.md)   
 [Queue Service Error Codes](Queue-Service-Error-Codes.md)   
 [Table Service Error Codes](Table-Service-Error-Codes.md)   
 [File Service Error Codes](File-Service-Error-Codes.md)   
 [Troubleshooting API Operations](Troubleshooting-API-Operations.md)   
 [HttpStatusCode Enumeration](http://go.microsoft.com/fwlink/?LinkId=152845)   
 [Storage Services REST](Azure-Storage-Services-REST-API-Reference.md)
