---
title: Table Storage error codes (REST API) - Azure Storage
description: Table Storage error codes.
author: pemari-msft
ms.date: 09/30/2019
ms.service: storage
ms.topic: reference
ms.author: pemari
---

# Table Storage error codes

If you run an operation on Table Storage, you might receive any of the following error codes.  
  
|Error code|HTTP status code|User message|  
|----------------|----------------------|------------------|  
|`DuplicatePropertiesSpecified`|Bad Request (400)|*A property is specified more than one time.*|  
|`EntityNotFound`|Not Found (404)|*The specified entity does not exist.*|  
|`EntityAlreadyExists`|Conflict (409)|*The specified entity already exists.*|  
|`EntityTooLarge`|Bad Request (400)|*The entity is larger than the maximum size permitted.*|  
|`HostInformationNotPresent`|Bad Request (400)|*The required host information is not present in the request. You must send a non-empty **Host** header or include the absolute URI in the request line.*|
|`InvalidDuplicateRow`|Bad Request (400)|*A command with RowKey '{0}' is already present in the batch. An entity can appear only once in a batch.*|
|`InvalidInput`|Bad Request (400)|*The batch request operation exceeds the maximum 100 changes per change set.*|
|`InvalidInput`|Bad Request (400)|*If-None-Match HTTP header cannot be specified for PUT operations.*|
|`InvalidInput`|Bad Request (400)|*If-Match or If-None-Match headers cannot be specified if the target type does not have etag properties defined.*|
|`InvalidInput`|Bad Request (400)|*Both If-Match and If-None-Match HTTP headers cannot be specified at the same time. Please specify either one of the headers or none of them.*|
|`InvalidInput`|Bad Request (400)|*If-None-Match HTTP header cannot be specified for DELETE operations.*|
|`InvalidInput`|Bad Request (400)|*The etag value '{0}' specified in one of the request headers is not valid. Please make sure only one etag value is specified and is valid.*|
|`InvalidValueType`|Bad Request (400)|*The value specified is invalid.*|  
|`JsonFormatNotSupported`|Unsupported Media Type (415)|*JSON format is not supported.*|  
|`MethodNotAllowed`|Method Not Allowed (405)|*The requested method is not allowed on the specified resource.*|  
|`NotImplemented`|Not Implemented (501)|*The requested operation is not implemented on the specified resource.*|  
|`OutOfRangeInput`|Bad Request (400)|*The '{0}' parameter of value '{1}' is out of range.*|  
|`PropertiesNeedValue`|Bad Request (400)|*Values have not been specified for all properties in the entity.*|  
|`PropertyNameInvalid`|Bad Request (400)|*The property name is invalid.*|  
|`PropertyNameTooLong`|Bad Request (400)|*The property name exceeds the maximum allowed length.*|  
|`PropertyValueTooLarge`|Bad Request (400)|*The property value is larger than the maximum size permitted.*|  
|`TableAlreadyExists`|Conflict (409)|*The table specified already exists.*|  
|`TableBeingDeleted`|Conflict (409)|*The specified table is being deleted.*|  
|`TableNotFound`|Not Found (404)|*The table specified does not exist.*|  
|`TooManyProperties`|Bad Request (400)|*The entity contains more properties than allowed.*|  
|`UpdateConditionNotSatisfied`|Precondition Failed (412)|*The update condition specified in the request was not satisfied.*|  
|`XMethodIncorrectCount`|Bad Request (400)|*More than one **X-HTTP-Method** is specified.*|  
|`XMethodIncorrectValue`|Bad Request (400)|*The specified **X-HTTP-Method** is invalid.*|  
|`XMethodNotUsingPost`|Bad Request (400)|*The request uses **X-HTTP-Method** with an HTTP verb other than POST.*|  
  
## See also  

[Common REST API error codes](Common-REST-API-Error-Codes.md)   
[Blob Storage error codes](Blob-Service-Error-Codes.md)   
[Queue Storage error codes](Queue-Service-Error-Codes.md)   
[Troubleshooting API operations](Troubleshooting-API-Operations.md)   
[HttpStatusCode enumeration](https://go.microsoft.com/fwlink/?LinkId=152845)   
[Azure Storage REST](Azure-Storage-Services-REST-API-Reference.md)