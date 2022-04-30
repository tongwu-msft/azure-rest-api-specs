---
title: "ApplicationUpgradeRollbackCompletedEvent v82"
description: "ApplicationUpgradeRollbackCompletedEvent v82"
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
# ApplicationUpgradeRollbackCompletedEvent v82

Application Upgrade Rollback Completed event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`Category`](#category) | string | No |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`ApplicationId`](#applicationid) | string | Yes |
| [`ApplicationTypeName`](#applicationtypename) | string | Yes |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes |
| [`FailureReason`](#failurereason) | string | Yes |
| [`OverallUpgradeElapsedTimeInMs`](#overallupgradeelapsedtimeinms) | number (double) | Yes |

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
### `ApplicationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is an encoded representation of the application name. This is used in the REST APIs to identify the application resource.
Starting in version 6.0, hierarchical names are delimited with the "\~" character. For example, if the application name is "fabric:/myapp/app1",
the application identity would be "myapp\~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### `ApplicationTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Application type name.

____
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Application type version.

____
### `FailureReason`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Describes reason of failure.

____
### `OverallUpgradeElapsedTimeInMs`
__Type__: number (double) <br/>
__Required__: Yes<br/>
<br/>
Overall upgrade time in milli-seconds.
