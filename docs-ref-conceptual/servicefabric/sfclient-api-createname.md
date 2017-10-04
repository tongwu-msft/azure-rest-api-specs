---
title: "Create Name"
ms.date: "2017-10-02"
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
# Create Name
Creates a Service Fabric name.

Creates the specified Service Fabric name.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Names/$/Create?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [NameDescription](#namedescription) | [NameDescription](sfclient-model-namedescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "6.0".

____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### NameDescription
__Type__: [NameDescription](sfclient-model-namedescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the Service Fabric name to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | A successful response means that the name has been created.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Create new name

This example shows how to create a new Service Fabric name. The name can be created under an existing name that represents an appliction or a service or under a completely new name.

#### Request
```
POST http://localhost:19080/Names/$/Create?api-version=6.0
```

##### Body
```json
{
  "Name": "fabric:/samples/CalculatorApp/CalculatorService/Name-1"
}
```

#### 201 Response
##### Body
The response body is empty.