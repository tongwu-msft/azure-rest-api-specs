---
title: "Create Compose Application"
ms.date: "2017-04-26"
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
Creates a Service Fabric compose application.

Creates a Service Fabric compose application.

## Request
| Method | Request URI |
| ------ | ----------- |
| PUT | `/ComposeDeployments/$/Create?api-version=4.0-preview` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [CreateComposeApplicationDescription](#createcomposeapplicationdescription) | [CreateComposeApplicationDescription](model-CreateComposeApplicationDescription.md) | Yes | Body |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 4.0-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "4.0-preview".

____
### CreateComposeApplicationDescription
__Type__: [CreateComposeApplicationDescription](model-CreateComposeApplicationDescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the compose application that needs to be created.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
