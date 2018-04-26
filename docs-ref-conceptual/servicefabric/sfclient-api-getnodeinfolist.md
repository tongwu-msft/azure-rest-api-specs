---
title: "Get Node Info List"
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
# Get Node Info List
Gets the list of nodes in the Service Fabric cluster.

Gets the list of nodes in the Service Fabric cluster. The response includes the name, status, id, health, uptime, and other details about the node.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes?api-version=6.0&ContinuationToken={ContinuationToken}&NodeStatusFilter={NodeStatusFilter}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`NodeStatusFilter`](#nodestatusfilter) | string (enum) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

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
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `NodeStatusFilter`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `default` <br/>
<br/>
Allows filtering the nodes based on the NodeStatus. Only the nodes that are matching the specified filter value will be returned. The filter value can be one of the following. Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'

____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of nodes in the cluster.<br/> | [PagedNodeInfoList](sfclient-model-pagednodeinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get information about all nodes

This example shows how to get information about all the nodes in the cluster when the information fits in a single response message without the need for paging through ContinuationToken parameter.

#### Request
```
GET http://localhost:19080/Nodes?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Name": "_Node_4",
      "IpAddressOrFQDN": "localhost",
      "Type": "NodeType4",
      "CodeVersion": "5.6.135.9494",
      "ConfigVersion": "1.0",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "526996",
      "HealthState": "Ok",
      "IsSeedNode": false,
      "UpgradeDomain": "4",
      "FaultDomain": "fd:/4",
      "Id": {
        "Id": "4f4e3698a196896b5efe8156cc4e1351"
      },
      "InstanceId": "131353697443064929",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-01-10T19:10:59.812Z",
      "NodeDownAt": "0001-01-01T00:00:00Z"
    },
    {
      "Name": "_Node_3",
      "IpAddressOrFQDN": "localhost",
      "Type": "NodeType3",
      "CodeVersion": "5.6.135.9494",
      "ConfigVersion": "1.0",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "526954",
      "HealthState": "Ok",
      "IsSeedNode": false,
      "UpgradeDomain": "3",
      "FaultDomain": "fd:/3",
      "Id": {
        "Id": "6b5c3db003a0bd126f7b8a86fc3916a4"
      },
      "InstanceId": "131353697864903666",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-01-10T19:10:59.812Z",
      "NodeDownAt": "0001-01-01T00:00:00Z"
    },
    {
      "Name": "_Node_2",
      "IpAddressOrFQDN": "localhost",
      "Type": "NodeType2",
      "CodeVersion": "5.6.135.9494",
      "ConfigVersion": "1.0",
      "NodeStatus": "Disabled",
      "NodeUpTimeInSeconds": "1710571",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "2",
      "FaultDomain": "fd:/2",
      "Id": {
        "Id": "876a44d9185bf9416336b22e5d37cde8"
      },
      "InstanceId": "131341861291227632",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Pause",
        "NodeDeactivationStatus": "Completed",
        "NodeDeactivationTask": [
          {
            "NodeDeactivationTaskId": {
              "Id": "876a44d9185bf9416336b22e5d37cde8",
              "NodeDeactivationTaskType": "Client"
            },
            "NodeDeactivationIntent": "Pause"
          }
        ],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-01-10T19:10:59.812Z",
      "NodeDownAt": "0001-01-01T00:00:00Z"
    },
    {
      "Name": "_Node_1",
      "IpAddressOrFQDN": "localhost",
      "Type": "NodeType1",
      "CodeVersion": "5.6.135.9494",
      "ConfigVersion": "1.0",
      "NodeStatus": "Disabling",
      "NodeUpTimeInSeconds": "1710571",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "1",
      "FaultDomain": "fd:/1",
      "Id": {
        "Id": "a3784be1d81710242ed0a9632647b4f7"
      },
      "InstanceId": "131341861290236579",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Pause",
        "NodeDeactivationStatus": "SafetyCheckInProgress",
        "NodeDeactivationTask": [
          {
            "NodeDeactivationTaskId": {
              "Id": "a3784be1d81710242ed0a9632647b4f7",
              "NodeDeactivationTaskType": "Client"
            },
            "NodeDeactivationIntent": "Pause"
          }
        ],
        "PendingSafetyChecks": [
          {
            "SafetyCheck": {
              "Kind": "EnsureSeedNodeQuorum"
            }
          }
        ]
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-01-10T19:10:59.812Z",
      "NodeDownAt": "0001-01-01T00:00:00Z"
    },
    {
      "Name": "_Node_0",
      "IpAddressOrFQDN": "localhost",
      "Type": "NodeType0",
      "CodeVersion": "5.6.135.9494",
      "ConfigVersion": "1.0",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "1710571",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "0",
      "FaultDomain": "fd:/0",
      "Id": {
        "Id": "bf865279ba277deb864a976fbf4c200e"
      },
      "InstanceId": "131341861289826291",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-01-10T19:10:59.812Z",
      "NodeDownAt": "0001-01-01T00:00:00Z"
    }
  ]
}
```

