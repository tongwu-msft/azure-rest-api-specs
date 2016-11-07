---
title: "List device identities"
ms.custom: ""
ms.date: "2016-03-03"
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
ms.assetid: 8f85baec-7043-484b-a18c-051dab52a069
caps.latest.revision: 9
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
# List device identities
This method retrieves up to 1000 device identities from an IoT hub. If you want to export all the identities, see [IoT Hub Developer Guide – Export](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#importexport).  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/devices?top={top}&api-version={api-version}`|  
  
 Where `top` specifies the maximum number of device identities to return. Any value outside the range of 1-1000 is considered to be 1000.  
  
## Response  
 Body contains a JSON-serialized array with device identities.  
  
```  
  
{  
		deviceId: "{deviceId}",  
		generationId: "123",  
		etag: "abcdef",  
		auth: {  
			symKey: {  
				primary: "{symmetricKey}",  
				secondary: "{symmetricKey2}"  
			}  
},  
		status: "{deviceStatus}",  
		statusReason: "{statusReason}",  
		connectionState: "connected",  
		connectionStateUpdatedTime: "2015-02-28T16:24:48.789Z",  
		lastActivityTime: "2015-02-30T16:24:48.789Z"  
	},  
	...  
]  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|generationId|Yes, read-only|string|2016-02-03|An IoT Hub-generated case-sensitive string (up to 128 char long). Used to distinguish devices with the same device ID when they have been deleted and recreated.|  
|etag|Yes, read-only|string|2016-02-03|A string representing a weak etag for the device identity, as per [RFC7232](https://tools.ietf.org/html/rfc7232).|  
|statusUpdateTime|Yes, read-only|string|2016-02-03|Date and time of last time the status was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|connectionState|Yes, read-only|string|2016-02-03|“connected” or “disconnected”, represents the IoT Hub view of the device connection status.|  
|connectionStateUpdatedTime|Yes, read-only|string|2016-02-03|Date and time of last time the connection state was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC; for example, 2015-01-28T16:24:48.789Z|  
|lastActivityTime|Yes, read-only|string|2016-02-03|Datetime of last time the device connected, received or sent a message. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
  
 **Status code**: 200  
  
 This is a synchronous operation.