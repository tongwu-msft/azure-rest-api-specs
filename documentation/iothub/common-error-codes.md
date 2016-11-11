---
title: "Common error codes"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "IoT"
ms.assetid: 3cee4886-033d-4b3a-a56f-cb6e07ef5a98
caps.latest.revision: 5
author: "dominicbetts"
ms.author: "sethm"
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
# Common error codes
The following table lists error codes common to the IoT Hub REST APIs.  
  
## Common error codes  
  
|Error code|Description|HTTP status code|  
|----------------|-----------------|----------------------|  
|400|The body of the request is not valid; for example, it cannot be parsed, or the object cannot be validated.|400 Bad format|  
|401|The authorization token cannot be validated; for example, it is expired or does not apply to the request’s URI and/or method.|401 Unauthorized|  
|404|The IoT hub instance or a device identity does not exist.|404 Not Found|  
|403|The maximum number of device identities has been reached.|403 Too many devices|  
|412|The etag in the request does not match the etag of the existing resource, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw.).|412 Precondition failed.|  
|429|This IoT hub’s identity registry operations are being throttled by the service. For more information, see [IoT Hub Developer Guide – Throttling](https://azure.microsoft.com/en-us/documentation/articles/iot-hub-devguide/#throttling) for more information. An exponential back-off strategy is recommended.|429 Too many requests|  
|500|An internal error occurred.|500 Internal Server Error|