---
title: "NetworkResourceDescription"
description: Describe a network resource and provides the name, type, and requirement status for various properties for network resource descriptions.
services: service-fabric-mesh
author: vipul-modi
ms.date: 07/17/2018
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# NetworkResourceDescription

This type describes a network resource.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`id`](#id) | string | No |
| [`name`](#name) | string | No |
| [`type`](#type) | string | No |
| [`location`](#location) | string | No |
| [`tags`](#tags) | map of string to string | No |
| [`properties`](#properties) | [NetworkResourceProperties](sfmeshrp-model-networkresourceproperties.md) | Yes |

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
__Type__: [NetworkResourceProperties](sfmeshrp-model-networkresourceproperties.md) <br/>
__Required__: Yes<br/>
<br/>
Describes properties of a network resource.
