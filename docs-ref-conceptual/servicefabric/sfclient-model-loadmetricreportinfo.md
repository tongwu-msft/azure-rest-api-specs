---
title: "LoadMetricReportInfo"
ms.date: "2017-04-29"
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
# LoadMetricReportInfo

Information about load reported by replica.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [Value](#value) | integer (int32) | No |
| [LastReportedUtc](#lastreportedutc) | string (date-time) | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the metric.

____
### Value
__Type__: integer (int32) <br/>
__Required__: No<br/>
<br/>
The value of the load for the metric..

____
### LastReportedUtc
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The UTC time when the load is reported.
