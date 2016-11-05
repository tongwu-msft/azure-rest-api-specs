---
title: "Delete a device identity"
ms.custom: ""
ms.date: "2015-10-20"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Event Hubs"
  - "IoT"
  - "Service Bus"
ms.assetid: 28b15352-be22-4502-a84e-1b627ff55454
caps.latest.revision: 10
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
# Delete a device identity
This method deletes a device identity.  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{IoTHubName}.azure-devices.net/devices/{deviceID}?api-version={api-version}`|  
  
 This request requires the `If-Match` header. The client may specify the ETag for the device identity on the request in order to compare to the ETag maintained by the service for the purpose of optimistic concurrency. The delete operation will be performed only if the ETag sent by the client matches the value maintained by the server, indicating that the device identity has not been modified since it was retrieved by the client.  
  
 To force an unconditional delete, set `If-Match` to the wildcard character (*).  
  
## Response  
 **Status code:** 204