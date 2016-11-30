---
title: "Create consumer group1"
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
ms.assetid: 2ae2808a-bd74-4cdb-8f4d-ee62e965ff3c
caps.latest.revision: 6
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Create consumer group
Creates a new consumer group as a nested resource within a namespace.  
  
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
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|location|Yes|String|The location of the resource. For more information, see the [list of available Azure geo-locations](https://azure.microsoft.com/regions/).|  
|type|No|string|ARM type of the resource.|  
|name|No|string|Name of the consumer group.|  
|properties|No|String|Represents the metadata description of the consumer group. See [ConsumerGroupDescription Properties](http://msdn.microsoft.com/en-us/cfaf336c-de16-4a1d-b487-416fe94a6bb2).|  
  
## Response  
  
```  
{    
   "id":"/subscriptions/{subscriptionId}/resourcegroups/{resourceGroups}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumergroupName}",  
   "name":"consumergroupName",  
   "type":"Microsoft.EventHub/ConsumerGroups",  
   "location":"location",  
   "tags":null,  
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
|200|Consumer group created.|  
|400|Invalid request body.|  
|403|Quota exceeded; consumer group not created.|  
|500|Internal error.|