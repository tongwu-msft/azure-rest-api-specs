---
title: "Complete a cloud-to-device message"
ms.custom: ""
ms.date: "2016-02-02"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 248546f9-52fa-4f63-b904-c9b376750fdc
caps.latest.revision: 8
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
# Complete a cloud-to-device message
This method completes a cloud-to-device message. A completed message is deleted from the device message queue, and, if requested, a positive acknowledgment is sent to the application back-end. See [Azure IoT Hub Developer Guide – Messaging](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#messaging) for more information.  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-messaging-rest-apis.md#bk_common) for headers and parameters that are used by all IoT Hub messaging requests.  
  
|Method|Request URI|  
|------------|-----------------|  
|*DELETE*|https://{IoTHubName}.azure-devices.net/devices/{deviceId}/messages/devicebound/{message lock id, from the received etag}?api-version={api-version}|  
  
## Response  
 **Status code**: *204*