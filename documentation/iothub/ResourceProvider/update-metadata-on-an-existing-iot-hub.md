---
title: "Update metadata on an existing IoT Hub"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d29cfafd-12bc-4a5b-b0f5-065cad4ec21d
caps.latest.revision: 8
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
# Update metadata on an existing IoT Hub
This method is used to update the following metadata on an existing IoT hub:  
  
-   Update Shared Access Policies of an IoT Hub  
  
-   Update Tier or provisioned units of an IoT Hub  
  
-   Update messaging properties of an IoT Hub  
  
-   Update tags on an IoT Hub  
  
 The usual pattern to modify a property is to retrieve the IoT hub metadata and security metadata, and then combine them in a new body to update all.  
  
## Request  
 See [Common parameters and headers](../resourceprovider/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*PUT*|https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}?api-version={api-version}|  
  
```  
{  
	"tags":{},  
	"location":"{region}",  
	"properties":  
		"authorizationPolicies": [  
			{  
				"name": "{policy name}",  
				"primaryKey" : "{symmetric key}",  
				"secondaryKey": "{symmetric key}",  
				"permissions": [  
					"ServiceConnect",  
					"RegistryRead",  
					"RegistryWrite",  
					"DeviceConnect"  
				]  
			}  
		],  
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
				"ttlAsIso8601": "{ttl of feedback messages}",  
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
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|authorizationPolicies|No|JSON array|2016-02-03|If not present, IoT Hub will have default authorization policies as specified in [IoT Hub Developer Guide](https://azure.microsoft.com/documentation/articles/iot-hub-devguide).|  
|Policy name|Yes, when specifying authorization policies.|string|2016-02-03|Name of the shared access policy to create.|  
|Symmetric key|No|string|2016-02-03|These are the symmetric keys for the shared access policies. 256bit key, base64 encoded.|  
|Permissions|Yes, when specifying authorization policies.|JSON array|2016-02-03|Any combination of: "ServiceConnect", "RegistryRead", "RegistryWrite", "DeviceConnect".|  
|eventHub endpoints|No|JSON object|2016-02-03|See [IoT Hub Developer Guide – Device to Cloud messaging](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#d2c), for specific parameter use.|  
|cloudToDevice|No|JSON object|2016-02-03|See [IoT Hub Developer Guide – Device to Cloud messaging](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#d2c), for specific parameter use.|  
|Sku name|Yes, if Units is present.|string|2016-02-03|One of the supported SKU: “F1”, “S1”, “S2”.|  
|Units|Yes, if Sku is present.|int|2016-02-03|1 if F1. Up to maximum amount allowed for your subscription for other SKUs. For more information, see [IoT Hub Pricing](https://azure.microsoft.com/pricing/details/iot-hub/).|  
  
## Response  
 The body will contain all the properties that are in the created IoT hub.  
  
```  
  
{  
	"tags":{},  
	"location":"{region}}",  
	"properties":  
		"state": 1,  
		"provisioningState": "Active"  
		"authorizationPolicies": [  
			{  
				"name": "{policy name}",  
				"primaryKey" : "{symmetric key}",  
				"secondaryKey": "{symmetric key}",  
				"permissions": [  
					"ServiceConnect",  
					"RegistryRead",  
					"RegistryWrite",  
					"DeviceConnect"  
				]  
			}  
		],  
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
  
 **Status code**: 201  
  
 This is a long running operation; hence the operation returns a 201 if the validation is complete, and contains the Azure-AsyncOperation header containing the location of the status URI. The clients are expected to poll for the status using the operation. If successful, the operation returns HTTP status code of 201 (OK).