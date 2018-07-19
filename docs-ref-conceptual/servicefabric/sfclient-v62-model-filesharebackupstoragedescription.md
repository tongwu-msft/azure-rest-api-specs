---
title: "FileShareBackupStorageDescription"
ms.date: "2018-04-23"
ms.prod: "azure"
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
# FileShareBackupStorageDescription

Describes the parameters for file share storage used for storing or enumerating backups.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`StorageKind`](#storagekind) | string | Yes |
| [`FriendlyName`](#friendlyname) | string | No |
| [`Path`](#path) | string | Yes |
| [`PrimaryUserName`](#primaryusername) | string | No |
| [`PrimaryPassword`](#primarypassword) | string | No |
| [`SecondaryUserName`](#secondaryusername) | string | No |
| [`SecondaryPassword`](#secondarypassword) | string | No |

____
### StorageKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'FileShare' for objects of type 'FileShareBackupStorageDescription'.

____
### `FriendlyName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Friendly name for this backup storage.

____
### `Path`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
UNC path of the file share where to store or enumerate backups from.

____
### `PrimaryUserName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Primary user name to access the file share.

____
### `PrimaryPassword`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Primary password to access the share location.

____
### `SecondaryUserName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Secondary user name to access the file share.

____
### `SecondaryPassword`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Secondary password to access the share location
