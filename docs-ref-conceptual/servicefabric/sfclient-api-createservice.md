---
title: "Create Service"
ms.date: "2018-07-20"
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
# Create Service
Creates the specified Service Fabric service.

This api allows creating a new Service Fabric stateless or stateful service under a specified Service Fabric application. The description for creating the service includes partitioning information and optional properties for placement and load balancing. Some of the properties can later be modified using `UpdateService` API.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/GetServices/$/Create?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ServiceDescription`](#servicedescription) | [ServiceDescription](sfclient-model-servicedescription.md) | Yes | Body |

____
### `applicationId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the application name is "fabric:/myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


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
### `ServiceDescription`
__Type__: [ServiceDescription](sfclient-model-servicedescription.md) <br/>
__Required__: Yes<br/>
<br/>
The information necessary to create a service.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Basic stateless service

This example shows how to create a basic stateless Service Fabric service.

#### Request
```
POST http://localhost:19080/Applications/test/$/GetServices/$/Create?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateless",
  "ApplicationName": "fabric:/test",
  "ServiceName": "fabric:/test/test1",
  "ServiceTypeName": "StatelessFrontendService",
  "PartitionDescription": {
    "PartitionScheme": "Singleton"
  },
  "InstanceCount": "4"
}
```

#### 202 Response
##### Body
The response body is empty.
### Basic stateful service

This example shows how to create a basic stateful Service Fabric service.

#### Request
```
POST http://localhost:19080/Applications/test/$/GetServices/$/Create?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateful",
  "ApplicationName": "fabric:/test",
  "ServiceName": "fabric:/test/test2",
  "ServiceTypeName": "StatefulBackendService",
  "PartitionDescription": {
    "PartitionScheme": "Singleton"
  },
  "TargetReplicaSetSize": "3",
  "MinReplicaSetSize": "2",
  "HasPersistedState": false
}
```

#### 202 Response
##### Body
The response body is empty.
### Stateless service with dns name and auto scaling

This example shows how to create a stateless Service Fabric service with a dns name definied and auto scaling based on cpu usage.

#### Request
```
POST http://localhost:19080/Applications/test/$/GetServices/$/Create?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateless",
  "ApplicationName": "fabric:/test",
  "ServiceName": "fabric:/test/test1",
  "ServiceTypeName": "StatelessFrontendService",
  "InitializationData": [],
  "PartitionDescription": {
    "PartitionScheme": "Singleton"
  },
  "InstanceCount": "2",
  "PlacementConstraints": "Color==Blue",
  "CorrelationScheme": [],
  "ServiceLoadMetrics": [],
  "ServicePlacementPolicies": [],
  "DefaultMoveCost": "Low",
  "IsDefaultMoveCostSpecified": true,
  "ServicePackageActivationMode": "ExclusiveProcess",
  "ServiceDnsName": "test1.test",
  "ScalingPolicies": [
    {
      "ScalingTrigger": {
        "Kind": "AveragePartitionLoad",
        "MetricName": "servicefabric:/_CpuCores",
        "LowerLoadThreshold": "0.3",
        "UpperLoadThreshold": "0.8",
        "ScaleIntervalInSeconds": "600"
      },
      "ScalingMechanism": {
        "Kind": "PartitionInstanceCount",
        "MinInstanceCount": "1",
        "MaxInstanceCount": "6",
        "ScaleIncrement": "2"
      }
    }
  ]
}
```

#### 202 Response
##### Body
The response body is empty.
### Stateful service with named partitions and auto scaling

This example shows how to create a stateful Service Fabric service with named partitions and scaling enabled based on memory usage.

#### Request
```
POST http://localhost:19080/Applications/test/$/GetServices/$/Create?api-version=6.0
```

##### Body
```json
{
  "ServiceKind": "Stateful",
  "ApplicationName": "fabric:/test",
  "ServiceName": "fabric:/test/test2",
  "ServiceTypeName": "StatefulBackendService",
  "InitializationData": [],
  "PartitionDescription": {
    "PartitionScheme": "NamedParitionSchemeDescription",
    "Count": "1",
    "Names": [
      "0"
    ]
  },
  "TargetReplicaSetSize": "3",
  "MinReplicaSetSize": "2",
  "HasPersistedState": true,
  "ServicePackageActivationMode": "ExclusiveProcess",
  "ScalingPolicies": [
    {
      "ScalingTrigger": {
        "Kind": "AverageServiceLoad",
        "MetricName": "servicefabric:/_MemoryInMB",
        "LowerLoadThreshold": "500",
        "UpperLoadThreshold": "900",
        "ScaleIntervalInSeconds": "600"
      },
      "ScalingMechanism": {
        "Kind": "AddRemoveIncrementalNamedPartition",
        "MinPartitionCount": "1",
        "MaxPartitionCount": "3",
        "ScaleIncrement": "1"
      }
    }
  ]
}
```

#### 202 Response
##### Body
The response body is empty.