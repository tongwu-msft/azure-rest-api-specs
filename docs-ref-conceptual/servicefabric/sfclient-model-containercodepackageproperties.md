---
title: "Container Code Package Properties"
description: "ContainerCodePackageProperties"
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
# Container Code Package Properties

Describes a container and its runtime properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`image`](#image) | string | Yes |
| [`imageRegistryCredential`](#imageregistrycredential) | [ImageRegistryCredential](sfclient-model-imageregistrycredential.md) | No |
| [`entryPoint`](#entrypoint) | string | No |
| [`commands`](#commands) | array of string | No |
| [`environmentVariables`](#environmentvariables) | array of [EnvironmentVariable](sfclient-model-environmentvariable.md) | No |
| [`settings`](#settings) | array of [Setting](sfclient-model-setting.md) | No |
| [`labels`](#labels) | array of [ContainerLabel](sfclient-model-containerlabel.md) | No |
| [`endpoints`](#endpoints) | array of [EndpointProperties](sfclient-model-endpointproperties.md) | No |
| [`resources`](#resources) | [ResourceRequirements](sfclient-model-resourcerequirements.md) | Yes |
| [`volumeRefs`](#volumerefs) | array of [VolumeReference](sfclient-model-volumereference.md) | No |
| [`volumes`](#volumes) | array of [ApplicationScopedVolume](sfclient-model-applicationscopedvolume.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-model-diagnosticsref.md) | No |
| [`reliableCollectionsRefs`](#reliablecollectionsrefs) | array of [ReliableCollectionsRef](sfclient-model-reliablecollectionsref.md) | No |
| [`instanceView`](#instanceview) | [ContainerInstanceView](sfclient-model-containerinstanceview.md) | No |
| [`livenessProbe`](#livenessprobe) | array of [Probe](sfclient-model-probe.md) | No |
| [`readinessProbe`](#readinessprobe) | array of [Probe](sfclient-model-probe.md) | No |

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
__Type__: [ImageRegistryCredential](sfclient-model-imageregistrycredential.md) <br/>
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
__Type__: array of [EnvironmentVariable](sfclient-model-environmentvariable.md) <br/>
__Required__: No<br/>
<br/>
The environment variables to set in this container

____
### `settings`
__Type__: array of [Setting](sfclient-model-setting.md) <br/>
__Required__: No<br/>
<br/>
The settings to set in this container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".

____
### `labels`
__Type__: array of [ContainerLabel](sfclient-model-containerlabel.md) <br/>
__Required__: No<br/>
<br/>
The labels to set in this container.

____
### `endpoints`
__Type__: array of [EndpointProperties](sfclient-model-endpointproperties.md) <br/>
__Required__: No<br/>
<br/>
The endpoints exposed by this container.

____
### `resources`
__Type__: [ResourceRequirements](sfclient-model-resourcerequirements.md) <br/>
__Required__: Yes<br/>
<br/>
The resources required by this container.

____
### `volumeRefs`
__Type__: array of [VolumeReference](sfclient-model-volumereference.md) <br/>
__Required__: No<br/>
<br/>
Volumes to be attached to the container. The lifetime of these volumes is independent of the application's lifetime.

____
### `volumes`
__Type__: array of [ApplicationScopedVolume](sfclient-model-applicationscopedvolume.md) <br/>
__Required__: No<br/>
<br/>
Volumes to be attached to the container. The lifetime of these volumes is scoped to the application's lifetime.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.

____
### `reliableCollectionsRefs`
__Type__: array of [ReliableCollectionsRef](sfclient-model-reliablecollectionsref.md) <br/>
__Required__: No<br/>
<br/>
A list of ReliableCollection resources used by this particular code package. Please refer to ReliableCollectionsRef for more details.

____
### `instanceView`
__Type__: [ContainerInstanceView](sfclient-model-containerinstanceview.md) <br/>
__Required__: No<br/>
<br/>
Runtime information of a container instance.

____
### `livenessProbe`
__Type__: array of [Probe](sfclient-model-probe.md) <br/>
__Required__: No<br/>
<br/>
An array of liveness probes for a code package. It determines when to restart a code package.

____
### `readinessProbe`
__Type__: array of [Probe](sfclient-model-probe.md) <br/>
__Required__: No<br/>
<br/>
An array of readiness probes for a code package. It determines when to unpublish an endpoint.
