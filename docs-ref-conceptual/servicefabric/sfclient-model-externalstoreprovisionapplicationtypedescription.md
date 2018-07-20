---
title: "ExternalStoreProvisionApplicationTypeDescription"
ms.date: "2018-07-20"
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
# ExternalStoreProvisionApplicationTypeDescription

Describes the operation to register or provision an application type using an application package from an external store instead of a package uploaded to the Service Fabric image store.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Kind`](#kind) | string | Yes |
| [`Async`](#async) | boolean | Yes |
| [`ApplicationPackageDownloadUri`](#applicationpackagedownloaduri) | string | Yes |
| [`ApplicationTypeName`](#applicationtypename) | string | Yes |
| [`ApplicationTypeVersion`](#applicationtypeversion) | string | Yes |

____
### Kind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'ExternalStore' for objects of type 'ExternalStoreProvisionApplicationTypeDescription'.

____
### `Async`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates whether or not provisioning should occur asynchronously. When set to true, the provision operation returns when the request is accepted by the system, and the provision operation continues without any timeout limit. The default value is false. For large application packages, we recommend setting the value to true.

____
### `ApplicationPackageDownloadUri`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The path to the '.sfpkg' application package from where the application package can be downloaded using HTTP or HTTPS protocols. The application package can be stored in an external store that provides GET operation to download the file. Supported protocols are HTTP and HTTPS, and the path must allow READ access.

____
### `ApplicationTypeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The application type name represents the name of the application type found in the application manifest.

____
### `ApplicationTypeVersion`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The application type version represents the version of the application type found in the application manifest.
