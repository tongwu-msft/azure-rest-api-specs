---
title: "NodeOpenSucceededEvent v82"
description: "NodeOpenSucceededEvent v82"
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
# NodeOpenSucceededEvent v82

Node Opened Succeeded event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`Category`](#category) | string | No |
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
