---
title: "ServiceFromTemplateDescription"
ms.date: "2017-05-03"
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
# ServiceFromTemplateDescription

Defines description for creating a Service Fabric service from a template defined in the application manifest.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [ApplicationName](#applicationname) | string | Yes |
| [ServiceName](#servicename) | string | Yes |
| [ServiceTypeName](#servicetypename) | string | Yes |
| [InitializationData](#initializationdata) | array of integer | No |
| [ServicePackageActivationMode](#servicepackageactivationmode) | string (enum) | No |
| [ServiceDnsName](#servicednsname) | string | No |

____
### ApplicationName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Full name of the application.

____
### ServiceName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Full name of the service.

____
### ServiceTypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the Service Fabric service type.

____
### InitializationData
__Type__: array of integer <br/>
__Required__: No<br/>
<br/>
The initialization data for the newly created service instance.

____
### ServicePackageActivationMode
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The activation mode of service package to be used for a service.

The activation mode of service package to be used for a Service Fabric service. This is specified at the time of creating the Service. Possible values are following.

  - SharedProcess - This is the default activation mode. With this activation mode, replicas or instances from different partition(s) of service, on a given node, will share same activation of service package on a node. The value is zero.
  - ExclusiveProcess - With this activation mode, each replica or instance of service, on a given node, will have its own dedicated activation of service package on a node. The value is 1.



____
### ServiceDnsName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The DNS name of the service. It requires the DNS system service to be enabled in Service Fabric cluster.
