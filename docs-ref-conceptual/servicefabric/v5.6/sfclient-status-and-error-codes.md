---
title: "Status and Error Codes"
ms.date: "2017-04-23"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
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

# Status and Error Codes
REST API operations for Service Fabric return standard HTTP status codes, as defined in the [HTTP/1.1 Status Code Definitions](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html).  
  
API operations may also return additional error information that is defined by Service Fabric. This additional error information is returned in the response body. The body of the error response is of [FabricError](sfclient-model-FabricError.md) schema as shown below:
  
```json

{
    "Error": {
        "Code": "string-errorcode",
        "Message": "string-message"
    }
}
  
```  


For example, trying to get services of an unknown Service Fabric application would result in the response in the body with HTTP 404 status code. The response indicates that the specified application was not found in the cluster.

**Request**

```
http:/localhost:19080/Applications/UnknownApp/$/GetServices?api-version=3.0

```

**Response**

```json

{
    "Error": {
        "Code": "FABRIC_E_APPLICATION_NOT_FOUND",
        "Message": "Application not found"
    }
}

```

