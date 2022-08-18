---
title: "ProvisionApplicationTypeDescription v82"
description: "ProvisionApplicationTypeDescription v82"
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
# ProvisionApplicationTypeDescription v82

Describes the operation to register or provision an application type using an application package uploaded to the Service Fabric image store.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Async`](#async) | boolean | Yes |
| [`ApplicationTypeBuildPath`](#applicationtypebuildpath) | string | Yes |
| [`ApplicationPackageCleanupPolicy`](#applicationpackagecleanuppolicy) | string (enum) | No |

____
### `Async`
__Type__: boolean <br/>
__Required__: Yes<br/>
<br/>
Indicates whether or not provisioning should occur asynchronously. When set to true, the provision operation returns when the request is accepted by the system, and the provision operation continues without any timeout limit. The default value is false. For large application packages, we recommend setting the value to true.

____
### `ApplicationTypeBuildPath`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The relative path for the application package in the image store specified during the prior upload operation.

____
### `ApplicationPackageCleanupPolicy`
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>


The kind of action that needs to be taken for cleaning up the application package after successful provision.

Possible values are: 

  - `Invalid` - Indicates that the application package cleanup policy is invalid. This value is default. The value is zero.
  - `Default` - Indicates that the cleanup policy of application packages is based on the cluster setting "CleanupApplicationPackageOnProvisionSuccess." The value is 1.
  - `Automatic` - Indicates that the service fabric runtime determines when to do the application package cleanup. By default, cleanup is done on successful provision. The value is 2.
  - `Manual` - Indicates that the user has to explicitly clean up the application package. The value is 3.


