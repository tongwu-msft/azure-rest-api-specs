---
title: "Get Chaos Events"
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
# Get Chaos Events
Gets the next segment of the Chaos events based on the continuation token or the time range.

To get the next segment of the Chaos events, you can specify the ContinuationToken. To get the start of a new segment of Chaos events, you can specify the time range
through StartTimeUtc and EndTimeUtc. You cannot specify both the ContinuationToken and the time range in the same call.
When there are more than 100 Chaos events, the Chaos events are returned in multiple segments where a segment contains no more than 100 Chaos events and to get the next segment you make a call to this API with the continuation token.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Tools/Chaos/Events?api-version=6.2&ContinuationToken={ContinuationToken}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`StartTimeUtc`](#starttimeutc) | string | No | Query |
| [`EndTimeUtc`](#endtimeutc) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `StartTimeUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Windows file time representing the start time of the time range for which a Chaos report is to be generated. Please consult [DateTime.ToFileTimeUtc Method](https://msdn.microsoft.com/en-us/library/system.datetime.tofiletimeutc(v=vs.110).aspx) for details.

____
### `EndTimeUtc`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The Windows file time representing the end time of the time range for which a Chaos report is to be generated. Please consult [DateTime.ToFileTimeUtc Method](https://msdn.microsoft.com/en-us/library/system.datetime.tofiletimeutc(v=vs.110).aspx) for details.

____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged queries includes as many results as possible that fit in the return message.

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
| 200 (OK) | Next segment of Chaos events.<br/> | [ChaosEventsSegment](sfclient-v62-model-chaoseventssegment.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get Chaos events given a time range

This example shows how to get Chaos events in a single response message without the need for paging through ContinuationToken parameter.

#### Request
```
GET http://localhost:19080/Tools/Chaos/Events?api-version=6.2&StartTimeUtc=0&EndTimeUtc=3155378975999999999
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "History": [
    {
      "ChaosEvent": {
        "Kind": "Started",
        "TimeStampUtc": "2017-04-14T04:27:19.049Z",
        "ChaosParameters": {
          "MaxClusterStabilizationTimeoutInSeconds": "30",
          "MaxConcurrentFaults": "3",
          "WaitTimeBetweenIterationsInSeconds": "10",
          "WaitTimeBetweenFaultsInSeconds": "1",
          "TimeToRunInSeconds": "3600",
          "EnableMoveReplicaFaults": true,
          "ClusterHealthPolicy": {
            "ConsiderWarningAsError": true,
            "MaxPercentUnhealthyNodes": "0",
            "MaxPercentUnhealthyApplications": "10",
            "ApplicationTypeHealthPolicyMap": [
              {
                "Key": "myapp",
                "Value": "3"
              }
            ]
          },
          "Context": {
            "Map": {
              "k1": "v1",
              "k2": "v2",
              "k3": "v5"
            }
          }
        }
      }
    },
    {
      "ChaosEvent": {
        "Kind": "ExecutingFaults",
        "TimeStampUtc": "2017-04-14T04:27:20.667Z",
        "Faults": [
          "ActionType: RestartReplica, ServiceUri: fabric:/TestApp1/PersistServ_6R_1, PartitionId: 6a91b09a-bd76-45da-afaa-ed0fd9bfe7d2, ReplicaId: 131366172775684622",
          "ActionType: CodePackageRestart, NodeName: N0050, ApplicationName: fabric:/TestApp1, ServiceManifestName: SP1, ServiceManifestName: , CodePackageName: CP1.",
          "ActionType: RestartReplica, ServiceUri: fabric:/TestApp1/PersistServ_6R_3, PartitionId: baa3a51e-5c42-435e-89d3-6e97b2164661, ReplicaId: 131366172988968762"
        ]
      }
    }
  ]
}
```

