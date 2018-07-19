---
title: "Put Property"
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
# Put Property
Creates or updates a Service Fabric property.

Creates or updates the specified Service Fabric property under a given name.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/Names/{nameId}/$/GetProperty?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nameId`](#nameid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`PropertyDescription`](#propertydescription) | [PropertyDescription](sfclient-v62-model-propertydescription.md) | Yes | Body |

____
### `nameId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Service Fabric name, without the 'fabric:' URI scheme.

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
### `PropertyDescription`
__Type__: [PropertyDescription](sfclient-v62-model-propertydescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the Service Fabric property to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the property has been created or updated.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Put property

This example shows how to create or update a Service Fabric property under a given name.

#### Request
```
PUT http://localhost:19080/Names/samples/apps/CalculatorApp/$/GetProperty?api-version=6.0
```

##### Body
```json
{
  "PropertyName": "AppData",
  "Value": {
    "Kind": "Binary",
    "Data": [
      "0",
      "1",
      "2",
      "3",
      "4",
      "5"
    ]
  }
}
```

#### 200 Response
##### Body
The response body is empty.
### Put custom property

This example shows how to create or update a Service Fabric property under a given name with a custom type.

#### Request
```
PUT http://localhost:19080/Names/samples/apps/CalculatorApp/$/GetProperty?api-version=6.0
```

##### Body
```json
{
  "PropertyName": "AppData",
  "Value": {
    "Kind": "String",
    "Data": "1+2=3"
  },
  "CustomTypeId": "EquationType"
}
```

#### 200 Response
##### Body
The response body is empty.