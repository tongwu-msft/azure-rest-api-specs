---
title: "Get Chaos Report"
ms.date: "2017-04-29"
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
# Get Chaos Report
Gets the next segment of the Chaos report based on the passed-in continuation token or the passed-in time-range.

You can either specify the ContinuationTokenOptionalQueryParam to get the next segment of the Chaos report or you can specify the time-range
through StartTimeUtcOptionalQueryParam and EndTimeUtcOptionalQueryParam, but you cannot specify both the ContinuationTokenOptionalQueryParam and the time-range at the same time.
When the Chaos report contains more than 100 Chaos events, the Chaos report is returned in segments where a segment contains no more than 100 Chaos events.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Tools/Chaos/$/Report?api-version=3.0&ContinuationToken={ContinuationToken}&StartTimeUtc={StartTimeUtc}&EndTimeUtc={EndTimeUtc}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [StartTimeUtc](#starttimeutc) | string (int64) | No | Query |
| [EndTimeUtc](#endtimeutc) | string (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### StartTimeUtc
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
Start of the time range for which a Chaos report is to be generated.

____
### EndTimeUtc
__Type__: string (int64) <br/>
__Required__: No<br/>
<br/>
End of the time range for which a Chaos report is to be generated.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Next segment of Chaos report.<br/> | [ChaosReport](sfclient-model-chaosreport.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get Chaos report given a time range

This example shows how to get Chaos report in a single response message without the need for paging through ContinuationToken parameter.

#### Request
```
GET http://localhost:19080/Tools/Chaos/$/Report?api-version=3.0&StartTimeUtc=0&EndTimeUtc=3155378975999999999
```

#### 200 Response
##### Body
```json
{
  "ChaosParameters": {
    "MaxClusterStabilizationTimeoutInSeconds": 30,
    "MaxConcurrentFaults": 3,
    "WaitTimeBetweenIterationsInSeconds": 10,
    "WaitTimeBetweenFaultsInSeconds": 1,
    "TimeToRunInSeconds": "3600",
    "EnableMoveReplicaFaults": true,
    "ClusterHealthPolicy": {
      "ConsiderWarningAsError": true,
      "MaxPercentUnhealthyNodes": 0,
      "MaxPercentUnhealthyApplications": 10,
      "ApplicationTypeHealthPolicyMap": [
        {
          "Key": "myapp",
          "Value": 3
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
  },
  "Status": "Running",
  "ContinuationToken": "",
  "History": [
    {
      "ChaosEvent": {
        "Kind": "Started",
        "TimeStampUtc": "2017-04-14T04:27:19.049Z",
        "ChaosParameters": {
          "MaxClusterStabilizationTimeoutInSeconds": 30,
          "MaxConcurrentFaults": 3,
          "WaitTimeBetweenIterationsInSeconds": 10,
          "WaitTimeBetweenFaultsInSeconds": 1,
          "TimeToRunInSeconds": "3600",
          "EnableMoveReplicaFaults": true,
          "ClusterHealthPolicy": {
            "ConsiderWarningAsError": true,
            "MaxPercentUnhealthyNodes": 0,
            "MaxPercentUnhealthyApplications": 10,
            "ApplicationTypeHealthPolicyMap": [
              {
                "Key": "myapp",
                "Value": 3
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

