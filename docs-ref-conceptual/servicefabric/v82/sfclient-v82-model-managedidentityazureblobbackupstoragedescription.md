---
title: "ManagedIdentityAzureBlobBackupStorageDescription v82"
description: "ManagedIdentityAzureBlobBackupStorageDescription v82"
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
# ManagedIdentityAzureBlobBackupStorageDescription v82

Describes the parameters for Azure blob store (connected using managed identity) used for storing and enumerating backups.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`FriendlyName`](#friendlyname) | string | No |
| [`ManagedIdentityType`](#managedidentitytype) | string (enum) | Yes |
| [`BlobServiceUri`](#blobserviceuri) | string | Yes |
| [`ContainerName`](#containername) | string | Yes |

____
### `FriendlyName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Friendly name for this backup storage.

____
### `ManagedIdentityType`
__Type__: string (enum) <br/>
__Required__: Yes<br/>
<br/>


The type of managed identity to be used to connect to Azure Blob Store via Managed Identity.


Possible values are: 

  - `Invalid` - Indicates an invalid managed identity type. All Service Fabric enumerations have the invalid type.
  - `VMSS` - Indicates VMSS managed identity should be used to connect to Azure blob store.
  - `Cluster` - Indicates cluster managed identity should be used to connect to Azure blob store.



____
### `BlobServiceUri`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Blob Service Uri to connect to the Azure blob store..

____
### `ContainerName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the container in the blob store to store and enumerate backups from.
