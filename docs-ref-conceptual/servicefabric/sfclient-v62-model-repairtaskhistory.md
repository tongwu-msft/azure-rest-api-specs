---
title: "RepairTaskHistory"
ms.date: "2018-04-23"
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
# RepairTaskHistory

A record of the times when the repair task entered each state.

This type supports the Service Fabric platform; it is not meant to be used directly from your code.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`CreatedUtcTimestamp`](#createdutctimestamp) | string (date-time) | No |
| [`ClaimedUtcTimestamp`](#claimedutctimestamp) | string (date-time) | No |
| [`PreparingUtcTimestamp`](#preparingutctimestamp) | string (date-time) | No |
| [`ApprovedUtcTimestamp`](#approvedutctimestamp) | string (date-time) | No |
| [`ExecutingUtcTimestamp`](#executingutctimestamp) | string (date-time) | No |
| [`RestoringUtcTimestamp`](#restoringutctimestamp) | string (date-time) | No |
| [`CompletedUtcTimestamp`](#completedutctimestamp) | string (date-time) | No |
| [`PreparingHealthCheckStartUtcTimestamp`](#preparinghealthcheckstartutctimestamp) | string (date-time) | No |
| [`PreparingHealthCheckEndUtcTimestamp`](#preparinghealthcheckendutctimestamp) | string (date-time) | No |
| [`RestoringHealthCheckStartUtcTimestamp`](#restoringhealthcheckstartutctimestamp) | string (date-time) | No |
| [`RestoringHealthCheckEndUtcTimestamp`](#restoringhealthcheckendutctimestamp) | string (date-time) | No |

____
### `CreatedUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Created state.

____
### `ClaimedUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Claimed state.

____
### `PreparingUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Preparing state.

____
### `ApprovedUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Approved state

____
### `ExecutingUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Executing state

____
### `RestoringUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Restoring state

____
### `CompletedUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task entered the Completed state

____
### `PreparingHealthCheckStartUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task started the health check in the Preparing state.

____
### `PreparingHealthCheckEndUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task completed the health check in the Preparing state.

____
### `RestoringHealthCheckStartUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task started the health check in the Restoring state.

____
### `RestoringHealthCheckEndUtcTimestamp`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time when the repair task completed the health check in the Restoring state.
