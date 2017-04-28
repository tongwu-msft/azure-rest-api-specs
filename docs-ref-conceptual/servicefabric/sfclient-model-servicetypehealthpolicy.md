---
title: "ServiceTypeHealthPolicy"
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
# ServiceTypeHealthPolicy

Represents the health policy used to evaluate the health of services belonging to a service type.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [MaxPercentUnhealthyPartitionsPerService](#maxpercentunhealthypartitionsperservice) | integer | No |
| [MaxPercentUnhealthyReplicasPerPartition](#maxpercentunhealthyreplicasperpartition) | integer | No |
| [MaxPercentUnhealthyServices](#maxpercentunhealthyservices) | integer | No |

____
### MaxPercentUnhealthyPartitionsPerService
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy partitions per service. Allowed values are Byte values from zero to 100

The percentage represents the maximum tolerated percentage of partitions that can be unhealthy before the service is considered in error.
If the percentage is respected but there is at least one unhealthy partition, the health is evaluated as Warning.
The percentage is calculated by dividing the number of unhealthy partitions over the total number of partitions in the service.
The computation rounds up to tolerate one failure on small numbers of partitions. Default percentage is zero.


____
### MaxPercentUnhealthyReplicasPerPartition
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum allowed percentage of unhealthy replicas per partition. Allowed values are Byte values from zero to 100.

The percentage represents the maximum tolerated percentage of replicas that can be unhealthy before the partition is considered in error.
If the percentage is respected but there is at least one unhealthy replica, the health is evaluated as Warning.
The percentage is calculated by dividing the number of unhealthy replicas over the total number of replicas in the partition.
The computation rounds up to tolerate one failure on small numbers of replicas. Default percentage is zero.


____
### MaxPercentUnhealthyServices
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
The maximum maximum allowed percentage of unhealthy services. Allowed values are Byte values from zero to 100.

The percentage represents the maximum tolerated percentage of services that can be unhealthy before the application is considered in error.
If the percentage is respected but there is at least one unhealthy service, the health is evaluated as Warning.
This is calculated by dividing the number of unhealthy services of the specific service type over the total number of services of the specific service type.
The computation rounds up to tolerate one failure on small numbers of services. Default percentage is zero.

