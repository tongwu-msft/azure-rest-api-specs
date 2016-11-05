---
title: "Cancel import-export job"
ms.custom: ""
ms.date: "2016-03-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "iot-hub"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "IoT"
ms.assetid: 1410eab6-a569-4625-b103-f7afe20b43cc
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
# Cancel import-export job
This method cancels an import or export job. For more information, see [IoT Hub Developer Guide – Import](https://azure.microsoft.com/documentation/articles/iot-hub-devguide/#import-device-identities).  
  
## Request  
 See [Common parameters and headers](../IoTREST/device-identities-rest.md#bk_common) for headers and parameters that are used by all requests related to IoT Hub.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://{IoTHubName}.azure-devices.net/jobs/{jobId}?api-version={api-version}`|  
  
 No body  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|jobId|Yes|string|2016-02-03|Id of the job to retrieve|  
  
## Response  
 Status code: 204