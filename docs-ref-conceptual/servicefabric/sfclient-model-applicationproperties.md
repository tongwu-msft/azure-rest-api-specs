---
title: "Application properties"
description: "ApplicationProperties"
ms.date: "04/25/2022"
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
# Application Properties

Describes properties of a application resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`services`](#services) | array of [ServiceResourceDescription](sfclient-model-serviceresourcedescription.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsDescription](sfclient-model-diagnosticsdescription.md) | No |
| [`debugParams`](#debugparams) | string | No |
| [`serviceNames`](#servicenames) | array of string | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`healthState`](#healthstate) | string (enum) | No |
| [`unhealthyEvaluation`](#unhealthyevaluation) | string | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the application.

____
### `services`
__Type__: array of [ServiceResourceDescription](sfclient-model-serviceresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the services in the application. This property is used to create or modify services of the application. On get only the name of the service is returned. The service description can be obtained by querying for the service resource.

____
### `diagnostics`
__Type__: [DiagnosticsDescription](sfclient-model-diagnosticsdescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the diagnostics definition and usage for an application resource.

____
### `debugParams`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Internal - used by Visual Studio to setup the debugging session on the local development environment.

____
### `serviceNames`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
Names of the services in the application.

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Status of the application.

Status of the resource.

Possible values are: 

  - `Unknown` - Indicates the resource status is unknown. The value is zero.
  - `Ready` - Indicates the resource is ready. The value is 1.
  - `Upgrading` - Indicates the resource is upgrading. The value is 2.
  - `Creating` - Indicates the resource is being created. The value is 3.
  - `Deleting` - Indicates the resource is being deleted. The value is 4.
  - `Failed` - Indicates the resource is not functional due to persistent failures. See statusDetails property for more details. The value is 5.



____
### `statusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Gives additional information about the current status of the application.

____
### `healthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Describes the health state of an application resource.

The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

Possible values are: 

  - `Invalid` - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - `Ok` - Indicates the health state is okay. The value is 1.
  - `Warning` - Indicates the health state is at a warning level. The value is 2.
  - `Error` - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - `Unknown` - Indicates an unknown health status. The value is 65535.



____
### `unhealthyEvaluation`
__Type__: string <br/>
__Required__: No<br/>
<br/>
When the application's health state is not 'Ok', this additional details from service fabric Health Manager for the user to know why the application is marked unhealthy.
