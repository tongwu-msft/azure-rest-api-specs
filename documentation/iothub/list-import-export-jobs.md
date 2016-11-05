---
title: "List import-export jobs"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 1eef0a2b-2f10-403d-9549-db0f5ae01e68
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
# List import-export jobs
Applies To: IoT Hub  
  
 This method lists all import or export jobs for an IoT hub. For more information, see [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#import-device-identities).  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{IoTHubName}.azure-devices.net/jobs?api-version={api-version}`|  
  
## Response  
 JSON array with job description as described in [Retrieve import-export job](../IoTREST/retrieve-import-export-job.md).  
  
 Status code: 200