---
title: "Create Application"
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
# Create Application
Creates a Service Fabric application.

Creates a Service Fabric application using the specified description.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/$/Create?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationDescription](#applicationdescription) | [ApplicationDescription](sfclient-model-applicationdescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ApplicationDescription
__Type__: [ApplicationDescription](sfclient-model-applicationdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the application to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 201 (Created) | A successful response means that the application creation has been started. Use GetApplication operation to get the status of the application. Once GetApplicationInfo successfully returns application information, the application is created. If the application has default services those may be in the process of being created. Use GetServiceInfo operation to get the status of the service within the application.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Create application.

This example shows how to create a Service Fabric application without overriding any application parameter values.

#### Request
```
POST http://localhost:19080/Applications/$/Create?api-version=3.0
```

##### Body
```json
{
  "Name": "fabric:/samples/CalcApp",
  "TypeVersion": "1.0",
  "TypeName": "CalculatorApp"
}
```

#### 201 Response
##### Body
The response body is empty.