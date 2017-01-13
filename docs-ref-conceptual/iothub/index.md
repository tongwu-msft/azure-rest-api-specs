---
title: "IoT Hub REST"
ms.custom: ""
ms.date: "2015-09-30"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "IoT"
ms.assetid: 8ff10ab6-c1a8-4da5-aac5-e4d24df02e5a
caps.latest.revision: 11
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
# IoT Hub REST
The REST APIs for IoT Hub offer programmatic access to the device, messaging, and job services, as well as the resource provder, in IoT Hub.  You can access messaging services from within an IoT service running in Azure, or directly over the Internet from any application that can send an HTTPS request and receive an HTTPS response.  
  
-   [Device Identities](deviceapi)  
  
-   [Device Messaging](httpruntime)  

-   [Jobs](jobapi)
  
-   [Resource Provider](iothubresource)  
  
-   [Common error codes](common-error-codes.md)

## Device Identities
Use these APIs to manage device identities in the identity registry of an IoT hub. All task operations conform to the HTTP/1.1 protocol specification and each operation returns an `x-ms-request-id` header that can be used to obtain information about the request. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide – Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#security) for the specifics on how to create security tokens.

## Device Messaging
Use these APIs from a device to send device-to-cloud messages to an IoT hub, and receive cloud-to-device messages from an IoT hub. All task operations conform to the HTTP/1.1 protocol specification. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide - Security](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security) for specific information about how to create security tokens.
  
## Common parameters and headers  
 The following information is common to all tasks related to IoT Hub:  
  
-   Replace {api-version} with "2016-02-03" in the URI.  
  
-   Replace {IoTHubName} with the name of your IoT hub.  
  
-   Set the Content-Type header to application/json.  
  
-   Set the Authorization header to a SAS token created as specified in the *security tokens* section of [Using IoT Hub security tokens](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide-security).
  
-   The Etag header is returned in all requests scoped to a single device identity, as per [RFC7232](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CB8QFjAAahUKEwj799zo3N3HAhXMO4gKHSdKBTM&url=https%3A%2F%2Ftools.ietf.org%2Fhtml%2Frfc7232&usg=AFQjCNGs7xYLCVYw5XorAUXCdYNFqhgUNw&sig2=sxFg4W4iBNY4cnw2ZC1dAw).
