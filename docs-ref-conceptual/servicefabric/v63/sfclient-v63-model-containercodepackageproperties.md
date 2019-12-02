---
title: "ContainerCodePackageProperties"
ms.date: 07/20/2018
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
# ContainerCodePackageProperties

Describes a container and its runtime properties.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | Yes |
| [`image`](#image) | string | Yes |
| [`imageRegistryCredential`](#imageregistrycredential) | [ImageRegistryCredential](sfclient-v63-model-imageregistrycredential.md) | No |
| [`entrypoint`](#entrypoint) | string | No |
| [`commands`](#commands) | array of string | No |
| [`environmentVariables`](#environmentvariables) | array of [EnvironmentVariable](sfclient-v63-model-environmentvariable.md) | No |
| [`settings`](#settings) | array of [Setting](sfclient-v63-model-setting.md) | No |
| [`labels`](#labels) | array of [ContainerLabel](sfclient-v63-model-containerlabel.md) | No |
| [`endpoints`](#endpoints) | array of [EndpointProperties](sfclient-v63-model-endpointproperties.md) | No |
| [`resources`](#resources) | [ResourceRequirements](sfclient-v63-model-resourcerequirements.md) | Yes |
| [`volumeRefs`](#volumerefs) | array of [ContainerVolume](sfclient-v63-model-containervolume.md) | No |
| [`instanceView`](#instanceview) | [ContainerInstanceView](sfclient-v63-model-containerinstanceview.md) | No |
| [`diagnostics`](#diagnostics) | [DiagnosticsRef](sfclient-v63-model-diagnosticsref.md) | No |

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
__Type__: [ImageRegistryCredential](sfclient-v63-model-imageregistrycredential.md) <br/>
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
__Type__: array of [EnvironmentVariable](sfclient-v63-model-environmentvariable.md) <br/>
__Required__: No<br/>
<br/>
The environment variables to set in this container

____
### `settings`
__Type__: array of [Setting](sfclient-v63-model-setting.md) <br/>
__Required__: No<br/>
<br/>
The settings to set in this container. The setting file path can be fetched from environment variable "Fabric_SettingPath". The path for Windows container is "C:\\secrets". The path for Linux container is "/var/secrets".

____
### `labels`
__Type__: array of [ContainerLabel](sfclient-v63-model-containerlabel.md) <br/>
__Required__: No<br/>
<br/>
The labels to set in this container.

____
### `endpoints`
__Type__: array of [EndpointProperties](sfclient-v63-model-endpointproperties.md) <br/>
__Required__: No<br/>
<br/>
The endpoints exposed by this container.

____
### `resources`
__Type__: [ResourceRequirements](sfclient-v63-model-resourcerequirements.md) <br/>
__Required__: Yes<br/>
<br/>
This type describes the resource requirements for a container or a service.

____
### `volumeRefs`
__Type__: array of [ContainerVolume](sfclient-v63-model-containervolume.md) <br/>
__Required__: No<br/>
<br/>
The volumes to be attached to the container.

____
### `instanceView`
__Type__: [ContainerInstanceView](sfclient-v63-model-containerinstanceview.md) <br/>
__Required__: No<br/>
<br/>
Runtime information of a container instance.

____
### `diagnostics`
__Type__: [DiagnosticsRef](sfclient-v63-model-diagnosticsref.md) <br/>
__Required__: No<br/>
<br/>
Reference to sinks in DiagnosticsDescription.
