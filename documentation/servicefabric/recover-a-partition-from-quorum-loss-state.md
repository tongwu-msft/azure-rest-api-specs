---
title: "Recover a partition from quorum loss state"
ms.custom: ""
ms.date: "2016-03-30"
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
ms.assetid: a7806b65-48b8-4d92-a7b2-9d4fc3db10ec
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
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
# Recover a partition from quorum loss state
Recovers partition(s) from quorum loss.  
  
## Request  
 See [Partition](../ServiceFabricREST/partition.md) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|The following URI recovers all partitions that are in quorum loss:<br /><br /> `<URI>/$/RecoverAllPartitions?api-version={api-version}`|  
|POST|The following URI recovers all system service partitions that are in quorum loss:<br /><br /> `<URI>/$/RecoverSystemPartitions?api-version={api-version}`|  
|POST|The following URIs recover all partitions of the given service that are in quorum loss:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/$/{service-name}/$/GetPartitions/$/Recover?api-version={api-version}`<br /><br /> `<URI>/Services/$/{service-name}/$/GetPartitions/$/Recover?api-version={api-version}`|  
|POST|The following URIs recover the given partition if it is in the state of quorum loss:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/$/{service-name}/$/GetPartitions/$/{partition-id}/$/Recover?api-version=1.0`<br /><br /> `<URI>/Services/$/{service-name}/$/GetPartitions/$/{partition-id}/$/Recover?api-version=1.0`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).