---
title: "Export device identities2"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 9cb3e181-694d-4585-a766-83a5f5b8e275
caps.latest.revision: 9
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
# Export device identities
This method exports all device identities in an IoT Hub identity registry to a blob container. For more information, see [IoT Hub Developer Guide – Export](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#importexport).  
  
## Request  
 See [Common parameters and headers](../IoTHubResourceProviderREST/iot-hub-resource-provider-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|*POST*|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/exportDevices?api-version={api-version}`|  
  
```  
{  
	"outputBlobContainerUri ": "{exportBlobContainerUri}",  
	"excludeKeysInExport ": {excludeKeys}  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|exportBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output the status of the job and the results. (refer to[Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/) , and [Creating a Shared Access Signature in Java](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx))|  
|excludeKeys|No|bool|2016-02-03|If `true`, keys are set to `null` in export output; keys are exported normally otherwise. Default: `true`.|  
  
## Response  
 **Status code**: *202*  
  
 The Iot Hub resource provider will always return a 202 Accepted status code with valid Location and Retry-After headers. The RP will also set the Azure-AsyncOperation header with a URL that points to the operation resource for this operation.  
  
 To retrieve the status of the operation, you must poll the URL returned in the Location header after the Retry-After interval.