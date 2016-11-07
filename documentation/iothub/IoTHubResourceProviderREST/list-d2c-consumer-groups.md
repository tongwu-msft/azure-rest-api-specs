---
title: "List D2C Consumer Groups"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e83fce4f-e079-4cd6-a298-54c1be00b579
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
# List D2C Consumer Groups
This method retrieves all the device-to-cloud (D2C) consumer groups of an IoT Hub.  
  
## Request  
 See [Common parameters and headers](../IoTHubResourceProviderREST/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*GET*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/events/ConsumerGroups?api-version={api-version}`|  
  
## Response  
  
```  
[  
	"$default"  
]  
  
```  
  
 **Status code**: *200*  
  
 This is a synchronous operation. Returns 404 if the IoT hub is not found.