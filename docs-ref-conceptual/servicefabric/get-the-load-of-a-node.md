---
title: "Get the load of a node"
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
ms.assetid: 41fa2d42-7541-4f66-86ca-c4373ebc3770
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get the load of a node
Gets the load of the specified Service Fabric node.  
  
## Request  
 See [Partition](partition.md) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Nodes/{node-name}/$/GetHealth?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{    
   "NodeName":"Node1",  
   "NodeLoadMetricInformation":[    
      {    
         "Name":"CPU",  
         "NodeCapacity":"-1",  
         "NodeLoad":"0",  
         "NodeRemainingCapacity":"0",  
         "IsCapacityViolation":false,  
         "NodeBufferedCapacity":"-1",  
         "NodeRemainingBufferedCapacity":"0"  
      }  
   ]  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|NodeName|The node name.|  
|NodeLoadMetricInformation|The list of node information on this node.|  
|Name|The name of the metric.|  
|NodeCapacity|The total capacity on the node for the metric.|  
|NodeLoad|The current load on the node for a metric.|  
|NodeRemainingCapacity|The remaining capacity on the node for the metric.|  
|IsCapacityViolation|Whether there is a capacity violation for the metric on the given node.|  
|NodeBufferedCapacity|The value that indicates the reserved capacity.|  
|NodeRemainingBufferedCapacity|The remaining reserved capacity for this metric on the node.|  
  
## Examples  
 The following example displays the load of the node1. The localhost:19007 is the endpoint of the http gateway.  
  
```  
http://localhost:19007/Nodes/Node1/$/GetLoadInformation?api-version=1.0  
```