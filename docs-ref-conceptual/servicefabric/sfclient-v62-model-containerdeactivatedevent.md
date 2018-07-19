---
title: "ContainerDeactivatedEvent"
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
# ContainerDeactivatedEvent

Container Deactivated event.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`EventInstanceId`](#eventinstanceid) | string (uuid) | Yes |
| [`TimeStamp`](#timestamp) | string (date-time) | Yes |
| [`HasCorrelatedEvents`](#hascorrelatedevents) | boolean | No |
| [`ApplicationId`](#applicationid) | string | Yes |
| [`ServiceName`](#servicename) | string | Yes |
| [`ServicePackageName`](#servicepackagename) | string | Yes |
| [`ServicePackageActivationId`](#servicepackageactivationid) | string | Yes |
| [`IsExclusive`](#isexclusive) | boolean | Yes |
| [`CodePackageName`](#codepackagename) | string | Yes |
| [`EntryPointType`](#entrypointtype) | string | Yes |
| [`ImageName`](#imagename) | string | Yes |
| [`ContainerName`](#containername) | string | Yes |
| [`HostId`](#hostid) | string | Yes |
| [`ExitCode`](#exitcode) | integer (int64) | Yes |
| [`UnexpectedTermination`](#unexpectedtermination) | boolean | Yes |
| [`StartTime`](#starttime) | string (date-time) | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ContainerDeactivated' for objects of type 'ContainerDeactivatedEvent'.

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
### `ServiceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Service.

____
### `ServicePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Service package.

____
### `ServicePackageActivationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Activation Id of Service package.

____
### `IsExclusive`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates IsExclusive flag.

____
### `CodePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Code package.

____
### `EntryPointType`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Type of EntryPoint.

____
### `ImageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Container image.

____
### `ContainerName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of Container.

____
### `HostId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Host Id.

____
### `ExitCode`
__Type__: integer (int64) <br/>
__Required__: Yes<br/>
<br/>
Exit code of process.

____
### `UnexpectedTermination`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates if termination is unexpected.

____
### `StartTime`
__Type__: string (date-time) <br/>
__Required__: Yes<br/>
<br/>
Start time of process.
