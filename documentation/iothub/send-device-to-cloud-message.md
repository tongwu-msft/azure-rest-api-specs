---
title: "Send device-to-cloud message"
ms.custom: ""
ms.date: "2015-10-16"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c922f4d3-ec75-42ca-831b-5f868a3cca2c
caps.latest.revision: 7
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
# Send device-to-cloud message
Sends a device-to-cloud message.  
  
## Request  
 See [Common parameters and headers](device-messaging-rest-apis.md#bk_common) for headers and parameters that are used by all IoT Hub messaging requests.  
  
|Method|Request URI|  
|------------|-----------------|  
|*POST*|https://{IoTHubName}.azure-devices.net/devices/{deviceId}/messages/events?api-version={api-version}|  
  
 **Headers**  
  
 Headers are used to serialize message properties, as defined in [IoT Hub Developer Guide - Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#security).  
  
 IoTHub-MessageId: MessageId system property  
  
 IoTHub-CorrelationId: CorrelationId system property  
  
 IoTHub-UserId:  UserId system property  
  
 The following headers are also read into standard message properties:  
  
```  
Content-Type  
Content-Encoding  
```  
  
 Also, messages can include application properties, which are serialized in the following way.  
  
```  
IoTHub-app-{property name}: {property value}  
```  
  
 Note that all property names and values have to be valid header names and values as per HTTP/1 specifications.  
  
 **Body**  
  
 The body can be any octet-stream. Note that the size of the whole message (body plus properties) has to be less than 256 Kb.  
  
## Response  
 No body.  
  
 **Status code**: *204*