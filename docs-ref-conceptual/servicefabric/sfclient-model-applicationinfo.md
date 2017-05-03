---
title: "ApplicationInfo"
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
# ApplicationInfo

Information about a Service Fabric application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Id](#id) | string | No |
| [Name](#name) | string | No |
| [TypeName](#typename) | string | No |
| [TypeVersion](#typeversion) | string | No |
| [Status](#status) | string (enum) | No |
| [Parameters](#parameters) | array of [ApplicationParameter](sfclient-model-applicationparameter.md) | No |
| [HealthState](#healthstate) | string (enum) | No |

____
### Id
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the application. This is same as application name without the 'fabric:' URI scheme. This is used in the REST APIs to identify the application resource.

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Uniform Resource Identifier(URI) of the application.

____
### TypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Name of the application type as specified in the Application Manifest.

____
### TypeVersion
__Type__: string <br/>
__Required__: No<br/>
<br/>
The version of the application type as specified in the Application Manifest.

____
### Status
__Type__: string (enum) <br/>
__Required__: No<br/>
<br/>
The status of the application. Possible values are.
- Invalid - Indicates the application status is invalid. All Service Fabric enumerations have the invalid type. The value is zero. - Ready - Indicates the application status is ready. The value is 1. - Upgrading - Indicates the application status is upgrading. The value is 2. - Creating - Indicates the application status is creating. The value is 3. - Deleting - Indicates the application status is deleting. The value is 4. - Failed - Indicates the creation or deletion of application was terminated due to persistent failures. Another create/delete request can be accepted to resume a failed application. The value is 5.

____
### Parameters
__Type__: array of [ApplicationParameter](sfclient-model-applicationparameter.md) <br/>
__Required__: No<br/>
<br/>
List of application parameters with overridden values from their default values specified in the application manifest.

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

