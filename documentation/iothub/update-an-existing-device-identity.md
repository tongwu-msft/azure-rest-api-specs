---
title: "Update an existing device identity"
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
ms.assetid: f223382e-ba09-4562-8086-cbd84ba60747
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
# Update an existing device identity
Updates an existing device identity.  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{IoTHubName}.azure-devices.net/devices/{deviceId}?api-version={api-version}`|  
  
```json  
{   
 deviceId: "{deviceId}",   
 auth: {   
  symKey: {   
   primary: "{symmetricKey}",   
   secondary: "{symmetricKey2}"   
  }   
 },   
 status: "{deviceStatus}",   
 statusReason: "{statusReason}"   
}  
  
```  
  
## Response  
 The body will contain all the properties of the device identity that have been created.  
  
```json  
{  
		deviceId: "{deviceId}",  
		generationId: "{generationId}",  
		etag: "{deviceEtag}",  
		auth: {  
			symKey: {  
				primary: "{symmetricKey}",  
				secondary: "{symmetricKey2}"  
			}  
		},  
		status: "{deviceStatus}",  
		statusReason: "{statusReason}",  
		statusUpdateTime: "{statusUpdateTime}"  
		connectionState: "{connectionState}",  
		connectionStateUpdatedTime: "{connectionStateUpdatedTime}",  
		lastActivityTime: "{lastActivityTime}"  
	}  
  
```  
  
 Note that `generationId` and `deviceId` will be overwritten on the server side, even if you try to change it.  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|generationId|Yes, read-only|string|2015-08-15-preview|An IoT hub-generated case-sensitive string (up to 128 char long). Used to distinguish devices with the same deviceId when they have been deleted and recreated.|  
|etag|Yes, read-only|string|2015-08-15-preview|A string representing a weak etag for the device identity, as per [RFC7232](https://tools.ietf.org/html/rfc7232).|  
|statusUpdateTime|Yes, read-only|string|2015-08-15-preview|Date and time of last time the status was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|connectionState|Yes, read-only|string|2015-08-15-preview|“connected” or “disconnected”, represents the IoT Hub view of the device connection status.|  
|connectionStateUpdatedTime|Yes, read-only|string|2015-08-15-preview|Date and time of last time the connection state was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC; for example, 2015-01-28T16:24:48.789Z|  
|lastActivityTime|Yes, read-only|string|2015-08-15-preview|Datetime of last time the device connected, received or sent a message. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
  
 `Status code`: 200