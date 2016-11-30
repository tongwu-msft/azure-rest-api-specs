---
title: "Delete consumer group1"
ms.custom: ""
ms.date: "2016-08-12"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "event-hubs"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
helpviewer_keywords: 
  - "Event Hubs REST"
ms.assetid: 39e9f1e8-3fe3-4c71-b4dd-9b4b447c0aee
caps.latest.revision: 5
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Delete consumer group
Deletes a consumer group from the specified namespace, resource group, and Event hub.  
  
## Request  
 See [Common parameters and headers](consumer-groups.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumerGroupName}?api-version={api-version}`|  
  
## Response  
 **Status code:**  
  
|Code|Description|  
|----------|-----------------|  
|200|Consumer group deleted.|  
|404|The specified consumer group does not exist.|  
|500|Internal error.|