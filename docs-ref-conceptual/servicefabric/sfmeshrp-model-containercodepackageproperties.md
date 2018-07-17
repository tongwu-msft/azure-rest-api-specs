---
title: "ContainerCodePackageProperties"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# ContainerCodePackageProperties

Describes a container and its runtime properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`image`](#image) | string | Yes |
| [`imageRegistryCredential`](#imageregistrycredential) | [ImageRegistryCredential](sfmeshrp-model-imageregistrycredential.md) | No |
| [`entrypoint`](#entrypoint) | string | No |
| [`commands`](#commands) | array of string | No |
| [`environmentVariables`](#environmentvariables) | array of [EnvironmentVariable](sfmeshrp-model-environmentvariable.md) | No |
| [`settings`](#settings) | array of [Setting](sfmeshrp-model-setting.md) | No |
| [`labels`](#labels) | array of [ContainerLabel](sfmeshrp-model-containerlabel.md) | No |
| [`endpoints`](#endpoints) | array of [EndpointProperties](sfmeshrp-model-endpointproperties.md) | No |
| [`resources`](#resources) | [ResourceRequirements](sfmeshrp-model-resourcerequirements.md) | Yes |
| [`volumeRefs`](#volumerefs) | array of [ContainerVolume](sfmeshrp-model-containervolume.md) | No |
| [`instanceView`](#instanceview) | [ContainerInstanceView](sfmeshrp-model-containerinstanceview.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) | No |

____
### `name`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the code package.

____
### `image`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Container image to use.

____
### `imageRegistryCredential`
__Type__: [ImageRegistryCredential](sfmeshrp-model-imageregistrycredential.md) <br/>
__Required__: No<br/>
<br/>
Image registry credential.

____
### `entrypoint`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Override for the default entry point in the container.

____
### `commands`
__Type__: array of string <br/>
__Required__: No<br/>
<br/>
Command array to execute within the container in exec form.

____
### `environmentVariables`
__Type__: array of [EnvironmentVariable](sfmeshrp-model-environmentvariable.md) <br/>
__Required__: No<br/>
<br/>
The environment variables to set in this container

____
### `settings`
__Type__: array of [Setting](sfmeshrp-model-setting.md) <br/>
__Required__: No<br/>
<br/>
The settings to set in this container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".

____
### `labels`
__Type__: array of [ContainerLabel](sfmeshrp-model-containerlabel.md) <br/>
__Required__: No<br/>
<br/>
The labels to set in this container.

____
### `endpoints`
__Type__: array of [EndpointProperties](sfmeshrp-model-endpointproperties.md) <br/>
__Required__: No<br/>
<br/>
The endpoints exposed by this container.

____
### `resources`
__Type__: [ResourceRequirements](sfmeshrp-model-resourcerequirements.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes the resource requirements for a container or a service.

____
### `volumeRefs`
__Type__: array of [ContainerVolume](sfmeshrp-model-containervolume.md) <br/>
__Required__: No<br/>
<br/>
The volumes to be attached to the container.

____
### `instanceView`
__Type__: [ContainerInstanceView](sfmeshrp-model-containerinstanceview.md) <br/>
__Required__: No<br/>
<br/>
Runtime information of a container instance.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfmeshrp-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.
