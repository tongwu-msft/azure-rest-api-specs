---
title: "Export device identities1"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c78edbb8-42e1-49f9-9dd9-9b9a5941bf5b
caps.latest.revision: 6
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
# Export device identities
Applies To: IoT Hub  
  
 This method exports all device identities in an IoT Hub identity registry to a blob container. For more information, see [IoT Hub Developer Guide – Export](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#importexport).  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Devices/IotHubs/{IotHubName}/exportDevices?api-version={api-version}`|  
  
```  
{  
	"ExportBlobContainerUri": "{exportBlobContainerUri}",  
	"ExcludeKeys": {excludeKeys}  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|exportBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output the status of the job and the results. (Refer to [Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/), and [Creating a Shared Access Signature in Java](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx).)|  
|excludeKeys|No|bool|2016-02-03|If true keys are set to null in export output; keys are exported normally otherwise. Default: true|  
  
## Response  
  
```  
{  
	"jobId": "{jobId}",  
	"startTimeUtc": "{}",  
	"endTimeUtc": "{}",  
	"type": "{type}",  
	"status": "{status}",  
	"progress": {progress},  
	"inputBlobContainerUri": "{inputBlobContainerUri}",  
	"exportBlobContainerUri": "{exportBlobContainerUri}",  
	"excludeKeys": "{excludeKeys}",  
	"failureReason": "{failureReason}"  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|jobId|Yes, read-only|string|2016-02-03|The id of the newly created job. Used to retrieve updated state and cancel this job.|  
|startTimeUtc|No, read-only|string|2016-02-03|Date and time of when this job started. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|endTimeUtc|No, read-only|string|2016-02-03|Date and time of this job finished execution. In [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|type|Yes, read-only|string|2016-02-03|“import” or “export”|  
|status|Yes, read-only|string|2016-02-03|“enqueued” or “running” or “completed” or “failed” or “cancelled”|  
|progress|Yes, read-only|string|2016-02-03|Percentage of job completion.|  
|inputBlobContainerUri|No, only for import jobs|string|2016-02-03|Blob Shared Access Signature URI with read access to a blob container. This is used to input in import jobs.|  
|exportBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output results and possible errors.|  
|excludeKeys|No, only for export jobs|bool|2016-02-03|If true keys are set to null in export output; keys are exported normally otherwise. Default: true|  
|failureReason|Yes, read-only|string|2016-02-03|If status = failure, a string containing the reason.|  
  
 Status code: 200