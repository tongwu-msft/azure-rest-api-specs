---
title: "Create a new device identity"
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
ms.assetid: 9893003e-176d-41c5-a1b3-b9c58db0ee35
caps.latest.revision: 17
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
# Create a new device identity
Creates a new device identity in the identity registry of an IoT Hub.  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://{IoTHubName}.azure-devices.net/devices/{deviceId}?api-version={api-version}`|  
  
```  
{  
  deviceId: "{deviceId}",  
  authentication: {  
   symmetricKey: {  
    primaryKey: "{symmetricKey}",  
			 secondaryKey: "{symmetricKey2}"  
		 }  
 	},  
	 status: "{deviceStatus}",  
	 statusReason: "{statusReason}"  
 }  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|deviceId|Yes|string|2015-08-15-preview|A case-sensitive string ( up to 128 char long) of ASCII 7-bit alphanumeric chars + {'-', ':', '.', '+', '%', '_', '#', '*', '?', '!', '(', ')', ',', '=', '@', ';', '$', '''}.|  
|authentication|No|Complex object|2015-08-15-preview|If not present, IoT Hub will create two symmetric keys.|  
|symKey|No|Complex object|2015-08-15-preview|Enables per-device symmetric key authentication for this device. If not present, device can connect only through hub-level shared access policies. For more information, see “IoT Hub Developer Guide – security.”|  
|symmetricKey|Yes, if symKey is present.|Base64-encoded byte arrays. Length 128 to 512 bits.|2015-08-15-preview|These are the symmetric keys for the device.|  
|deviceStatus|No|String|2015-08-15-preview|Device status “enabled” or “disabled. As per “IoT Hub Developer Guide – device identities.”|  
|statusReason|No|UTF-8 string, up to 128 characters.|2015-08-15-preview|A string of user metadata.|  
  
## Response  
 The body will contain all the properties of the device identity that has been created.  
  
```  
  
{  
  deviceId: "{deviceId}",  
  generationId: "{generationId}",  
  etag: "{etag}",  
  auth: {  
	  symmetricKey: {  
		  primary: "{symmetricKey}",  
		  secondary: "{symmetricKey2}"  
	  }  
  },  
  status: "{deviceStatus}",  
  statusReason: "{statusReason}",  
  statusUpdatedTime: "{statusUpdatedTime}"  
  connectionState: "{connectionState}",  
  connectionStateUpdatedTime: "{connectionStateUpdatedTime}",  
  lastActivityTime: "{lastActivityTime}"  
  }  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|generationId|Yes, read-only|string|2015-08-15-preview|An IoT hub-generated case-sensitive string (up to 128 char long). Used to distinguish devices with the same deviceId when they have been deleted and recreated.|  
|etag|Yes, read-only|string|2015-08-15-preview|A string representing a weak etag for the device identity, as per [RFC7232](https://tools.ietf.org/html/rfc7232).|  
|statusUpdateTime|Yes, read-only|string|2015-08-15-preview|Date and time of last time the status was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|connectionState|Yes, read-only|string|2015-08-15-preview|“connected” or “disconnected”, represents the IoT Hub view of the device connection status.|  
|connectionStateUpdatedTime|Yes, read-only|string|2015-08-15-preview|Date and time of last time the connection state was updated. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC; for example, 2015-01-28T16:24:48.789Z|  
|lastActivityTime|Yes, read-only|string|2015-08-15-preview|Datetime of last time the device connected, received or sent a message. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|cloudToDeviceMessageCount|Yes, read-only|integer|2015-08-15-preview|Number of pending commands that are in the device command queue.|  
  
 `Status code`: 201