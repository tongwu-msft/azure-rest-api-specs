---
title: "Invoke Container Api"
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
# Invoke Container Api
Invoke container API on a container deployed on a Service Fabric node.

Invoke container API on a container deployed on a Service Fabric node for the given code package.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Nodes/{nodeName}/$/GetApplications/{applicationId}/$/GetCodePackages/$/ContainerApi?api-version=6.2&ServiceManifestName={ServiceManifestName}&CodePackageName={CodePackageName}&CodePackageInstanceId={CodePackageInstanceId}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nodeName`](#nodename) | string | Yes | Path |
| [`applicationId`](#applicationid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ServiceManifestName`](#servicemanifestname) | string | Yes | Query |
| [`CodePackageName`](#codepackagename) | string | Yes | Query |
| [`CodePackageInstanceId`](#codepackageinstanceid) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ContainerApiRequestBody`](#containerapirequestbody) | [ContainerApiRequestBody](sfclient-v62-model-containerapirequestbody.md) | Yes | Body |

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
__Default__: `6.2` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This version is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accepts any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0 and the runtime is 6.1, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ServiceManifestName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of a service manifest registered as part of an application type in a Service Fabric cluster.

____
### `CodePackageName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of code package specified in service manifest registered as part of an application type in a Service Fabric cluster.

____
### `CodePackageInstanceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
ID that uniquely identifies a code package instance deployed on a service fabric node.

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
### `ContainerApiRequestBody`
__Type__: [ContainerApiRequestBody](sfclient-v62-model-containerapirequestbody.md) <br/>
__Required__: Yes<br/>
<br/>
Parameters for making container API call

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and container API response for a container deployed on a Service Fabric node for the given code package.<br/> | [ContainerApiResponse](sfclient-v62-model-containerapiresponse.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get container logs

This example shows how to call container API with HTTP GET for a code package deployed on a node.

#### Request
```
POST http://localhost:19080/Nodes/Node01/$/GetApplications/samples/winnodejs/$/GetCodePackages/$/ContainerApi?api-version=6.2&ServiceManifestName=NodeServicePackage&CodePackageName=NodeService.Code&CodePackageInstanceId=131668159770315380
```

##### Body
```json
{
  "UriPath": "/containers/{id}/logs?stdout=true&stderr=true"
}
```

#### 200 Response
##### Body
```json
{
  "ContainerApiResult": {
    "Status": "200",
    "Content-Type": "text/plain; charset=utf-8",
    "Body": "vEthernet (Container NIC ec5c19b2) 172.17.201.44\n"
  }
}
```


### Update container

This example shows how to call container API with HTTP POST for a code package deployed on a node.

#### Request
```
POST http://localhost:19080/Nodes/N0020/$/GetApplications/samples/nodejs1/$/GetCodePackages/$/ContainerApi?api-version=6.2&ServiceManifestName=NodeOnSF&CodePackageName=Code&CodePackageInstanceId=131673596679688285
```

##### Body
```json
{
  "HttpVerb": "POST",
  "UriPath": "/containers/{id}/update",
  "Body": "{ \"CpuShares\": 512}"
}
```

#### 200 Response
##### Body
```json
{
  "ContainerApiResult": {
    "Status": "200",
    "Content-Type": "application/json",
    "Body": "{\"Warnings\":null}\n"
  }
}
```

