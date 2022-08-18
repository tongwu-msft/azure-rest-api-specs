---
title: "BackupStorageKind v82"
description: "BackupStorageKind v82"
ms.date: "04/02/2021"
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
# BackupStorageKind enum v82

type: string

The kind of backup storage, where backups are saved.


Possible values are: 

  - `Invalid` - Indicates an invalid backup storage kind. All Service Fabric enumerations have the invalid type.
  - `FileShare` - Indicates file/ SMB share to be used as backup storage.
  - `AzureBlobStore` - Indicates Azure blob store to be used as backup storage.
  - `DsmsAzureBlobStore` - Indicates Dsms Azure blob store to be used as backup storage.
  - `ManagedIdentityAzureBlobStore` - Indicates Azure blob store to be used as backup storage using managed identity.

