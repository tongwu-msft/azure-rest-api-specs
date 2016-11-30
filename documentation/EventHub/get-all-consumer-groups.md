---
title: "Get all consumer groups"
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
ms.assetid: a814c455-895b-49e0-9771-4dfef7a046ca
caps.latest.revision: 7
author: "sethmanheim"
ms.author: "sethm"
manager: "timlt"
---
# Get all consumer groups
Enumerates the consumer groups in a namespace. An empty feed is returned if no consumer group exists in the namespace.  
  
## Request  
 See [Common parameters and headers](consumer-groups.md#bk_common) for headers and parameters that are used by all requests related to Event Hubs.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups?api-version={api-version}`|  
  
## Response  
  
```  
{    
   "value":[    
     {    
	   "id":"/subscriptions/{subscriptionId}/resourcegroups/{resourceGroups}/providers/Microsoft.EventHub/namespaces/{namespaceName}/eventhubs/{eventHubName}/consumergroups/{consumergroupName}",  
	   "name":"consumergroupName",  
	   "type":"Microsoft.EventHub/ConsumerGroups",  
	   "location":"location",  
	   "properties":{    
		  "createdAt":"TimeSpan",  
		  "updatedAt":"TimeSpan"  
	   }  
	},  
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
   ],  
   "nextLink":null  
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
|200|Successfully retrieved list of consumer groups.|  
|500|Internal error.|