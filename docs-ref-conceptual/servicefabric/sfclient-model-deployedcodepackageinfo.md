---
title: "DeployedCodePackageInfo"
ms.date: "2017-04-28"
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
# DeployedCodePackageInfo

Information about code package deployed on a Service Fabric node.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [Version](#version) | string | No |
| [ServiceManifestName](#servicemanifestname) | string | No |
| [ServicePackageActivationId](#servicepackageactivationid) | string | No |
| [HostType](#hosttype) | string (enum) | No |
| [HostIsolationMode](#hostisolationmode) | string (enum) | No |
| [Status](#status) | string (enum) | No |
| [RunFrequencyInterval](#runfrequencyinterval) | string (int64) | No |
| [SetupEntryPoint](#setupentrypoint) | [CodePackageEntryPoint](sfclient-model-codepackageentrypoint.md) | No |
| [MainEntryPoint](#mainentrypoint) | [CodePackageEntryPoint](sfclient-model-codepackageentrypoint.md) | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the code package.

____
### Version
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the code package specified in service manifest.

____
### ServiceManifestName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of service manifest that specified this code package.

____
### ServicePackageActivationId
__Type__: string <br/>
__Required__: No<br/>
<br/>
The ActivationId of a deployed service package. If ServicePackageActivationMode specified at the time of creating the service
is 'SharedProcess' (or if it is not specified, in which case it defaults to 'SharedProcess'), then value of ServicePackageActivationId
is always an empty string.


____
### HostType
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the type of host for main entry point of a code package as specified in service manifest. Possible values are following.

  - Invalid - Indicates the type of host is not known or invalid. The value is 0.
  - ExeHost - Indicates the host is an executable. The value is 1.
  - ContainerHost - Indicates the host is a container. The value is 2.


____
### HostIsolationMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the isolation mode of main entry point of a code package when it's host type is ContainerHost. This is specified as part of container host policies in application manifest while importing service manifest. Possible values are following.

  - None - Indicates the isolation mode is not applicable for given HostType. The value is 0.
  - Process - This is the default isolation mode for a ContainerHost. The value is 1.
  - HyperV - Indicates the ContainerHost is a Hyper-V container. This applies to only Windows containers. The value is 2.


____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
Specifies the status of a deployed application or service package on a Service Fabric node. Possible values are following.

  - Invalid - Indicates status of the application or service package is not known or invalid. The value is 0.
  - Downloading - Indicates the application or service package is being downloaded to the node from the ImageStore. The value is 1.
  - Activating - Indicates the application or service package is being activated. The value is 2.
  - Active - Indicates the application or service package is active the node. The value is 3.
  - Upgrading - Indicates the application or service package is being upgraded. The value is 4.
  - Deactivating - Indicates the application or service package is being deactivated. The value is 5.


____
### RunFrequencyInterval
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
The interval at which code package is run. This is used for periodic code package.

____
### SetupEntryPoint
__Type__: [CodePackageEntryPoint](sfclient-model-codepackageentrypoint.md) <br/>
__Required__: No<br/>
<br/>
Information about setup or main entry point of a code package deployed on a Service Fabric node.

____
### MainEntryPoint
__Type__: [CodePackageEntryPoint](sfclient-model-codepackageentrypoint.md) <br/>
__Required__: No<br/>
<br/>
Information about setup or main entry point of a code package deployed on a Service Fabric node.
