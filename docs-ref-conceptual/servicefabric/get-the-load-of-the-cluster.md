---
title: "Get the load of the cluster"
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
ms.assetid: e91ed02f-461b-43ed-b25c-6b5b52021423
caps.latest.revision: 3
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Get the load of the cluster
Gets the load related information of the entire Service Fabric cluster.  
  
## Request  
 See [Partition](partition.md) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/$/GetLoadInformation?api-version=1.0`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{    
   "LastBalancingStartTimeUtc":"131031515302126279",  
   "LastBalancingEndTimeUtc":"131031515305208475",  
   "LoadMetricInformation":[    
      {    
         "Name":"CPU",  
         "IsBalancedBefore":true,  
         "IsBalancedAfter":true,  
         "DeviationBefore":0,  
         "DeviationAfter":0,  
         "BalancingThreshold":1,  
         "Action":"CreationWithMove",  
         "ActivityThreshold":1,  
         "ClusterCapacity":"10",  
         "ClusterLoad":"3",  
         "RemainingUnbufferedCapacity":"0",  
         "NodeBufferPercentage":0,  
         "BufferedCapacity":"0",  
         "RemainingBufferedCapacity":"0",  
         "IsClusterCapacityViolation":false,  
         "MinNodeLoadValue":"0",  
         "MinNodeLoadId":{    
            "Id":"10152272d1e44a94356a41d96dc9b466"  
         },  
         "MaxNodeLoadValue":"0",  
         "MaxNodeLoadId":{    
            "Id":"10152272d1e44a94356a41d96dc9b466"  
         }  
      }  
   ]  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|LastBalancingStartTimeUtc|The starting time of last resource balancing run.|  
|LastBalancingEndTimeUtc|The end time of last resource balancing run.|  
|LoadMetricInformationList|A list of load metrics information. Each entry is for a certain metrics.|  
|Name|The name of the metric.|  
|IsBalancedBefore|A Boolean value that indicates whether the metrics is balanced or not before resource balancer run.|  
|IsBalancedAfter|A Boolean value that indicates whether the metrics is balanced or not after resource balancer run.|  
|DeviationBefore|The standard average deviation of the metrics before resource balancer run.|  
|DeviationAfter|The standard average deviation of the metrics after resource balancer run.|  
|BalancingThreshold|The balancing threshold for a certain metric.|  
|ActivityThreshold|The Activity Threshold specified for this metric in the system Cluster Manifest.|  
|Action|The current action being taken with regard to this metric.|  
|ClusterCapacity|The total cluster capacity for a given metric.|  
|ClusterLoad|The total cluster load for a specific metric within the cluster|  
|ClusterRemainingCapacity|The remaining capacity for the metric in the cluster. Remaining capacity is defined as the current Cluster Capacity minus the current Cluster Load.|  
|IsClusterCapacityViolation|Whether the metric is currently over capacity in the cluster.|  
|NodeBufferPercentage|The reserved percentage of total node capacity for this metric|  
|ClusterBufferedCapacity|The reserved percentage of cluster total capacity for this metric|  
|ClusterRemainingBufferedCapacity|Gets the remaining percentage of cluster total capacity for this metric|  
|MinNodeLoadValue|The minimum load on any node for this metric.|  
|MinNodeLoadNodeId|The node id of the node with the minimum load for this metric.|  
|MaxNodeLoadValue|The maximum load on any node for this metric.|  
|MaxNodeLoadNodeId|The node id of the node with the maximum load for this metric.|  
  
## Examples  
 The following example displays the load of the specified cluster. The localhost:19007 is the endpoint of the http gateway.  
  
```  
http://localhost:19007/$/GetLoadInformation?api-version=1.0  
  
```