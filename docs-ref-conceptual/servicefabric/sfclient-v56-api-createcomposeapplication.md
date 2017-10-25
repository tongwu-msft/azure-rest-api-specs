---
title: "Create Compose Application"
ms.date: "2017-05-09"
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


# Create Compose Application


> [!IMPORTANT]
>
>  These API work with Service Fabric clusters running preview runtime version of 255.255.57--.255 and above.
>

Creates a Service Fabric compose application.

Creates a Service Fabric compose application.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/ComposeDeployments/$/Create?api-version=4.0-preview&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [CreateComposeApplicationDescription](#createcomposeapplicationdescription) | [CreateComposeApplicationDescription](sfclient-v56-model-createcomposeapplicationdescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 4.0-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "4.0-preview".

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
### CreateComposeApplicationDescription
__Type__: [CreateComposeApplicationDescription](sfclient-v56-model-createcomposeapplicationdescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the compose application that needs to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v56-model-fabricerror.md) |

