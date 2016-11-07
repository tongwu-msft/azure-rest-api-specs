---
title: "Delete a D2C Consumer Group"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 862b6612-b748-4748-8258-7424818824a4
caps.latest.revision: 7
author: "dominicbetts"
ms.author: "dobett"
manager: "carmonm"
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
# Delete a D2C Consumer Group
This method deletes a device-to-cloud (D2C) consumer group from an IoT hub.  
  
## Request  
 See [Common parameters and headers](../IoTHubResourceProviderREST/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*DELETE*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/events/ConsumerGroups/{consumerGroupName}?api-version={api-version}`|  
  
## Response  
 **Status code**: *204*  
  
 This is a synchronous operation. Returns 404 if the IoT hub is not found.