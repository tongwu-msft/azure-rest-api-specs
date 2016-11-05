---
title: "Device Messaging REST APIs"
ms.custom: ""
ms.date: "2016-02-09"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: b9738a16-57c9-4945-8a1a-d2f1e8c2567c
caps.latest.revision: 15
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
# Device Messaging REST APIs
Use these APIs from a device to send device-to-cloud messages to an IoT hub, and receive cloud-to-device messages from an IoT hub. All task operations conform to the HTTP/1.1 protocol specification. You must make sure that requests made to these resources are secure. For more information, see [IoT Hub Developer Guide - Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide-security/) for specific information about how to create security tokens.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might perform related to IoT Hub:  
  
-   Replace {api-version} with “2016-02-03” in the URI.  
  
-   Replace {IoTHubName} with the name of your IoT hub.  
  
-   Set the Authorization header to a SAS token created as specified in the device section of [Using IoT Hub security tokens](https://azure.microsoft.com/documentation/articles/iot-hub-devguide-security/#security-tokens).  
  
### Tasks  
 You can do the following:  
  
-   [Send device-to-cloud message](../IoTREST/send-device-to-cloud-message.md)  
  
-   [Receive a cloud-to-device message](../IoTREST/receive-a-cloud-to-device-message.md)  
  
-   [Complete a cloud-to-device message](../IoTREST/complete-a-cloud-to-device-message.md)  
  
-   [Reject a cloud-to-device message](../IoTREST/reject-a-cloud-to-device-message.md)  
  
-   [Abandon a cloud-to-device message](../IoTREST/abandon-a-cloud-to-device-message.md)