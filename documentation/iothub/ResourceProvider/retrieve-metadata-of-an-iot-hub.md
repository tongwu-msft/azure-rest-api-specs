---
title: "Retrieve metadata of an IoT Hub"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 963b6aaa-bfff-41ad-ba7e-ad43c7bf9ce5
caps.latest.revision: 6
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
# Retrieve metadata of an IoT Hub
This method retrieves non-security-related metadata of an IoT Hub.  
  
## Request  
 See [Common parameters and headers](../resourceprovider/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*GET*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}?api-version={api-version}`|  
  
## Response  
 The body will contain all the non-security properties of the IoT hub. Security-related properties will be set to null.  
  
 Refer to the “[Create a new IoT Hub](../resourceprovider/create-a-new-iot-hub.md)” operation for the description of the properties in the response body.  
  
```  
  
{  
	"id": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}",  
	"name": "{IotHubName}",  
    "type": "Microsoft.Devices/IotHubs",  
"tags": {  
        "Owner": "{owner}",  
        "UID": "{uid}",  
},  
	"location":"{region}}",  
	"resourceGroupName": "{resourceGroupName}",  
	"etag": "{etag}",  
	"properties":  
		"state": 1,  
		"provisioningState": "Active"  
		"authorizationPolicies": null,  
		"hostName": "eliohub.azure-devices.net",  
		"eventHubEndpoints": {  
			"events": {  
				"messageRetentionInDays": {d2c retention in days},  
				"partitionCount": {d2c partition count},  
			}  
		},  
		"cloudToDevice": {  
			"defaultTtlAsIso8601": "{c2d default TTL}",  
			"maxDeliveryCount": {c2d max delivery count},  
			"feedback": {  
				"maxDeliveryCount": {max delivery count for feedback},  
				"ttlAsIso8601": "{ttl of feedback}",  
				"lockDurationAsIso8601": "{default lock duration}"  
			}  
		}  
	,  
	"sku":  
	{  
			"name":"{sku name}",  
			"capacity":{units}  
	}  
}  
  
```  
  
 **Status code**: *200*  
  
 This is a synchronous operation. Returns 404 if the IoT hub is not found.