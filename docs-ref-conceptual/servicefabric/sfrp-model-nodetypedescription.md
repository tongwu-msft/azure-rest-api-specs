---
title: "NodeTypeDescription"
ms.date: "2017-04-28"
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

Describes a node type in the cluster, each node type represents sub set of nodes in the cluster

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
Name of the node type

____
### placementProperties
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
The placement tags applied to nodes in the node type, which can be used to indicate where certain services (workload) should run

____
### capacities
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
The capacity tags applied to the nodes in the node type, the cluster resource manager uses these tags to understand how much of a resource a node has

____
### clientConnectionEndpointPort
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The TCP cluster management endpoint port

____
### httpGatewayEndpointPort
__Type__: integer <br/>
__Required__: Yes<br/>
<br/>
The HTTP cluster management endpoint port

____
### durabilityLevel
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Nodetype durability Level

____
### applicationPorts
__Type__: [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) <br/>
__Required__: No<br/>
<br/>
Ports used by applications

____
### ephemeralPorts
__Type__: [EndpointRangeDescription](sfrp-model-endpointrangedescription.md) <br/>
__Required__: No<br/>
<br/>
System assgined application ports

____
### isPrimary
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Mark this as the primary node type

____
### vmInstanceCount
__Type__: integer <br/>
__Required__: Yes<br/>
__InclusiveMaximum__: 2147483647 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The number of node instances in the node type

____
### reverseProxyEndpointPort
__Type__: integer <br/>
__Required__: No<br/>
<br/>
Endpoint used by reverse proxy
