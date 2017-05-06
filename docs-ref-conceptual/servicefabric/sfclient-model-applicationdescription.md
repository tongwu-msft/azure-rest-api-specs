---
title: "ApplicationDescription"
ms.date: "2017-05-06"
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
# ApplicationDescription

Describes a Service Fabric application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | Yes |
| [TypeName](#typename) | string | Yes |
| [TypeVersion](#typeversion) | string | Yes |
| [ParameterList](#parameterlist) | array of [ApplicationParameter](sfclient-model-applicationparameter.md) | No |
| [ApplicationCapacity](#applicationcapacity) | [ApplicationCapacityDescription](sfclient-model-applicationcapacitydescription.md) | No |

____
### Name
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the application, including the 'fabric:' URI scheme.

____
### TypeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The application type name found in the application manifest.

____
### TypeVersion
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The version of the application type as defined in the application manifest.

____
### ParameterList
__Type__: array of [ApplicationParameter](sfclient-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application parameters with overridden values from their default values specified in the application manifest.

____
### ApplicationCapacity
__Type__: [ApplicationCapacityDescription](sfclient-model-applicationcapacitydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes capacity information for services of this application. This description can be used for describing the following.
- Reserving the capacity for the services on the nodes
- Limiting the total number of nodes that services of this application can run on
- Limiting the custom capacity metrics to limit the total consumption of this metric by the services of this application

