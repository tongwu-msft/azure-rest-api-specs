---
title: "Update consumer group"
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
ms.assetid: 613fcbb9-263c-46fa-8ee5-274ebc55fe50
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Update consumer group
Updates a consumer group in the specified namespace and resource group. You can update the **UserMetadata** and **EnableCheckpoint** properties. The semantics are the same as the [Create](create-consumer-group1.md) method.  
  
## Request  
 See [Common parameters and headers](consumer-groups.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumerGroupName}?api-version={api-version}`|  
  
```  
{    
   "name":"consumerGroupName ",  
   "type":"Microsoft.EventHub/ConsumerGroups",  
   "location":"someLocation",  
   "properties":{    
      "UserMetadata": “userMetaData”  
   }  
}  
```  
  
## Response  
 The response body is the same as the [Create](create-consumer-group1.md) operation.  
  
 **Status code:**  
  
|Code|Description|  
|----------|-----------------|  
|200|Consumer group updated.|  
|400|Invalid request body.|  
|500|Internal error.|