---
title: "CodePackageEntryPointStatistics"
ms.date: "2017-05-04"
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
# CodePackageEntryPointStatistics

Statistics about setup or main entry point  of a code package deployed on a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [LastExitCode](#lastexitcode) | string (int64) | No |
| [LastActivationTime](#lastactivationtime) | string (date-time) | No |
| [LastExitTime](#lastexittime) | string (date-time) | No |
| [LastSuccessfulActivationTime](#lastsuccessfulactivationtime) | string (date-time) | No |
| [LastSuccessfulExitTime](#lastsuccessfulexittime) | string (date-time) | No |
| [ActivationCount](#activationcount) | string (int64) | No |
| [ActivationFailureCount](#activationfailurecount) | string (int64) | No |
| [ContinuousActivationFailureCount](#continuousactivationfailurecount) | string (int64) | No |
| [ExitCount](#exitcount) | string (int64) | No |
| [ExitFailureCount](#exitfailurecount) | string (int64) | No |
| [ContinuousExitFailureCount](#continuousexitfailurecount) | string (int64) | No |

____
### LastExitCode
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The last exit code of the entry point.

____
### LastActivationTime
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time (in UTC) when Service Fabric attempted to run the entry point.

____
### LastExitTime
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time (in UTC) when the entry point finished running.

____
### LastSuccessfulActivationTime
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time (in UTC) when the entry point ran successfully.

____
### LastSuccessfulExitTime
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
The last time (in UTC) when the entry point finished running gracefully.

____
### ActivationCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point has run.

____
### ActivationFailureCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point failed to run.

____
### ContinuousActivationFailureCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point continuously failed to run.

____
### ExitCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point finished running.

____
### ExitFailureCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point failed to exit gracefully.

____
### ContinuousExitFailureCount
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Number of times the entry point continuously failed to exit gracefully.
