---
title: "NodeAbortedEvent"
ms.date: "2018-07-20"
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
# NodeAbortedEvent

Node Aborted event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`NodeName`](#nodename) | string | Yes |
| [`NodeInstance`](#nodeinstance) | integer (int64) | Yes |
| [`NodeId`](#nodeid) | string | Yes |
| [`UpgradeDomain`](#upgradedomain) | string | Yes |
| [`FaultDomain`](#faultdomain) | string | Yes |
| [`IpAddressOrFQDN`](#ipaddressorfqdn) | string | Yes |
| [`Hostname`](#hostname) | string | Yes |
| [`IsSeedNode`](#isseednode) | boolean | Yes |
| [`NodeVersion`](#nodeversion) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'NodeAborted' for objects of type 'NodeAbortedEvent'.

____
### `EventInstanceId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identifier for the FabricEvent instance.

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
### `NodeInstance`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Id of Node instance.

____
### `NodeId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Id of Node.

____
### `UpgradeDomain`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Upgrade domain of Node.

____
### `FaultDomain`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Fault domain of Node.

____
### `IpAddressOrFQDN`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
IP address or FQDN.

____
### `Hostname`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Host.

____
### `IsSeedNode`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates if it is seed node.

____
### `NodeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Version of Node.
