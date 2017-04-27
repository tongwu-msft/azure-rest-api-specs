---
title: "NodeInfo"
ms.date: "2017-04-26"
ms.prod: "azure"
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
# NodeInfo

Information about a node in Service Fabric cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [IpAddressOrFQDN](#ipaddressorfqdn) | string | No |
| [Type](#type) | string | No |
| [CodeVersion](#codeversion) | string | No |
| [ConfigVersion](#configversion) | string | No |
| [NodeStatus](#nodestatus) | string (enum) | No |
| [NodeUpTimeInSeconds](#nodeuptimeinseconds) | string | No |
| [HealthState](#healthstate) | string (enum) | No |
| [IsSeedNode](#isseednode) | boolean | No |
| [UpgradeDomain](#upgradedomain) | string | No |
| [FaultDomain](#faultdomain) | string | No |
| [Id](#id) | [NodeId](model-NodeId.md) | No |
| [InstanceId](#instanceid) | string | No |
| [NodeDeactivationInfo](#nodedeactivationinfo) | [NodeDeactivationInfo](model-NodeDeactivationInfo.md) | No |
| [IsStopped](#isstopped) | boolean | No |
| [NodeDownTimeInSeconds](#nodedowntimeinseconds) | string | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the node.

____
### IpAddressOrFQDN
__Type__: string <br/>
__Required__: No<br/>
<br/>
The IP address or fully qualified domain name of the node.

____
### Type
__Type__: string <br/>
__Required__: No<br/>
<br/>
The type of the node.

____
### CodeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of Service Fabric binaries that the node is running.

____
### ConfigVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of Service Fabric cluster manifest that the node is using.

____
### NodeStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the node. Possible values are following.

  - Invalid - Indicates the node status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.
  - Up - Indicates the node is up. The value is 1.
  - Down - Indicates the node is down. The value is 2.
  - Enabling - Indicates the node is in process of being enabled. The value is 3.
  - Disabling - Indicates the node is in the process of being disabled. The value is 4.
  - Disabled - Indicates the node is disabled. The value is 5.
  - Unknown - Indicates the node is unknown. A node would be in Unknown state if Service Fabric does not have authoritative information about that node. This can happen if the system learns about a node at runtime.The value is 6.
  - Removed - Indicates the node is removed. A node would be in Removed state if NodeStateRemoved API has been called for this node. In other words, Service Fabric has been informed that the persisted state on the node has been permanently lost. The value is 7.


____
### NodeUpTimeInSeconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
Time in seconds since the node has been in NodeStatus Up. Value ero indicates that the node is not Up.

____
### HealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

  - Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ok - Indicates the health state is okay. The value is 1.
  - Warning - Indicates the health state is at a warning level. The value is 2.
  - Error - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - Unknown - Indicates an unknown health status. The value is 65535.


____
### IsSeedNode
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if the node is a seed node or not. Returns true if the node is a seed node, otherwise false. A quorum of seed nodes are required for proper operation of Service Fabric cluster.

____
### UpgradeDomain
__Type__: string <br/>
__Required__: No<br/>
<br/>
The upgrade domain of the node.

____
### FaultDomain
__Type__: string <br/>
__Required__: No<br/>
<br/>
The fault domain of the node.

____
### Id
__Type__: [NodeId](model-NodeId.md) <br/>
__Required__: No<br/>
<br/>
An internal ID used by Service Fabric to uniquely identify a node. Node Id is deterministically generated from node name.

____
### InstanceId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The id representing the node instance. While the Id of the node is deterministically generated from the node name and remains same across restarts, the InstanceId changes every time node restarts.

____
### NodeDeactivationInfo
__Type__: [NodeDeactivationInfo](model-NodeDeactivationInfo.md) <br/>
__Required__: No<br/>
<br/>
Information about the node deactivation. This information is valid for a node that is undergoing deactivation or has already been deactivated.

____
### IsStopped
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Indicates if the node is stopped by calling stop node API or not. Returns true if the node is stopped, otherwise false.

____
### NodeDownTimeInSeconds
__Type__: string <br/>
__Required__: No<br/>
<br/>
Time in seconds since the node has been in NodeStatus Down. Value zero indicates node is not NodeStatus Down.
