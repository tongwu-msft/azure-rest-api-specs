---
title: "Get Deployed Application Info"
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
# Get Deployed Application Info
Gets the information about an application deployed on a Service Fabric node.

Gets the information about an application deployed on a Service Fabric node.  This query returns system application information if the application ID provided is for system application. Results encompass deployed applications in active, activating, and downloading states. This query requires that the node name corresponds to a node on the cluster. The query fails if the provided node name does not point to any active Service Fabric nodes on the cluster.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetApplications/{applicationId}?api-version=6.1&timeout={timeout}&IncludeHealthState={IncludeHealthState}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`IncludeHealthState`](#includehealthstate) | boolean | No | Query |

____
### `nodeName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

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


## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and the information about the deployed application.<br/> | [DeployedApplicationInfo](sfclient-v62-model-deployedapplicationinfo.md) |
| 204 (NoContent) | An empty response is returned if the specified application is not deployed on the node.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get a specific deployed application by application ID and include the health state in the result

This example shows how to get information about an application deployed on a specified node by using an application identifier. If the application is found it's information is returned with 200 status code. An empty response with status code 204 is returned, if the specified application is not deployed on the node.

#### Request
```
GET http://localhost:19080/Nodes/_Node_0/$/GetApplications/samples~CalculatorApp?api-version=6.1&IncludeHealthState=true
```

#### 200 Response
##### Body
```json
{
  "Id": "samples~CalculatorApp",
  "Name": "fabric:/samples/CalculatorApp",
  "TypeName": "CalculatorApp",
  "Status": "Active",
  "WorkDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_1\\CalculatorApp_App0\\work",
  "LogDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_1\\CalculatorApp_App0\\log",
  "TempDirectory": "C:\\SfDevCluster\\Data\\_App\\_Node_1\\CalculatorApp_App0\\temp",
  "HealthState": "Ok"
}
```


#### 204 Response
##### Body
The response body is empty.