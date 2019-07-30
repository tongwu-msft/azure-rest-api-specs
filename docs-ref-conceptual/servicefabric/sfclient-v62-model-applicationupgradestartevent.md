---
title: "ApplicationUpgradeStartEvent"
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
# ApplicationUpgradeStartEvent

Application Upgrade Start event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`ApplicationId`](#applicationid) | string | Yes |
| [`ApplicationTypeName`](#applicationtypename) | string | Yes |
| [`CurrentApplicationTypeVersion`](#currentapplicationtypeversion) | string | Yes |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes |
| [`UpgradeType`](#upgradetype) | string | Yes |
| [`RollingUpgradeMode`](#rollingupgrademode) | string | Yes |
| [`FailureAction`](#failureaction) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ApplicationUpgradeStart' for objects of type 'ApplicationUpgradeStartEvent'.

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
### `CurrentApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Current Application type version.

____
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Target Application type version.

____
### `UpgradeType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of upgrade.

____
### `RollingUpgradeMode`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Mode of upgrade.

____
### `FailureAction`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Action if failed.
