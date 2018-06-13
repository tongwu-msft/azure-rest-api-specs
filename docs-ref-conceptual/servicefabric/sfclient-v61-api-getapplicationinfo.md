---
title: "Get Application Info"
ms.date: "2018-01-22"
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
# Get Application Info
Gets information about a Service Fabric application.

Returns the information about the application that was created or in the process of being created in the Service Fabric cluster and whose name matches the one specified as the parameter. The response includes the name, type, status, parameters and other details about the application.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Applications/{applicationId}?api-version=6.0&ExcludeApplicationParameters={ExcludeApplicationParameters}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ExcludeApplicationParameters](#excludeapplicationparameters) | boolean | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the application name is "fabric:/myapp/app1", the application identity would be "myapp~app1" in 6.0+ and "myapp/app1" in previous versions.


____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of this API. This is a required parameter and its value must be "6.0".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### ExcludeApplicationParameters
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
The flag that specifies whether application parameters will be excluded from the result.

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | Information about the application.<br/> | [ApplicationInfo](sfclient-v61-model-applicationinfo.md) |
| 204 (NoContent) | An empty response is returned if the specified applicationId is not found in the cluster.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |

## Examples

### Get a specific application by application id

This example shows how to get information about an application by application ID.

#### Request
```
GET http://localhost:19080/Applications/samples~CalculatorApp?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "Id": "samples~CalculatorApp",
  "Name": "fabric:/samples/CalculatorApp",
  "TypeName": "CalculatorApp",
  "TypeVersion": "1.0",
  "Status": "Ready",
  "Parameters": [],
  "HealthState": "Ok",
  "ApplicationDefinitionKind": "ServiceFabricApplicationDescription"
}
```

