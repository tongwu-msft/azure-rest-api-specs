---
title: "Get Cluster Health Chunk Using Policy And Advanced Filters"
ms.date: "2018-04-23"
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
# Get Cluster Health Chunk Using Policy And Advanced Filters
Gets the health of a Service Fabric cluster using health chunks.

Gets the health of a Service Fabric cluster using health chunks. The health evaluation is done based on the input cluster health chunk query description.
The query description allows users to specify health policies for evaluating the cluster and its children.
Users can specify very flexible filters to select which cluster entities to return. The selection can be done based on the entities health state and based on the hierarchy.
The query can return multi-level children of the entities based on the specified filters. For example, it can return one application with a specified name, and for this application, return
only services that are in Error or Warning, and all partitions and replicas for one of these services.


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/$/GetClusterHealthChunk?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ClusterHealthChunkQueryDescription`](#clusterhealthchunkquerydescription) | [ClusterHealthChunkQueryDescription](sfclient-v62-model-clusterhealthchunkquerydescription.md) | No | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


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
### `ClusterHealthChunkQueryDescription`
__Type__: [ClusterHealthChunkQueryDescription](sfclient-v62-model-clusterhealthchunkquerydescription.md) <br/>
__Required__: No<br/>
<br/>
Describes the cluster and application health policies used to evaluate the cluster health and the filters to select which cluster entities to be returned.
If the cluster health policy is present, it is used to evaluate the cluster events and the cluster nodes. If not present, the health evaluation uses the cluster health policy defined in the cluster manifest or the default cluster health policy.
By default, each application is evaluated using its specific application health policy, defined in the application manifest, or the default health policy, if no policy is defined in manifest.
If the application health policy map is specified, and it has an entry for an application, the specified application health policy
is used to evaluate the application health.
Users can specify very flexible filters to select which cluster entities to include in response. The selection can be done based on the entities health state and based on the hierarchy.
The query can return multi-level children of the entities based on the specified filters. For example, it can return one application with a specified name, and for this application, return
only services that are in Error or Warning, and all partitions and replicas for one of these services.


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the requested cluster health chunk information.<br/> | [ClusterHealthChunk](sfclient-v62-model-clusterhealthchunk.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |
