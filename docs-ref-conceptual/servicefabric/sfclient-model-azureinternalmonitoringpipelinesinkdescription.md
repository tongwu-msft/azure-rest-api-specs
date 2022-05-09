---
title: "Azure Internal Monitoring PipelineSink Description"
description: "AzureInternalMonitoringPipelineSinkDescription"
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
# Azure Internal Monitoring Pipeline Sink Description

Diagnostics settings for Geneva.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`name`](#name) | string | No |
| [`description`](#description) | string | No |
| [`accountName`](#accountname) | string | No |
| [`namespace`](#namespace) | string | No |
| [`maConfigUrl`](#maconfigurl) | string | No |
| [`fluentdConfigUrl`](#fluentdconfigurl) | string | No |
| [`autoKeyConfigUrl`](#autokeyconfigurl) | string | No |

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
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring agent fluentd configuration.

____
### `autoKeyConfigUrl`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Azure Internal monitoring pipeline autokey associated with the certificate.
