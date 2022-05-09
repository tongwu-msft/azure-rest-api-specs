---
title: "ApplicationLoadMetricInformation v82"
description: "ApplicationLoadMetricInformation v82"
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
# ApplicationLoadMetricInformation v82

Describes load information for a custom resource balancing metric. This can be used to limit the total consumption of this metric by the services of this application.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`Name`](#name) | string | No |
| [`ReservationCapacity`](#reservationcapacity) | integer (int64) | No |
| [`ApplicationCapacity`](#applicationcapacity) | integer (int64) | No |
| [`ApplicationLoad`](#applicationload) | integer (int64) | No |

____
### `Name`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of the metric.

____
### `ReservationCapacity`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
This is the capacity reserved in the cluster for the application.
It's the product of NodeReservationCapacity and MinimumNodes.
If set to zero, no capacity is reserved for this metric.
When setting application capacity or when updating application capacity this value must be smaller than or equal to MaximumCapacity for each metric.


____
### `ApplicationCapacity`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Total capacity for this metric in this application instance.


____
### `ApplicationLoad`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
Current load for this metric in this application instance.

