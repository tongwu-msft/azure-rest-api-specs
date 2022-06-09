---
title: "ServiceResourceProperties v82"
description: "ServiceResourceProperties v82"
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
# ServiceResourceProperties v82

This type describes properties of a service resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`osType`](#ostype) | string (enum) | Yes |
| [`codePackages`](#codepackages) | array of [ContainerCodePackageProperties](sfclient-v82-model-containercodepackageproperties.md) | Yes |
| [`networkRefs`](#networkrefs) | array of [NetworkRef](sfclient-v82-model-networkref.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) | No |
| [`description`](#description) | string | No |
| [`replicaCount`](#replicacount) | integer | No |
| [`executionPolicy`](#executionpolicy) | [ExecutionPolicy](sfclient-v82-model-executionpolicy.md) | No |
| [`autoScalingPolicies`](#autoscalingpolicies) | array of [AutoScalingPolicy](sfclient-v82-model-autoscalingpolicy.md) | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`healthState`](#healthstate) | string (enum) | No |
| [`unhealthyEvaluation`](#unhealthyevaluation) | string | No |
| [`identityRefs`](#identityrefs) | array of [ServiceIdentity](sfclient-v82-model-serviceidentity.md) | No |
| [`dnsName`](#dnsname) | string | No |

____
### `osType`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>


The operation system required by the code in service.

Possible values are: 

  - `Linux` - The required operating system is Linux.
  - `Windows` - The required operating system is Windows.



____
### `codePackages`
__Type__: array of [ContainerCodePackageProperties](sfclient-v82-model-containercodepackageproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the set of code packages that forms the service. A code package describes the container and the properties for running it. All the code packages are started together on the same host and share the same context (network, process etc.).


____
### `networkRefs`
__Type__: array of [NetworkRef](sfclient-v82-model-networkref.md) <br/>
__Required__: No<br/>
<br/>
The names of the private networks that this service needs to be part of.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the service.

____
### `replicaCount`
__Type__: integer <br/>
__Required__: No<br/>
<br/>
The number of replicas of the service to create. Defaults to 1 if not specified.

____
### `executionPolicy`
__Type__: [ExecutionPolicy](sfclient-v82-model-executionpolicy.md) <br/>
__Required__: No<br/>
<br/>
The execution policy of the service

____
### `autoScalingPolicies`
__Type__: array of [AutoScalingPolicy](sfclient-v82-model-autoscalingpolicy.md) <br/>
__Required__: No<br/>
<br/>
Auto scaling policies

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


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
Gives additional information about the current status of the service.

____
### `healthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


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
When the service's health state is not 'Ok', this additional details from service fabric Health Manager for the user to know why the service is marked unhealthy.

____
### `identityRefs`
__Type__: array of [ServiceIdentity](sfclient-v82-model-serviceidentity.md) <br/>
__Required__: No<br/>
<br/>
The service identity list.

____
### `dnsName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Dns name of the service.
