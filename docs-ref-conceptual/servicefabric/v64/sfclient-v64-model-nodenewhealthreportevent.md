---
title: "NodeNewHealthReportEvent"
ms.date: 11/26/2018
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
# NodeNewHealthReportEvent

Node Health Report Created event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`Category`](#category) | string | No |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`NodeName`](#nodename) | string | Yes |
| [`NodeInstanceId`](#nodeinstanceid) | integer (int64) | Yes |
| [`SourceId`](#sourceid) | string | Yes |
| [`Property`](#property) | string | Yes |
| [`HealthState`](#healthstate) | string | Yes |
| [`TimeToLiveMs`](#timetolivems) | integer (int64) | Yes |
| [`SequenceNumber`](#sequencenumber) | integer (int64) | Yes |
| [`Description`](#description) | string | Yes |
| [`RemoveWhenExpired`](#removewhenexpired) | boolean | Yes |
| [`SourceUtcTimestamp`](#sourceutctimestamp) | string (date-time) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'NodeNewHealthReport' for objects of type 'NodeNewHealthReportEvent'.

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
### `NodeInstanceId`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Id of Node instance.

____
### `SourceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Id of report source.

____
### `Property`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Describes the property.

____
### `HealthState`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Describes the property health state.

____
### `TimeToLiveMs`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Time to live in milli-seconds.

____
### `SequenceNumber`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Sequence number of report.

____
### `Description`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Description of report.

____
### `RemoveWhenExpired`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates the removal when it expires.

____
### `SourceUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
Source time.
