---
title: "Container code package propertie v82s"
description: "ContainerCodePackageProperties v82"
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
# Container code package properties v82

Describes a container and its runtime properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`image`](#image) | string | Yes |
| [`imageRegistryCredential`](#imageregistrycredential) | [ImageRegistryCredential](sfclient-v82-model-imageregistrycredential.md) | No |
| [`entryPoint`](#entrypoint) | string | No |
| [`commands`](#commands) | array of string | No |
| [`environmentVariables`](#environmentvariables) | array of [EnvironmentVariable](sfclient-v82-model-environmentvariable.md) | No |
| [`settings`](#settings) | array of [Setting](sfclient-v82-model-setting.md) | No |
| [`labels`](#labels) | array of [ContainerLabel](sfclient-v82-model-containerlabel.md) | No |
| [`endpoints`](#endpoints) | array of [EndpointProperties](sfclient-v82-model-endpointproperties.md) | No |
| [`resources`](#resources) | [ResourceRequirements](sfclient-v82-model-resourcerequirements.md) | Yes |
| [`volumeRefs`](#volumerefs) | array of [VolumeReference](sfclient-v82-model-volumereference.md) | No |
| [`volumes`](#volumes) | array of [ApplicationScopedVolume](sfclient-v82-model-applicationscopedvolume.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) | No |
| [`reliableCollectionsRefs`](#reliablecollectionsrefs) | array of [ReliableCollectionsRef](sfclient-v82-model-reliablecollectionsref.md) | No |
| [`instanceView`](#instanceview) | [ContainerInstanceView](sfclient-v82-model-containerinstanceview.md) | No |
| [`livenessProbe`](#livenessprobe) | array of [Probe](sfclient-v82-model-probe.md) | No |
| [`readinessProbe`](#readinessprobe) | array of [Probe](sfclient-v82-model-probe.md) | No |

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
__Type__: [ImageRegistryCredential](sfclient-v82-model-imageregistrycredential.md) <br/>
__Required__: No<br/>
<br/>
Image registry credential.

____
### `entryPoint`
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
__Type__: array of [EnvironmentVariable](sfclient-v82-model-environmentvariable.md) <br/>
__Required__: No<br/>
<br/>
The environment variables to set in this container

____
### `settings`
__Type__: array of [Setting](sfclient-v82-model-setting.md) <br/>
__Required__: No<br/>
<br/>
The settings to set in this container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".

____
### `labels`
__Type__: array of [ContainerLabel](sfclient-v82-model-containerlabel.md) <br/>
__Required__: No<br/>
<br/>
The labels to set in this container.

____
### `endpoints`
__Type__: array of [EndpointProperties](sfclient-v82-model-endpointproperties.md) <br/>
__Required__: No<br/>
<br/>
The endpoints exposed by this container.

____
### `resources`
__Type__: [ResourceRequirements](sfclient-v82-model-resourcerequirements.md) <br/>
__Required__: Yes<br/>
<br/>
The resources required by this container.

____
### `volumeRefs`
__Type__: array of [VolumeReference](sfclient-v82-model-volumereference.md) <br/>
__Required__: No<br/>
<br/>
Volumes to be attached to the container. The lifetime of these volumes is independent of the application's lifetime.

____
### `volumes`
__Type__: array of [ApplicationScopedVolume](sfclient-v82-model-applicationscopedvolume.md) <br/>
__Required__: No<br/>
<br/>
Volumes to be attached to the container. The lifetime of these volumes is scoped to the application's lifetime.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-v82-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.

____
### `reliableCollectionsRefs`
__Type__: array of [ReliableCollectionsRef](sfclient-v82-model-reliablecollectionsref.md) <br/>
__Required__: No<br/>
<br/>
A list of ReliableCollection resources used by this particular code package. Please refer to ReliableCollectionsRef for more details.

____
### `instanceView`
__Type__: [ContainerInstanceView](sfclient-v82-model-containerinstanceview.md) <br/>
__Required__: No<br/>
<br/>
Runtime information of a container instance.

____
### `livenessProbe`
__Type__: array of [Probe](sfclient-v82-model-probe.md) <br/>
__Required__: No<br/>
<br/>
An array of liveness probes for a code package. It determines when to restart a code package.

____
### `readinessProbe`
__Type__: array of [Probe](sfclient-v82-model-probe.md) <br/>
__Required__: No<br/>
<br/>
An array of readiness probes for a code package. It determines when to unpublish an endpoint.
