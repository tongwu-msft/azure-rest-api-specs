---
title: "Get Loaded Partition Info List v82"
description: "Get Loaded Partition Info List v82"
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
# Get Loaded Partition Info List v82
Gets ordered list of partitions.

Retrieves partitions which are most/least loaded according to specified metric.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/$/GetLoadedPartitionInfoList?api-version=8.0&MetricName={MetricName}&ServiceName={ServiceName}&Ordering={Ordering}&MaxResults={MaxResults}&ContinuationToken={ContinuationToken}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`MetricName`](#metricname) | string | Yes | Query |
| [`ServiceName`](#servicename) | string | No | Query |
| [`Ordering`](#ordering) | string (enum) | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `8.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '8.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `MetricName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Name of the metric based on which to get ordered list of partitions.

____
### `ServiceName`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The name of a service.

____
### `Ordering`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `Desc` <br/>
<br/>
Ordering of partitions' load. Possible values include: 'Desc', 'Asc'

____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged query includes as many results as possible that fit in the return message.

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non-empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested cluster load information.<br/> | [LoadedPartitionInformationResultList](sfclient-v82-model-loadedpartitioninformationresultlist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
