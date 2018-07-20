---
title: "Get Node Info List"
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
# Get Node Info List
Gets the list of nodes in the Service Fabric cluster.

The response includes the name, status, ID, health, uptime, and other details about the nodes.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes?api-version=6.3&ContinuationToken={ContinuationToken}&NodeStatusFilter={NodeStatusFilter}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`NodeStatusFilter`](#nodestatusfilter) | string (enum) | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.3` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.3'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non-empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `NodeStatusFilter`
__Type__: string (enum) <br/>
__Required__: No<br/>
__Default__: `default` <br/>
<br/>
Allows filtering the nodes based on the NodeStatus. Only the nodes that are matching the specified filter value will be returned. The filter value can be one of the following. Possible values include: 'default', 'all', 'up', 'down', 'enabling', 'disabling', 'disabled', 'unknown', 'removed'

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
GET http://localhost:19080/Nodes?api-version=6.3
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Name": "_Node_1",
      "IpAddressOrFQDN": "10.0.0.5",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "15275",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "1",
      "FaultDomain": "fd:/1",
      "Id": {
        "Id": "ebd986a1134b3643a8117fb41b259bf"
      },
      "InstanceId": "131738274982501335",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T20:31:39.842Z",
      "NodeDownAt": "2018-06-18T20:31:37.374Z"
    },
    {
      "Name": "_Node_0",
      "IpAddressOrFQDN": "10.0.0.4",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "18742",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "0",
      "FaultDomain": "fd:/0",
      "Id": {
        "Id": "2acb9f55540659b1c95f27cc128ab326"
      },
      "InstanceId": "131738240209152398",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T19:33:52.944Z",
      "NodeDownAt": "2018-06-18T19:33:39.514Z"
    },
    {
      "Name": "_Node_4",
      "IpAddressOrFQDN": "10.0.0.8",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "101168",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "4",
      "FaultDomain": "fd:/4",
      "Id": {
        "Id": "ba9383d728221add7fa996bf67b757fb"
      },
      "InstanceId": "131737415865259763",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-17T20:40:07.378Z",
      "NodeDownAt": "2018-06-17T20:33:11.877Z"
    },
    {
      "Name": "_Node_3",
      "IpAddressOrFQDN": "10.0.0.7",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "15236",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "3",
      "FaultDomain": "fd:/3",
      "Id": {
        "Id": "d6a18a0935a3e39aeae2a049eb97255d"
      },
      "InstanceId": "131738275300526952",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T20:32:18.884Z",
      "NodeDownAt": "2018-06-18T20:31:59.128Z"
    },
    {
      "Name": "_Node_2",
      "IpAddressOrFQDN": "10.0.0.6",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "19440",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "2",
      "FaultDomain": "fd:/2",
      "Id": {
        "Id": "f2af91e5e9c8254dedb75b1424a9e3fc"
      },
      "InstanceId": "131738233282843485",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T19:22:15.272Z",
      "NodeDownAt": "2018-06-18T19:22:02.74Z"
    }
  ]
}
```


### Limit maximum results

This example shows how to get information about the nodes in the cluster when the number of results returned is limited by the MaxResults parameter.

#### Request
```
GET http://localhost:19080/Nodes?api-version=6.3&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "2acb9f55540659b1c95f27cc128ab326",
  "Items": [
    {
      "Name": "_testnode_1",
      "IpAddressOrFQDN": "10.0.0.5",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "102016",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "1",
      "FaultDomain": "fd:/1",
      "Id": {
        "Id": "ebd986a1134b3643a8117fb41b259bf"
      },
      "InstanceId": "131738274982501335",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T20:31:39.842Z",
      "NodeDownAt": "2018-06-18T20:31:37.374Z"
    },
    {
      "Name": "_testnode_0",
      "IpAddressOrFQDN": "10.0.0.4",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "105483",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "0",
      "FaultDomain": "fd:/0",
      "Id": {
        "Id": "2acb9f55540659b1c95f27cc128ab326"
      },
      "InstanceId": "131738240209152398",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T19:33:52.944Z",
      "NodeDownAt": "2018-06-18T19:33:39.514Z"
    }
  ]
}
```


### Page using continuation token

This example shows how to get information about nodes in the cluster which appear on a sequential page, by using the ContinuationToken parameter.

#### Request
```
GET http://localhost:19080/Nodes?api-version=6.3&ContinuationToken=2acb9f55540659b1c95f27cc128ab326
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Name": "_Node_4",
      "IpAddressOrFQDN": "10.0.0.8",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "101547",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "4",
      "FaultDomain": "fd:/4",
      "Id": {
        "Id": "ba9383d728221add7fa996bf67b757fb"
      },
      "InstanceId": "131737415865259763",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-17T20:40:07.378Z",
      "NodeDownAt": "2018-06-17T20:33:11.877Z"
    },
    {
      "Name": "_Node_3",
      "IpAddressOrFQDN": "10.0.0.7",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "15615",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "3",
      "FaultDomain": "fd:/3",
      "Id": {
        "Id": "d6a18a0935a3e39aeae2a049eb97255d"
      },
      "InstanceId": "131738275300526952",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T20:32:18.884Z",
      "NodeDownAt": "2018-06-18T20:31:59.128Z"
    },
    {
      "Name": "_Node_2",
      "IpAddressOrFQDN": "10.0.0.6",
      "Type": "testnode",
      "CodeVersion": "6.3.139.9494",
      "ConfigVersion": "5",
      "NodeStatus": "Up",
      "NodeUpTimeInSeconds": "19819",
      "HealthState": "Ok",
      "IsSeedNode": true,
      "UpgradeDomain": "2",
      "FaultDomain": "fd:/2",
      "Id": {
        "Id": "f2af91e5e9c8254dedb75b1424a9e3fc"
      },
      "InstanceId": "131738233282843485",
      "NodeDeactivationInfo": {
        "NodeDeactivationIntent": "Invalid",
        "NodeDeactivationStatus": "None",
        "NodeDeactivationTask": [],
        "PendingSafetyChecks": []
      },
      "IsStopped": false,
      "NodeDownTimeInSeconds": "0",
      "NodeUpAt": "2018-06-18T19:22:15.272Z",
      "NodeDownAt": "2018-06-18T19:22:02.74Z"
    }
  ]
}
```

