---
title: "Retrieve security metadata of an IoT Hub"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: eb70b708-4c9f-4fa9-828d-4514f02c8c6f
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
# Retrieve security metadata of an IoT Hub
This method retrieves security-related metadata of an IoT Hub.  
  
## Request  
 See [Common parameters and headers](../IoTHubResourceProviderREST/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*POST*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/IoTHubKeys/listkeys?api-version={api-version}`|  
  
## Response  
 The body will contain all the security properties of the IoT hub.  
  
 Refer to the “[Create a new IoT Hub](../IoTHubResourceProviderREST/create-a-new-iot-hub.md)” operation for the description of the properties in the response body.  
  
```  
  
{  
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
}  
  
```  
  
 **Status code**: *200*  
  
 This is a synchronous operation. Returns 404 if the IoT hub is not found.