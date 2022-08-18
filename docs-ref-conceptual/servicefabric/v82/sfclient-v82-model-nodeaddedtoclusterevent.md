---
title: "NodeAddedToClusterEvent v82"
description: "NodeAddedToClusterEvent v82"
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
# NodeAddedToClusterEvent v82

Node Added event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`Category`](#category) | string | No |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`NodeName`](#nodename) | string | Yes |
| [`NodeId`](#nodeid) | string | Yes |
| [`NodeInstance`](#nodeinstance) | integer (int64) | Yes |
| [`NodeType`](#nodetype) | string | Yes |
| [`FabricVersion`](#fabricversion) | string | Yes |
| [`IpAddressOrFQDN`](#ipaddressorfqdn) | string | Yes |
| [`NodeCapacities`](#nodecapacities) | string | Yes |

____
### `EventInstanceId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identifier for the FabricEvent instance.

____
### `Category`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The category of event.

____
### `TimeStamp`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
The time event was logged.

____
### `HasCorrelatedEvents`
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Shows there is existing related events available.

____
### `NodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `NodeId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Id of Node.

____
### `NodeInstance`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Id of Node instance.

____
### `NodeType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of Node.

____
### `FabricVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Fabric version.

____
### `IpAddressOrFQDN`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
IP address or FQDN.

____
### `NodeCapacities`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Capacities.
