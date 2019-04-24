---
title: "AzureInternalMonitoringPipelineSinkDescription"
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
# AzureInternalMonitoringPipelineSinkDescription

Diagnostics settings for Geneva.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`kind`](#kind) | string | Yes |
| [`name`](#name) | string | No |
| [`description`](#description) | string | No |
| [`accountName`](#accountname) | string | No |
| [`namespace`](#namespace) | string | No |
| [`maConfigUrl`](#maconfigurl) | string | No |
| [`fluentdConfigUrl`](#fluentdconfigurl) | Object | No |
| [`autoKeyConfigUrl`](#autokeyconfigurl) | string | No |

____
### kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'AzureInternalMonitoringPipeline' for objects of type 'AzureInternalMonitoringPipelineSinkDescription'.

____
### `name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the sink. This value is referenced by DiagnosticsReferenceDescription

____
### `description`
__Type__: string <br/>
__Required__: No<br/>
<br/>
A description of the sink.

____
### `accountName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring pipeline account.

____
### `namespace`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring pipeline account namespace.

____
### `maConfigUrl`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring agent configuration.

____
### `fluentdConfigUrl`
__Type__: Object <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring agent fluentd configuration.

____
### `autoKeyConfigUrl`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring pipeline autokey associated with the certificate.
