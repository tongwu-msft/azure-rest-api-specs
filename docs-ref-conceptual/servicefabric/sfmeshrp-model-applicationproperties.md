---
title: "Understand how to use application properties"
description: Learn about application properties, which create or modify the services of an application in Service Fabric Mesh API resource manager.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Explore Application Properties and its properties

This type describes properties of an application resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`description`](#description) | string | No |
| [`debugParams`](#debugparams) | string | No |
| [`services`](#services) | array of [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) | No |
| [`healthState`](#healthstate) | string (enum) | No |
| [`unhealthyEvaluation`](#unhealthyevaluation) | string | No |
| [`status`](#status) | string (enum) | No |
| [`statusDetails`](#statusdetails) | string | No |
| [`serviceNames`](#servicenames) | array of string | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsDescription](sfmeshrp-model-diagnosticsdescription.md) | No |

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
User readable description of the application.

____
### `debugParams`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Internal use.

____
### `services`
__Type__: array of [ServiceResourceDescription](sfmeshrp-model-serviceresourcedescription.md) <br/>
__Required__: No<br/>
<br/>
describes the services in the application.

____
### `healthState`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Describes the health state of an application resource.

The health state of a resource such as Application, Service, or Network.

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

____
### `status`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Status of the application resource.




____
### `statusDetails`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Gives additional information about the current status of the application deployment.

____
### `serviceNames`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
Names of the services in the application.

____
### `diagnostics`
__Type__: [DiagnosticsDescription](sfmeshrp-model-diagnosticsdescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the diagnostics definition and usage for an application resource.
