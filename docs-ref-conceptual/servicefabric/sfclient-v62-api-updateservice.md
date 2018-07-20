---
title: "Update Service"
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
# Update Service
Updates a Service Fabric service using the specified update description.

This API allows updating properties of a running Service Fabric service. The set of properties that can be updated are a subset of the properties that were specified at the time of creating the service. The current set of properties can be obtained using `GetServiceDescription` API. Please note that updating the properties of a running service is different than upgrading your application using `StartApplicationUpgrade` API. The upgrade is a long running background operation that involves moving the application from one version to another, one upgrade domain at a time, whereas update applies the new properties immediately to the service.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Services/{serviceId}/$/Update?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ServiceUpdateDescription`](#serviceupdatedescription) | [ServiceUpdateDescription](sfclient-v62-model-serviceupdatedescription.md) | Yes | Body |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


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
### `ServiceUpdateDescription`
__Type__: [ServiceUpdateDescription](sfclient-v62-model-serviceupdatedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The information necessary to update a service.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Stateless service

This example shows how to update placement and load balancing related settings of a stateless Service Fabric service.

#### Request
```
POST http://localhost:19080/Services/test~test1/$/Update?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateless",
  "Flags": "1568",
  "PlacementConstraints": "Color==Red",
  "DefaultMoveCost": "High",
  "ScalingPolicies": [
    {
      "ScalingTrigger": {
        "Kind": "AveragePartitionLoad",
        "MetricName": "servicefabric:/_CpuCores",
        "LowerLoadThreshold": "0.5",
        "UpperLoadThreshold": "0.8",
        "ScaleIntervalInSeconds": "900"
      },
      "ScalingMechanism": {
        "Kind": "PartitionInstanceCount",
        "MinInstanceCount": "4",
        "MaxInstanceCount": "6",
        "ScaleIncrement": "2"
      }
    }
  ]
}
```

#### 200 Response
##### Body
The response body is empty.
### Stateful service

This example shows how to update placement and load balancing related settings of a stateful Service Fabric service.

#### Request
```
POST http://localhost:19080/Services/test~test2/$/Update?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateful",
  "Flags": "40",
  "PlacementConstraints": "Color==Green",
  "StandByReplicaKeepDurationSeconds": "1000"
}
```

#### 200 Response
##### Body
The response body is empty.