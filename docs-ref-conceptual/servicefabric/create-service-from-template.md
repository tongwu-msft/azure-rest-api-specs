---
title: "Create Service From Template"
ms.date: "2017-04-27"
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
# Create Service From Template
Creates a Service Fabric service from the service template defined in the application manifest.

Creates a Service Fabric service from the service template defined in the application manifest.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Applications/{applicationId}/$/GetServices/$/CreateFromTemplate?api-version=3.0` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [ServiceFromTemplateDescription](#servicefromtemplatedescription) | [ServiceFromTemplateDescription](model-ServiceFromTemplateDescription.md) | Yes | Body |

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ServiceFromTemplateDescription
__Type__: [ServiceFromTemplateDescription](model-ServiceFromTemplateDescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the service that needs to be created from the template defined in the application manifest.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 202 (Accepted) | A successful operation will return 202 status code.<br/> |  |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
