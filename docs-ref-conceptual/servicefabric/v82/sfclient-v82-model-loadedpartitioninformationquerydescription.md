---
title: "LoadedPartitionInformationQueryDescription v82"
description: "LoadedPartitionInformationQueryDescription v82"
ms.date: "04/02/2021"
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
# LoadedPartitionInformationQueryDescription v82

Represents data structure that contains query information.

## Properties
| Name | Type | Required |
| --- | --- | --- |
| [`MetricName`](#metricname) | string | No |
| [`ServiceName`](#servicename) | string | No |
| [`Ordering`](#ordering) | string (enum) | No |
| [`MaxResults`](#maxresults) | integer (int64) | No |
| [`ContinuationToken`](#continuationtoken) | string | No |

____
### `MetricName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the metric for which this information is provided.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
Name of the service this partition belongs to.

____
### `Ordering`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Desc` <br/>
<br/>
Ordering of partitions' load.

Defines the order.

Possible values are: 

  - `Desc` - Descending sort order.
  - `Asc` - Ascending sort order.



____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged query includes as many results as possible that fit in the return message.

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. The continuation token is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token is not included in the response.
