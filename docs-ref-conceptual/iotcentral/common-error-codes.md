---
title: IoT Central REST API common error codes
description: Learn about the error codes that are common to the IoT Central REST API.
ms.custom: ""
ms.date: 10/28/2019
ms.reviewer: ""
ms.service: "iot-central"
ms.topic: "reference"
applies_to: 
  - "IoT"
author: "avneet723"
ms.author: "avneets"
---

# IoT Central REST API common error codes
The following table lists error codes common to the IoT Central REST APIs.  
  
## Common error codes  
  
|Error code|Description|HTTP status code|  
|----------------|-----------------|----------------------|  
|400|The request received could not be understood by the service.|  
|401|The authorization token cannot be validated; for example, it is expired or does not apply to the request’s URI and/or method.|401 Unauthorized|  
|403|The provider credentials do not have sufficient privileges|403 Forbidden|  
|404|The IoT Central instance or a device identity does not exist.|404 Not Found|  
|412|The etag in the request does not match the etag of the existing resource, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw.).|412 Precondition failed.|  
|422|The body of the request could not be validated.|422 Unprocessable Entity| 
|429|The number of requests exceeded the environment threshold. Please try again later. |429 Too Many Requests|
|500|An internal error occurred.|500 Internal Server Error|