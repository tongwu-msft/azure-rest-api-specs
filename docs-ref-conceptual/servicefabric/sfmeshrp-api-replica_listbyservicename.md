---
title: "List By Service Name"
description: Service Fabric Mesh Resource Manager API Reference
services: service-fabric-mesh
author: VipulM-MSFT
ms.date: "2018-07-17"
ms.prod: "azure"
ms.service: "service-fabric-mesh"
ms.topic: reference
ms.devlang: rest-api
ms.author: vipulm
ms.manager: rajak
---
# List By Service Name
Gets replicas of a given service.

Gets the information about all replicas of a given service of an application. The information includes the runtime properties of the replica instance.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ServiceFabricMesh/applications/{applicationName}/services/{serviceName}/replicas?api-version=2018-07-01-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`subscriptionId`](#subscriptionid) | string | Yes | Path |
| [`resourceGroupName`](#resourcegroupname) | string | Yes | Path |
| [`applicationName`](#applicationname) | string | Yes | Path |
| [`serviceName`](#servicename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |

____
### `subscriptionId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The customer subscription identifier

____
### `resourceGroupName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
Azure resource group name

____
### `applicationName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application.

____
### `serviceName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `2018-07-01-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be `2018-07-01-preview`.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | OK<br/> | [ServiceReplicaList](sfmeshrp-model-servicereplicalist.md) |


## Examples

### ReplicasGetAll

#### Request
```
GET https://management.azure.com/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/applications/helloWorldApp/services/helloWorldService/replicas?api-version=2018-07-01-preview
```

#### 200 Response
##### Body
```json
{
  "value": [
    {
      "osType": "Linux",
      "codePackages": [
        {
          "name": "helloWorldCode",
          "image": "seabreeze/sbz-helloworld:1.0-alpine",
          "endpoints": [
            {
              "name": "helloWorldListener",
              "port": "80"
            }
          ],
          "resources": {
            "requests": {
              "memoryInGB": "1",
              "cpu": "1"
            }
          },
          "instanceView": {
            "restartCount": "1",
            "currentState": {
              "state": "Running",
              "exitCode": "0"
            },
            "previousState": {
              "state": "NotSpecified",
              "exitCode": "0"
            },
            "events": [
              {
                "count": "3",
                "firstTimestamp": "2018-04-05T22:37:20.9016844",
                "lastTimestamp": "2018-04-06T06:36:06.0887046",
                "name": "Created",
                "message": "Container created and started.",
                "type": "Normal"
              },
              {
                "count": "1",
                "firstTimestamp": "2018-04-06T06:34:00.6622454",
                "lastTimestamp": "2018-04-06T06:34:00.6622454",
                "name": "Stopped",
                "message": "Container was stopped.",
                "type": "Normal"
              }
            ]
          }
        },
        {
          "name": "helloWorldSideCar",
          "image": "seabreeze/sbz-helloworld-sidecar:1.0-alpine",
          "resources": {
            "requests": {
              "memoryInGB": "1",
              "cpu": "1"
            }
          },
          "instanceView": {
            "restartCount": "1",
            "currentState": {
              "state": "Running",
              "exitCode": "0"
            },
            "previousState": {
              "state": "NotSpecified",
              "exitCode": "0"
            },
            "events": [
              {
                "count": "3",
                "firstTimestamp": "2018-04-05T22:37:20.906688",
                "lastTimestamp": "2018-04-06T06:36:06.0827003",
                "name": "Created",
                "message": "Container created and started.",
                "type": "Normal"
              },
              {
                "count": "1",
                "firstTimestamp": "2018-04-06T06:34:00.656241",
                "lastTimestamp": "2018-04-06T06:34:00.656241",
                "name": "Stopped",
                "message": "Container was stopped.",
                "type": "Normal"
              }
            ]
          }
        }
      ],
      "networkRefs": [
        {
          "name": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetwork"
        }
      ],
      "replicaName": "1"
    },
    {
      "osType": "Linux",
      "codePackages": [
        {
          "name": "helloWorldCode",
          "image": "seabreeze/sbz-helloworld:1.0-alpine",
          "endpoints": [
            {
              "name": "helloWorldListener",
              "port": "80"
            }
          ],
          "resources": {
            "requests": {
              "memoryInGB": "1",
              "cpu": "1"
            }
          },
          "instanceView": {
            "restartCount": "1",
            "currentState": {
              "state": "Running",
              "exitCode": "0"
            },
            "previousState": {
              "state": "NotSpecified",
              "exitCode": "0"
            },
            "events": [
              {
                "count": "3",
                "firstTimestamp": "2018-04-05T22:37:20.9016844",
                "lastTimestamp": "2018-04-06T06:36:06.0887046",
                "name": "Created",
                "message": "Container created and started.",
                "type": "Normal"
              },
              {
                "count": "1",
                "firstTimestamp": "2018-04-06T06:34:00.6622454",
                "lastTimestamp": "2018-04-06T06:34:00.6622454",
                "name": "Stopped",
                "message": "Container was stopped.",
                "type": "Normal"
              }
            ]
          }
        },
        {
          "name": "helloWorldSideCar",
          "image": "seabreeze/sbz-helloworld-sidecar:1.0-alpine",
          "resources": {
            "requests": {
              "memoryInGB": "1",
              "cpu": "1"
            }
          },
          "instanceView": {
            "restartCount": "1",
            "currentState": {
              "state": "Running",
              "exitCode": "0"
            },
            "previousState": {
              "state": "NotSpecified",
              "exitCode": "0"
            },
            "events": [
              {
                "count": "3",
                "firstTimestamp": "2018-04-05T22:37:20.906688",
                "lastTimestamp": "2018-04-06T06:36:06.0827003",
                "name": "Created",
                "message": "Container created and started.",
                "type": "Normal"
              },
              {
                "count": "1",
                "firstTimestamp": "2018-04-06T06:34:00.656241",
                "lastTimestamp": "2018-04-06T06:34:00.656241",
                "name": "Stopped",
                "message": "Container was stopped.",
                "type": "Normal"
              }
            ]
          }
        }
      ],
      "networkRefs": [
        {
          "name": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/sbz_demo/providers/Microsoft.ServiceFabricMesh/networks/helloWorldNetwork"
        }
      ],
      "replicaName": "0"
    }
  ]
}
```

