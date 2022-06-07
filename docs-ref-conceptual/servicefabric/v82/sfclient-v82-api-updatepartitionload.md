---
title: "Update Partition Load v82"
description: "Update Partition Load v82"
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
# Update Partition Load v82
Update the loads of provided partitions for specific metrics.

Updates the load value and predicted load value for all the partitions provided for specified metrics.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/UpdatePartitionLoad?api-version=7.2&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`PartitionMetricLoadDescriptionList`](#partitionmetricloaddescriptionlist) | array of [PartitionMetricLoadDescription](sfclient-v82-model-partitionmetricloaddescription.md) | Yes | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `7.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '7.2'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non-empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged query includes as many results as possible that fit in the return message.

____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### `PartitionMetricLoadDescriptionList`
__Type__: array of [PartitionMetricLoadDescription](sfclient-v82-model-partitionmetricloaddescription.md) <br/>
__Required__: Yes<br/>
<br/>
Description of updating load for list of partitions.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List UpdatePartitionLoadResults.<br/> | [PagedUpdatePartitionLoadResultList](sfclient-v82-model-pagedupdatepartitionloadresultlist.md) |
| All other status codes | The error code response per specified partition.<br/> | [FabricError](sfclient-v82-model-fabricerror.md) |
