---
title: "Delete an IoT Hub"
ms.custom: ""
ms.date: "2016-11-14"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 5be0e3b2-91c4-464e-a04b-d3cb03e0e69d
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
# Delete an IoT Hub
This method deletes an IoT Hub.  
  
## Request  
 See [Common parameters and headers](../resourceprovider/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*DELETE*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}?api-version={api-version}`|  
  
## Response  
 **Status code**: *202*  
  
 The Iot Hub resource provider will always return a 202 Accepted status code with valid Location and Retry-After headers. The RP will also set the Azure-AsyncOperation header with a URL that points to the operation resource for this operation.  
  
 Subsequent GET attempts on the resource after a DELETE operation will return a resource representation which indicates a transitional provisioning State (e.g. Terminating).  
  
 To retrieve the status of the operation, users can either poll the URL returned in the Location header after the Retry-After interval or get the IoT Hub service status directly or query the operation resource.