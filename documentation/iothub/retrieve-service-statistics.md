---
title: "Retrieve service statistics"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 733fa445-3a68-4bdb-bd0d-c60f457d1410
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
# Retrieve service statistics
Retrieves service statistics for this IoT hub.  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/statistics/service?api-version={api-version}`|  
  
## Response  
 The body will contain service statistics for the device identities that have been created.  
  
```  
{  
	“totalConnectedDevices”: { totalConnectedDevices },  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|totalConnectedDevices|Yes|integer|2016-02-03|Number of devices currently connected to this IoT hub.|  
  
 `Status code`: 200