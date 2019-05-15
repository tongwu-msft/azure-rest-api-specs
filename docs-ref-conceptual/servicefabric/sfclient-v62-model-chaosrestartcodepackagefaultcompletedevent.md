---
title: "ChaosRestartCodePackageFaultCompletedEvent"
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
# ChaosRestartCodePackageFaultCompletedEvent

Chaos Restart Code Package Fault Completed event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`ApplicationId`](#applicationid) | string | Yes |
| [`FaultGroupId`](#faultgroupid) | string (uuid) | Yes |
| [`FaultId`](#faultid) | string (uuid) | Yes |
| [`NodeName`](#nodename) | string | Yes |
| [`ServiceManifestName`](#servicemanifestname) | string | Yes |
| [`CodePackageName`](#codepackagename) | string | Yes |
| [`ServicePackageActivationId`](#servicepackageactivationid) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ChaosRestartCodePackageFaultCompleted' for objects of type 'ChaosRestartCodePackageFaultCompletedEvent'.

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
### `FaultGroupId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Id of fault group.

____
### `FaultId`
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
Id of fault.

____
### `NodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a Service Fabric node.

____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Service manifest name.

____
### `CodePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Code package name.

____
### `ServicePackageActivationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Id of Service package activation.
