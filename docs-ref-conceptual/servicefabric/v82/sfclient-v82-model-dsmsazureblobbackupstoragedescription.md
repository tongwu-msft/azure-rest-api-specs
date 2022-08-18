---
title: "DsmsAzureBlobBackupStorageDescription v82"
description: "DsmsAzureBlobBackupStorageDescription v82"
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
# DsmsAzureBlobBackupStorageDescription v82

Describes the parameters for Dsms Azure blob store used for storing and enumerating backups.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`FriendlyName`](#friendlyname) | string | No |
| [`StorageCredentialsSourceLocation`](#storagecredentialssourcelocation) | string | Yes |
| [`ContainerName`](#containername) | string | Yes |

____
### `FriendlyName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Friendly name for this backup storage.

____
### `StorageCredentialsSourceLocation`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The source location of the storage credentials to connect to the Dsms Azure blob store.

____
### `ContainerName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the container in the blob store to store and enumerate backups from.
