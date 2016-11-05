---
title: "Deactivate a node"
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
ms.assetid: 3ebfa166-f3c8-490a-81c3-2437a6a47201
caps.latest.revision: 14
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
# Deactivate a node
Deactivate a Service Fabric cluster node with the specified deactivation intent.  
  
 Once the deactivation is in progress, the deactivation intent can be “increased” but not decreased (for example, a node which is was deactivated with the Pause intent can be deactivated further with Restart, but not the other way around. Nodes may be reactivated using the [Activate a node](../ServiceFabricREST/activate-a-node.md) operation any time after they are deactivated. If the deactivation is not complete this will cancel the deactivation. A node which goes down and comes back up while deactivated will still need to be reactivated before services will be placed on that node.  
  
## Request  
 See [Common parameters and headers](25e94f89a-bd8e-4a3b-9274-46934469c073) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Nodes/{node-name}/$/Deactivate?api-version={api-version}`|  
  
```  
{  
    "DeactivationIntent":  <value>  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|DeactivationIntent|Yes|Number|Describes the intent or reason for the node being shut down.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node deactivation intent is invalid. All Service Fabric enumerations have the invalid type. The value is zero. This value is not used.<br />-   Pause - Indicates that the node should be paused. The value is 1.<br />-   Restart - Indicates that the intent is for the node to be restarted after a short period of time. The value is 2.<br />-   RemoveData - Indicates the intent is for the node to remove data. The value is 3.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).