---
title: "Retrieve import-export job"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c9ec6ac0-8495-4b96-b8f4-72b72136f22e
caps.latest.revision: 5
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
# Retrieve import-export job
Applies To: IoT Hub  
  
 This method retrieves the properties of an import or export job. For more information, see [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#import-device-identities).  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/jobs/{jobId}?api-version={api-version}`|  
  
 No body  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|jobId|Yes|string|2016-02-03|Id of the job to retrieve|  
  
## Response  
  
```  
{  
	"jobId": "{jobId}",  
	"startTimeUtc": "{startTimeUtc}",  
	"endTimeUtc": "{endTimeUtc}",  
	"type": "{type}",  
	"status": "{status}",  
	"progress": {progress},  
	"inputBlobContainerUri": "{inputBlobContainerUri}",  
	"outputBlobContainerUri": "{outputBlobContainerUri}",  
	"excludeKeysInExport": "{excludeKeysInExport}",  
	"failureReason": "{failureReason}"  
}  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|jobId|Yes, read-only|string|2016-02-03|The id of the newly created job. Used to retrieve updated state and cancel this job.|  
|startTimeUtc|No, read-only|string|2016-02-03|Date and time of when this job started. In [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|endTimeUtc|No, read-only|string|2016-02-03|Date and time of this job finished execution. In [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|type|Yes, read-only|string|2016-02-03|“import” or “export”|  
|status|Yes, read-only|string|2016-02-03|“enqueued” or “running” or “completed” or “failed” or “cancelled”|  
|progress|Yes, read-only|string|2016-02-03|Percentage of job completion.|  
|inputBlobContainerUri|No, only for import jobs|string|2016-02-03|Blob Shared Access Signature URI with read access to a blob container. This is used to input in import jobs.|  
|outputBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output results and possible errors.|  
|excludeKeysInExport|No, only for export jobs|bool|2016-02-03|If `true` keys are set to null in export output; keys are exported normally otherwise. Default: `true`|  
|failureReason|Yes, read-only|string|2016-02-03|If status = failure, a string containing the reason.|  
  
 Status code: 200