---
title: "ApplicationMetricDescription"
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
# ApplicationMetricDescription

Describes capacity information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [Name](#name) | string | No |
| [MaximumCapacity](#maximumcapacity) | integer (int64) | No |
| [ReservationCapacity](#reservationcapacity) | integer (int64) | No |
| [TotalApplicationCapacity](#totalapplicationcapacity) | integer (int64) | No |

____
### Name
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the metric.

____
### MaximumCapacity
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum node capacity for Service Fabric application. 
This is the maximum Load for an instance of this application on a single node. Even if the capacity of node is greater than this value, Service Fabric will limit the total load of services within the application on each node to this value. 
If set to zero, capacity for this metric is unlimited on each node. 
When creating a new application with application capacity defined, the product of MaximumNodes and this value must always be smaller than or equal to TotalApplicationCapacity. 
When updating existing application with application capacity, the product of MaximumNodes and this value must always be smaller than or equal to TotalApplicationCapacity.


____
### ReservationCapacity
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The node reservation capacity for Service Fabric application. 
This is the amount of load which is reserved on nodes which have instances of this application. 
If MinimumNodes is specified, then the product of these values will be the capacity reserved in the cluster for the application. 
If set to zero, no capacity is reserved for this metric. 
When setting application capacity or when updating application capacity; this value must be smaller than or equal to MaximumCapacity for each metric. 


____
### TotalApplicationCapacity
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The total metric capacity for Service Fabric application. 
This is the total metric capacity for this application in the cluster. Service Fabric will try to limit the sum of loads of services within the application to this value. 
When creating a new application with application capacity defined, the product of MaximumNodes and MaximumCapacity must always be smaller than or equal to this value. 

