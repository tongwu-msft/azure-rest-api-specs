---
title: "Import device identities"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 785fb7b6-8c39-4caa-8e22-99edebcc5ae8
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
# Import device identities
This method enables bulk updates (creation, update, deletion) of device identities from IoT Hub identity registry. It takes a blob as an input parameter. For more information, see [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#import-device-identities).  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/importDevices?api-version={api-version}|  
  
```  
{  
	"inputBlobContainerUri": "{inputBlobContainerUri}",  
"exportBlobContainerUri ": "{exportBlobContainerUri}",  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|inputBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with read access to a blob container. This blob contains the operations to be performed on the identity registry as detailed in [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#import-device-identities). (Refer to [Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/), and [Creating a Shared Access Signature in Java)](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx)|  
|exportBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output the status of the job and the results. (Refer to [Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/), and [Creating a Shared Access Signature in Java)](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx)|  
  
## Response  
 Status code: 202  
  
 The Iot Hub resource provider will always return a 202 Accepted status code with valid Location and Retry-After headers. The RP will also set the Azure-AsyncOperation header with a URL that points to the operation resource for this operation.  
  
 To retrieve the status of the operation, you must poll the URL returned in the Location header after the Retry-After interval.