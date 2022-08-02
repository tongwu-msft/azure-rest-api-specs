---
title: "Service Fabric Mesh Type VolumeResourceDescription"
description: Describes a volume resource and provides the names, types, and requirement statuses for properties of the volume resource description.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# Service Fabric Mesh Type VolumeResourceDescription

This type describes a volume resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`id`](#id) | string | No |
| [`name`](#name) | string | No |
| [`type`](#type) | string | No |
| [`location`](#location) | string | No |
| [`tags`](#tags) | map of string to string | No |
| [`properties`](#properties) | [VolumeResourceProperties](sfmeshrp-model-volumeresourceproperties.md) | Yes |

____
### `id`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Fully qualified identifier for the resource. Ex - /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/{resourceProviderNamespace}/{resourceType}/{resourceName}

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the resource

____
### `type`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The type of the resource. Ex- Microsoft.Compute/virtualMachines or Microsoft.Storage/storageAccounts.

____
### `location`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The geo-location where the resource lives

____
### `tags`
__Type__: map of string to string <br/>
__Required__: No<br/>
<br/>
Resource tags.

____
### `properties`
__Type__: [VolumeResourceProperties](sfmeshrp-model-volumeresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes properties of a volume resource.
