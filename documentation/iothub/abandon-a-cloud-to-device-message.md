---
title: "Abandon a cloud-to-device message"
ms.custom: ""
ms.date: "2016-02-02"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 4de18483-0adb-4bbb-84d8-b8352a5d2700
caps.latest.revision: 6
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
# Abandon a cloud-to-device message
This method completes a cloud-to-device message. A completed message is deleted from the device message queue, and, if requested, a negative acknowledgment is sent to the application back-end. See [IAzure IoT Hub Developer Guide – Messaging](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#messaging) for more information.  
  
## Request  
 See [Common parameters and headers](device-messaging-rest-apis.md#bk_common) for headers and parameters that are used by all IoT Hub messaging requests.  
  
|Method|Request URI|  
|------------|-----------------|  
|*POST*|https://{IoTHubName}.azure-devices.net/devices/{deviceId}/messages/devicebound/{message lock id, from the received etag}/abandon?&api-version={api-version}|  
  
## Response  
 **Status code**: *204*