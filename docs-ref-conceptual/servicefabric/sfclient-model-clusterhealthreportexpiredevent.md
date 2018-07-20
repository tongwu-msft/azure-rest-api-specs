---
title: "ClusterHealthReportExpiredEvent"
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
# ClusterHealthReportExpiredEvent

Cluster Health Report Expired event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
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
A discriminator property. Its value must be 'ClusterHealthReportExpired' for objects of type 'ClusterHealthReportExpiredEvent'.

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
