---
title: "Import or update device identities"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 658e753a-9426-4673-a96c-5d84a9c6b1d7
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
# Import or update device identities
Applies To: IoT Hub  
  
 This method enables bulk updates (creation, update, deletion) of device identities from IoT Hub identity registry. It takes a blob as an input parameter. For more information, see [IoT Hub Developer Guide – Import](https://azure.microsoft.com/en-us/documentation/articles/iot-hub-devguide/#import-device-identities).  
  
## Request  
 See [Common parameters and headers](device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/importdevices?api-version={api-version}`|  
  
```  
{  
	"inputBlobContainerUri": "{inputBlobContainerUri}",  
"outputBlobContainerUri ": "{exportBlobContainerUri}",  
}  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|inputBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with read access to a blob container. This blob contains the operations to be performed on the identity registry as detailed in [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide#import-device-identities). (refer to [Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/), and [Creating a Shared Access Signature in Java)](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx)|  
|exportBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output the status of the job and the results. (refer to [Create and Use a SAS with the Blob Service](https://azure.microsoft.com/en-us/documentation/articles/storage-dotnet-shared-access-signature-part-2/), and [Creating a Shared Access Signature in Java)](https://msdn.microsoft.com/en-us/library/azure/Hh875756.aspx)|  
  
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
|startTimeUtc|No, read-only|string|2016-02-03|Date and time of when this job started. In ISO8601  datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|endTimeUtc|No, read-only|string|2016-02-03|Date and time of this job finished execution. In ISO8601  datetime format in UTC, e.g. 2015-01-28T16:24:48.789Z|  
|type|Yes, read-only|string|2016-02-03|“import” or “export”|  
|status|Yes, read-only|string|2016-02-03|“enqueued” or “running” or “completed” or “failed” or “cancelled”|  
|progress|Yes, read-only|string|2016-02-03|Percentage of job completion.|  
|inputBlobContainerUri|No, only for import jobs|string|2016-02-03|Blob Shared Access Signature URI with read access to a blob container. This is used to input in import jobs.|  
|outputBlobContainerUri|Yes|string|2016-02-03|Blob Shared Access Signature URI with write access to a blob container. This is used to output results and possible errors.|  
|excludeKeysInExport|No, only for export jobs|bool|2016-02-03|If `true` keys are set to null in export output; keys are exported normally otherwise. Default: `true`|  
|failureReason|Yes, read-only|string|2016-02-03|If status = failure, a string containing the reason.|  
  
 Status code: 200