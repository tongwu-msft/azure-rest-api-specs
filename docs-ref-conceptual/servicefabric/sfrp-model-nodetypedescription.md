---
title: "NodeTypeDescription"
ms.date: "2017-05-16"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
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
# NodeTypeDescription

Describes a node type in the cluster, each node type represents sub set of nodes in the cluster.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [name](#name) | string | Yes |
| [placementProperties](#placementproperties) | map of string to string | No |
| [capacities](#capacities) | map of string to string | No |
| [clientConnectionEndpointPort](#clientconnectionendpointport) | integer | Yes |
| [httpGatewayEndpointPort](#httpgatewayendpointport) | integer | Yes |
| [durabilityLevel](#durabilitylevel) | string (enum) | No |
| [applicationPorts](#applicationports) | [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) | No |
| [ephemeralPorts](#ephemeralports) | [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) | No |
| [isPrimary](#isprimary) | boolean | Yes |
| [vmInstanceCount](#vminstancecount) | integer | Yes |
| [reverseProxyEndpointPort](#reverseproxyendpointport) | integer | No |

____
### name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node type.

____
### placementProperties
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
The placement tags applied to nodes in the node type, which can be used to indicate where certain services (workload) should run.

____
### capacities
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
The capacity tags applied to the nodes in the node type, the cluster resource manager uses these tags to understand how much resource a node has.

____
### clientConnectionEndpointPort
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The TCP cluster management endpoint port.

____
### httpGatewayEndpointPort
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The HTTP cluster management endpoint port.

____
### durabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The durability level of the node type. Learn about [DurabilityLevel](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity).

  - Bronze - No privileges. This is the default.
  - Silver - The infrastructure jobs can be paused for a duration of 30 minutes per UD.
  - Gold - The infrastructure jobs can be paused for a duration of 2 hours per UD. Gold durability can be enabled only on full node VM skus like D15_V2, G5 etc.


____
### applicationPorts
__Type__: [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) <br/>
__Required__: No<br/>
<br/>
The range of ports from which cluster assigned port to Service Fabric applications.

____
### ephemeralPorts
__Type__: [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) <br/>
__Required__: No<br/>
<br/>
The range of empheral ports that nodes in this node type should be configured with.

____
### isPrimary
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
The node type on which system services will run. Only one node type should be marked as primary. Primary node type cannot be deleted or changed for existing clusters.

____
### vmInstanceCount
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 2147483647 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The number of nodes in the node type. This count should match the capacity property in the corresponding VirtualMachineScaleSet resource.

____
### reverseProxyEndpointPort
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The endpoint used by reverse proxy.
