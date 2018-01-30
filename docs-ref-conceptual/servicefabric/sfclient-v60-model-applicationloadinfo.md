---
title: "ApplicationLoadInfo"
ms.date: "2017-10-02"
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
# ApplicationLoadInfo

Load Information about a Service Fabric application.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Id](#id) | string | No |
| [MinimumNodes](#minimumnodes) | integer (int64) | No |
| [MaximumNodes](#maximumnodes) | integer (int64) | No |
| [NodeCount](#nodecount) | integer (int64) | No |
| [ApplicationLoadMetricInformation](#applicationloadmetricinformation) | array of [ApplicationMetricDescription](sfclient-v60-model-applicationmetricdescription.md) | No |

____
### Id
__Type__: string <br/>
__Required__: No<br/>
<br/>
The identity of the application. This is an encoded representation of the application name. This is used in the REST APIs to identify the application resource. 

Starting in version 6.0, hierarchical names are delimited with the "~" character. For example, if the application name is "fabric://myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### MinimumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The minimum number of nodes for this application.
It is the number of nodes where Service Fabric will reserve Capacity in the cluster which equals to ReservedLoad * MinimumNodes for this Application instance.
For applications that do not have application capacity defined this value will be zero.


____
### MaximumNodes
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum number of nodes where this application can be instantiated.
It is the number of nodes this application is allowed to span.
For applications that do not have application capacity defined this value will be zero.


____
### NodeCount
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The number of nodes on which this application is instantiated.
For applications that do not have application capacity defined this value will be zero.


____
### ApplicationLoadMetricInformation
__Type__: array of [ApplicationMetricDescription](sfclient-v60-model-applicationmetricdescription.md) <br/>
__Required__: No<br/>
<br/>
List of application capacity metric description.
