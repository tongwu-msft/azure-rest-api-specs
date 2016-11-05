---
title: "Receive a cloud-to-device message"
ms.custom: ""
ms.date: "2015-10-16"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: f8891261-e7ef-4f04-886d-57e509c21bdc
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
# Receive a cloud-to-device message
This method is used to retrieve a cloud-to-device message.  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-messaging-rest-apis.md#bk_common) for headers and parameters that are used by all IoT Hub messaging requests.  
  
|Method|Request URI|  
|------------|-----------------|  
|*GET*|https://{IoTHubName}.azure-devices.net/devices/{deviceId}/messages/devicebound?api-version={api-version}|  
  
 **Headers**  
  
 IoTHub-MessageLockTimeout: [Optional] In case a message returned to this call, this specifies the amount of time, the message will be invisible to other receive calls. See [IoT Hub Developer Guide - Security](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#security).  
  
 **Body**  
  
 None  
  
## Response  
 **Headers**  
  
 Etag: this is the id for the message lock used to resolve races when completing, rejecting, or abandoning the message.  
  
 IoTHub-SequenceNumber: message sequence number (assigned by IoTHub, it is unique per cloud-to-device message queue)  
  
 IoTHub-EnqueuedTime: Time when the message was received by IoTHub. Format is [ISO8601](http://en.wikipedia.org/wiki/ISO_8601)  
  
 IoTHub-ExpiryTime  
  
 IoTHub-Ack  
  
 Headers will contain the message properties as set by the sender. More information in Azure [IoT Hub Developer Guide – Messaging](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#messaging):  
  
 IoTHub-MessageId: MessageId system property  
  
 IoTHub-CorrelationId: CorrelationId system property  
  
 IoTHub-UserId:  UserId system property  
  
 IoTHub-To:  UserId system property  
  
 Content-Type: Content-Type message property  
  
 Content-Encoding: Content-Encoding message property  
  
 Also, all application properties are received in the following way.  
  
 IoTHub-app-{property name}: {property value}  
  
 **Body**  
  
 The body can be any octet-stream. Note that the size of the whole message (body plus properties) has to be less than 256 Kb.  
  
 **Status code**: *200*