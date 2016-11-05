---
title: "Update a service group"
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
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: 5dfe2b30-94e4-4ed0-b1e9-dcea4ec3a70b
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
# Update a service group
Updates a Service Fabric service group.  
  
## Request  
 See [Common parameters and headers](../ServiceFabricREST/service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/UpdateServiceGroup?api-version={api-version}`|  
|POST|`<URI>/ServiceGroups/{service-name}/$/Update?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|application-name|Yes|Application to which the service belongs to|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ServiceKind|Yes|Number|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|Flags|Yes|Number|The Service update flags. This indicates which parameters for the service needs to be updated.|  
|TargetReplicaSetSize|No|Number|For Stateful service, the target replica set size|  
|MinReplicaSetSize|No|Number|For Stateful service, the min replica set size.|  
|InstanceCount|No|Number|For Stateless service, the instance count.|  
|ReplicaRestartWaitDurationInMilliseconds|No|Number|For Stateful service, Replica restart wait duration.|  
|QuorumLossWaitDurationInMilliseconds|No|Number|For Stateful service, the Quorum loss wait duration.|  
|StandByReplicaKeepDurationInMilliseconds|No|Number|For Stateful service, the Standby replica keep alive duration.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).