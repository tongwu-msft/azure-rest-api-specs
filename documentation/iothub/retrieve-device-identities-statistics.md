---
title: "Retrieve device identities statistics"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: ff688d95-d284-4df6-a543-930a8ae76660
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
# Retrieve device identities statistics
Retrieves statistics about device identities in the IoT hub’s identity registry.  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/statistics/devices?api-version={api-version}`|  
  
## Response  
 The body will contain statistics for the device identities that have been created.  
  
```  
{  
 “totalDeviceCount”: {total device identities},  
 “totalDevicesByStatus”: {  
		“enabled”: {enabled device identities},  
		“disabled”: {disabled device identities}  
	}  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|total device identities|Yes|integer|2016-02-03|Number of device identities in identity registry.|  
|enabled device identities|No|integer|2016-02-03|Number of device identities in identity registry with status equal to “Enabled.”|  
|disabled device identities|No|integer|2016-02-03|Number of device identities in identity registry with status equal to “Disabled.”|  
  
 `Status code`: 200