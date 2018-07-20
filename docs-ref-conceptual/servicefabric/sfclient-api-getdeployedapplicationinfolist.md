---
title: "Get Deployed Application Info List"
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
# Get Deployed Application Info List
Gets the list of applications deployed on a Service Fabric node.

Gets the list of applications deployed on a Service Fabric node. The results do not include information about deployed system applications unless explicitly queried for by ID. Results encompass deployed applications in active, activating, and downloading states. This query requires that the node name corresponds to a node on the cluster. The query fails if the provided node name does not point to any active Service Fabric nodes on the cluster.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetApplications?api-version=6.1&timeout={timeout}&IncludeHealthState={IncludeHealthState}&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`IncludeHealthState`](#includehealthstate) | boolean | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |

____
### `nodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.1` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.1'.

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
### `IncludeHealthState`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Include the health state of an entity.
If this parameter is false or not specified, then the health state returned is "Unknown".
When set to true, the query goes in parallel to the node and the health system service before the results are merged.
As a result, the query is more expensive and may take a longer time.


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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the list of deployed application information.<br/> | [PagedDeployedApplicationInfoList](sfclient-model-pageddeployedapplicationinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Limit maximum results

This example shows how to specify the number of applications returned by the query when getting information about applications deployed on a specific node. The number of results in a page are limited to maximum of 2 using the MaxResult parameter. Health state is not requested in this example, so the returned health state will be Unknown.

#### Request
```
GET http://localhost:19080/Nodes/_Node_0/$/GetApplications?api-version=6.1&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "fabric:/samples/PQueueApp1",
  "Items": [
    {
      "Id": "samples~CalculatorApp",
      "Name": "fabric:/samples/CalculatorApp",
      "TypeName": "CalculatorApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\temp",
      "HealthState": "Unknown"
    },
    {
      "Id": "samples~PQueueApp1",
      "Name": "fabric:/samples/PQueueApp1",
      "TypeName": "PersistentQueueApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\temp",
      "HealthState": "Unknown"
    }
  ]
}
```


### Page using continuation token

This example demonstrates the paging functionality available when getting information about applications deployed on a specific node. This example uses the ContinuationToken parameter. The value of this parameter is provided from the previous query; in this case the example shown above. The response contains the remaining results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/Nodes/_Node_0/$/GetApplications?api-version=6.1&ContinuationToken=fabric:/samples/PQueueApp1
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Id": "samples~VQueueApp1",
      "Name": "fabric:/samples/VQueueApp1",
      "TypeName": "VolatileQueueApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\temp",
      "HealthState": "Unknown"
    }
  ]
}
```


### Include health state in the result

This example shows how to include the health state of each deployed application when getting information about applications deployed on a specific node.

#### Request
```
GET http://localhost:19080/Nodes/_Node_0/$/GetApplications?api-version=6.1&IncludeHealthState=true
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Id": "samples~CalculatorApp",
      "Name": "fabric:/samples/CalculatorApp",
      "TypeName": "CalculatorApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\CalculatorApp_App0\\temp",
      "HealthState": "Ok"
    },
    {
      "Id": "samples~PQueueApp1",
      "Name": "fabric:/samples/PQueueApp1",
      "TypeName": "PersistentQueueApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\PersistentQueueApp_App1\\temp",
      "HealthState": "Ok"
    },
    {
      "Id": "samples~VQueueApp1",
      "Name": "fabric:/samples/VQueueApp1",
      "TypeName": "VolatileQueueApp",
      "Status": "Active",
      "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\work",
      "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\log",
      "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_0\\VolatileQueueApp_App2\\temp",
      "HealthState": "Ok"
    }
  ]
}
```

