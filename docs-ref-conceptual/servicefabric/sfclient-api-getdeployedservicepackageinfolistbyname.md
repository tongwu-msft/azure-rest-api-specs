---
title: "Get Deployed Service Package Info List By Name"
ms.date: "2017-05-08"
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
# Get Deployed Service Package Info List By Name
Gets the list of service packages deployed on a Service Fabric node matching exactly the specified name.

Returns the information about the service packages deployed on a Service Fabric node for the given application. These results are of service packages whose name match exactly the service package name specified as the parameter.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Nodes/{nodeName}/$/GetApplications/{applicationId}/$/GetServicePackages/{servicePackageName}?api-version=3.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nodeName](#nodename) | string | Yes | Path |
| [applicationId](#applicationid) | string | Yes | Path |
| [servicePackageName](#servicepackagename) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nodeName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the node.

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

____
### servicePackageName
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the service package.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

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
| 200 (OK) | A successful operation will return 200 status code and the list of deployed service packages information.<br/> |  |
| 204 (NoContent) | An empty response is returned if the specified service package from the application is not deployed on the node.<br/> | array of [DeployedServicePackageInfo](sfclient-model-deployedservicepackageinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
