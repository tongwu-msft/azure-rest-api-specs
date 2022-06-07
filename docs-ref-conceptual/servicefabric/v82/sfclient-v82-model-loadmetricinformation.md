---
title: "LoadMetricInformation v82"
description: "LoadMetricInformation v82"
ms.date: "10/21/2020"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
author: "erikadoyle"
ms.author: "edoyle"
manager: "gwallace"
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
# LoadMetricInformation v82

Represents data structure that contains load information for a certain metric in a cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`IsBalancedBefore`](#isbalancedbefore) | boolean | No |
| [`IsBalancedAfter`](#isbalancedafter) | boolean | No |
| [`DeviationBefore`](#deviationbefore) | string (double) | No |
| [`DeviationAfter`](#deviationafter) | string (double) | No |
| [`BalancingThreshold`](#balancingthreshold) | string (double) | No |
| [`Action`](#action) | string | No |
| [`ActivityThreshold`](#activitythreshold) | string (double) | No |
| [`ClusterCapacity`](#clustercapacity) | string | No |
| [`ClusterLoad`](#clusterload) | string | No |
| [`CurrentClusterLoad`](#currentclusterload) | string (double) | No |
| [`ClusterRemainingCapacity`](#clusterremainingcapacity) | string | No |
| [`ClusterCapacityRemaining`](#clustercapacityremaining) | string | No |
| [`IsClusterCapacityViolation`](#isclustercapacityviolation) | boolean | No |
| [`NodeBufferPercentage`](#nodebufferpercentage) | string (double) | No |
| [`ClusterBufferedCapacity`](#clusterbufferedcapacity) | string | No |
| [`BufferedClusterCapacityRemaining`](#bufferedclustercapacityremaining) | string (double) | No |
| [`ClusterRemainingBufferedCapacity`](#clusterremainingbufferedcapacity) | string | No |
| [`MinNodeLoadValue`](#minnodeloadvalue) | string | No |
| [`MinimumNodeLoad`](#minimumnodeload) | string (double) | No |
| [`MinNodeLoadNodeId`](#minnodeloadnodeid) | [NodeId](sfclient-v82-model-nodeid.md) | No |
| [`MaxNodeLoadValue`](#maxnodeloadvalue) | string | No |
| [`MaximumNodeLoad`](#maximumnodeload) | string (double) | No |
| [`MaxNodeLoadNodeId`](#maxnodeloadnodeid) | [NodeId](sfclient-v82-model-nodeid.md) | No |
| [`PlannedLoadRemoval`](#plannedloadremoval) | string (double) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the metric for which this load information is provided.

____
### `IsBalancedBefore`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Value that indicates whether the metrics is balanced or not before resource balancer run

____
### `IsBalancedAfter`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Value that indicates whether the metrics is balanced or not after resource balancer run.

____
### `DeviationBefore`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The standard average deviation of the metrics before resource balancer run.

____
### `DeviationAfter`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The standard average deviation of the metrics after resource balancer run.

____
### `BalancingThreshold`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The balancing threshold for a certain metric.

____
### `Action`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The current action being taken with regard to this metric

____
### `ActivityThreshold`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The Activity Threshold specified for this metric in the system Cluster Manifest.

____
### `ClusterCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The total cluster capacity for a given metric

____
### `ClusterLoad`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The total cluster load. In future releases of Service Fabric this parameter will be deprecated in favor of CurrentClusterLoad.

____
### `CurrentClusterLoad`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The total cluster load.

____
### `ClusterRemainingCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remaining capacity for the metric in the cluster. In future releases of Service Fabric this parameter will be deprecated in favor of ClusterCapacityRemaining.

____
### `ClusterCapacityRemaining`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remaining capacity for the metric in the cluster.

____
### `IsClusterCapacityViolation`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates that the metric is currently over capacity in the cluster.

____
### `NodeBufferPercentage`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The reserved percentage of total node capacity for this metric.

____
### `ClusterBufferedCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Remaining capacity in the cluster excluding the reserved space. In future releases of Service Fabric this parameter will be deprecated in favor of BufferedClusterCapacityRemaining.

____
### `BufferedClusterCapacityRemaining`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
Remaining capacity in the cluster excluding the reserved space.

____
### `ClusterRemainingBufferedCapacity`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The remaining percentage of cluster total capacity for this metric.

____
### `MinNodeLoadValue`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The minimum load on any node for this metric. In future releases of Service Fabric this parameter will be deprecated in favor of MinimumNodeLoad.

____
### `MinimumNodeLoad`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The minimum load on any node for this metric.

____
### `MinNodeLoadNodeId`
__Type__: [NodeId](sfclient-v82-model-nodeid.md) <br/>
__Required__: No<br/>
<br/>
The node id of the node with the minimum load for this metric.

____
### `MaxNodeLoadValue`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The maximum load on any node for this metric. In future releases of Service Fabric this parameter will be deprecated in favor of MaximumNodeLoad.

____
### `MaximumNodeLoad`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
The maximum load on any node for this metric.

____
### `MaxNodeLoadNodeId`
__Type__: [NodeId](sfclient-v82-model-nodeid.md) <br/>
__Required__: No<br/>
<br/>
The node id of the node with the maximum load for this metric.

____
### `PlannedLoadRemoval`
__Type__: string (double) <br/>
__Required__: No<br/>
<br/>
This value represents the load of the replicas that are planned to be removed in the future within the cluster.
This kind of load is reported for replicas that are currently being moving to other nodes and for replicas that are currently being dropped but still use the load on the source node.

