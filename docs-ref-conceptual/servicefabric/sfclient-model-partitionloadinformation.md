---
title: "PartitionLoadInformation"
ms.date: "2017-05-09"
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
# PartitionLoadInformation

Represents load information for a partition, which contains the primary and secondary reported load metrics.
In case there is no load reported, PartitionLoadInformation will contain the default load for the service of the partition.
For default loads, LoadMetricReport's LastReportedUtc is set to 0.


## Properties
| Name | Type | Required |
| --- | --- | --- |
| [PartitionId](#partitionid) | string (uuid) | No |
| [PrimaryLoadMetricReports](#primaryloadmetricreports) | array of [LoadMetricReport](sfclient-model-loadmetricreport.md) | No |
| [SecondaryLoadMetricReports](#secondaryloadmetricreports) | array of [LoadMetricReport](sfclient-model-loadmetricreport.md) | No |

____
### PartitionId
__Type__: string (uuid) <br/>
__Required__: No<br/>
<br/>
Id of the partition.

____
### PrimaryLoadMetricReports
__Type__: array of [LoadMetricReport](sfclient-model-loadmetricreport.md) <br/>
__Required__: No<br/>
<br/>
Array of load reports from the primary replica for this partition.

____
### SecondaryLoadMetricReports
__Type__: array of [LoadMetricReport](sfclient-model-loadmetricreport.md) <br/>
__Required__: No<br/>
<br/>
Array of aggregated load reports from all secondary replicas for this partition.
Array only contains the latest reported load for each metric.

