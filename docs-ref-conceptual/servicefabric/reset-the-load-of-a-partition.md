---
title: "Reset the load of a partition"
ms.custom: ""
ms.date: "2017-02-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
ms.assetid: ef7012bb-f781-4540-897f-09d8df7fdcc6
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Reset the load of a partition
Reset the  load of a Service Fabric partition to its default value.  
  
## Request  
 See [Partition](partition.md) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions/{partition-id}/$/ResetLoad?api-version=1.0`|  
|POST|`<URI>/Services/{service-name}/$/GetPartitions/{partition-id}/$/ResetLoad?api-version=1.0`|  
|POST|`<URI>/Partitions/{partition-id}/$/ResetLoad?api-version=1.0`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example resets the load of a specified partition da10ff1c-c69a-4ac8-8e5f-19264f807f6c to it's default load. The localhost:19007 is the endpoint of the http gateway.  
  
```  
http://localhost:19007/Partitions/da10ff1c-c69a-4ac8-8e5f-19264f807f6c/$/ResetLoad?api-version=1.0  
  
```