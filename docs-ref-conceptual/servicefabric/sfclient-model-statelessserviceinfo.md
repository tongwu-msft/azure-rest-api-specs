---
title: "StatelessServiceInfo"
ms.date: "2017-04-29"
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
# StatelessServiceInfo

Information about a stateless Service Fabric service.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ServiceKind](#servicekind) | string | Yes |
| [Id](#id) | string | No |
| [Name](#name) | string | No |
| [TypeName](#typename) | string | No |
| [ManifestVersion](#manifestversion) | string | No |
| [HealthState](#healthstate) | string (enum) | No |
| [ServiceStatus](#servicestatus) | string (enum) | No |
| [IsServiceGroup](#isservicegroup) | boolean | No |

____
### ServiceKind
__Type__: string <br/>
__Required__: Yes <br/>
<br/>
A discriminator property. Its value must be 'Stateless' for objects of type 'StatelessServiceInfo'.

____
### Id
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the service. This is same as service name without the 'fabric:' URI scheme. This is used in the REST APIs to identify the service resource.

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
Full hierarchical name of the service in URI format starting with `fabric:`.

____
### TypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the service type as specified in the service manifest.

____
### ManifestVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the service manifest.

____
### HealthState
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The health state of a Service Fabric entity such as Cluster, Node, Application, Service, Partition, Replica etc.

  - Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.
  - Ok - Indicates the health state is okay. The value is 1.
  - Warning - Indicates the health state is at a warning level. The value is 2.
  - Error - Indicates the health state is at an error level. Error health state should be investigated, as they can impact the correct functionality of the cluster. The value is 3.
  - Unknown - Indicates an unknown health status. The value is 65535.


____
### ServiceStatus
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the application. Possible values are:

- Unknown - Indicates the service status is unknown. The value is zero.
- Active - Indicates the service status is active. The value is 1.
- Upgrading - Indicates the service is upgrading. The value is 2.
- Deleting - Indicates the service is being deleted. The value is 3.
- Creating - Indicates the service is being created. The value is 4.
- Failed - Indicates creation or deletion was terminated due to persistent failures. Another create/delete request can be accepted. The value is 5.


____
### IsServiceGroup
__Type__: boolean <br/>
__Required__: No<br/>
<br/>
Whether the service is in a service group.
