---
title: "List IoT hubs in a subscription"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c67cf8c2-e249-41c8-bec3-f4f522f89e7f
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
# List IoT hubs in a subscription
This method retrieves all IoT hubs in a subscription.  
  
## Request  
 See [Common parameters and headers](../IoTHubResourceProviderREST/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*GET*|`https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Devices/IotHubs?api-version={api-version}`|  
  
## Response  
 Body contains a JSON-serialized array with IoT Hub metadata (same as fetching a single IoT hub). IoT Hub resource provider does not support paging.  
  
 Refer to the “[Create a new IoT Hub](../IoTHubResourceProviderREST/create-a-new-iot-hub.md)” operation for the description of the properties in the response body.  
  
```  
  
 [  
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
	]  
  
```  
  
 **Status code**: *200*  
  
 This is a synchronous operation.