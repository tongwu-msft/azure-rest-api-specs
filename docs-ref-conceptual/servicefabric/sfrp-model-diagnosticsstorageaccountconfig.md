---
title: "DiagnosticsStorageAccountConfig"
ms.date: "2017-04-28"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric Resource Manager REST API Reference"
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
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
# DiagnosticsStorageAccountConfig

Diagnostics storage account config

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [storageAccountName](#storageaccountname) | string | Yes |
| [protectedAccountKeyName](#protectedaccountkeyname) | string | Yes |
| [blobEndpoint](#blobendpoint) | string | Yes |
| [queueEndpoint](#queueendpoint) | string | Yes |
| [tableEndpoint](#tableendpoint) | string | Yes |

____
### storageAccountName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Diagnostics storage account name

____
### protectedAccountKeyName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Protected Diagnostics storage key name

____
### blobEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Diagnostics storage account blob endpoint

____
### queueEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Diagnostics storage account queue endpoint

____
### tableEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Diagnostics storage account table endpoint
