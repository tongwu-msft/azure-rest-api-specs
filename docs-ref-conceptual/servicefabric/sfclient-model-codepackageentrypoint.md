---
title: "CodePackageEntryPoint"
ms.date: "2017-05-08"
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
# CodePackageEntryPoint

Information about setup or main entry point of a code package deployed on a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [EntryPointLocation](#entrypointlocation) | string | No |
| [ProcessId](#processid) | string | No |
| [RunAsUserName](#runasusername) | string | No |
| [CodePackageEntryPointStatistics](#codepackageentrypointstatistics) | [CodePackageEntryPointStatistics](sfclient-model-codepackageentrypointstatistics.md) | No |
| [Status](#status) | string (enum) | No |
| [NextActivationTime](#nextactivationtime) | string (date-time) | No |
| [InstanceId](#instanceid) | string | No |

____
### EntryPointLocation
__Type__: string <br/>
__Required__: No<br/>
<br/>
The location of entry point executable on the node.

____
### ProcessId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The process id of the entry point.

____
### RunAsUserName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The user name under which entry point executable is run on the node.

____
### CodePackageEntryPointStatistics
__Type__: [CodePackageEntryPointStatistics](sfclient-model-codepackageentrypointstatistics.md) <br/>
__Required__: No<br/>
<br/>
Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the status of the code package entry point deployed on a Service Fabric node. Possible values are following.

  - Invalid - Indicates status of entry point is not known or invalid. The value is 0.
  - Pending - Indicates the entry point is scheduled to be started. The value is 1.
  - Starting - Indicates the entry point is being started. The value is 2.
  - Started - Indicates the entry point was started successfully and is running. The value is 3.
  - Stopping - Indicates the entry point is being stoppped. The value is 4.
  - Stopped - Indicates the entry point is not running. The value is 5.


____
### NextActivationTime
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The time (in UTC) when the entry point executable will be run next.

____
### InstanceId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The instance id for current running entry point. For a code package setup entry point (if specified) runs first and after it finishes main entry point is started. Each time entry point executable is run, its instance id will change.
