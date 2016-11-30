---
title: "Get consumer group1"
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
ms.assetid: b5d42620-ab79-4635-bca4-f1d5905fc064
caps.latest.revision: 6
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Get consumer group
Returns a consumer group [description](https://msdn.microsoft.com/library/microsoft.servicebus.messaging.consumergroupdescription.aspx) for the specified consumer group.  
  
## Request  
 See [Common parameters and headers](consumer-groups.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumerGroupName}?api-version={api-version}`|  
  
## Response  
  
```  
{    
   "id":"/subscriptions/{subscriptionId}/resourcegroups/{resourceGroups}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumergroupName}",  
   "name":"consumergroupName",  
   "type":"Microsoft.EventHub/ConsumerGroups",  
   "location":"location",  
   "properties":{    
      "createdAt":"TimeSpan",  
      "updatedAt":"TimeSpan"  
   }  
}  
```  
  
|Element|Description|  
|-------------|-----------------|  
|id|The identifying URL of the resource.|  
|name|The name of the consumer group.|  
|type|The type of the resource.|  
|location|The supported Azure location in which the resource exists. For more information, see the [list of available Azure geo-locations](https://azure.microsoft.com/regions/).|  
|properties|Represents the metadata description of the consumer group. See [ConsumerGroupDescription Properties](http://msdn.microsoft.com/en-us/cfaf336c-de16-4a1d-b487-416fe94a6bb2).|  
  
 **Status code:**  
  
|Code|Description|  
|----------|-----------------|  
|200|Successfully retrieved the consumer group description.|  
|404|The specified consumer group does not exist.|  
|500|Internal error.|