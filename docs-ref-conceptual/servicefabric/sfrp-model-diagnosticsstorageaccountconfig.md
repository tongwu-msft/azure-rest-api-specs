---
title: "DiagnosticsStorageAccountConfig"
ms.date: "2017-05-04"
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

The storage account information for storing Service Fabric diagnostic logs.

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
The Azure storage account name.

____
### protectedAccountKeyName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The protected diagnostics storage key name.

____
### blobEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The blob endpoint of the azure storage account.

____
### queueEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The queue endpoint of the azure storage account.

____
### tableEndpoint
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The table endpoint of the azure storage account.
