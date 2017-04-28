---
title: "Get Service Info List"
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
# Get Service Info List
Gets the information about all services belonging to the application specified by the application id.

Returns the information about all services belonging to the application specified by the application id.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Applications/{applicationId}/$/GetServices?ServiceTypeName={ServiceTypeName}&api-version=3.0&ContinuationToken={ContinuationToken}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [applicationId](#applicationid) | string | Yes | Path |
| [ServiceTypeName](#servicetypename) | string | No | Query |
| [api-version](#api-version) | string | Yes | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |

____
### applicationId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the application. This is typically the full name of the application without the 'fabric:' URI scheme.

____
### ServiceTypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The service type name used to filter the services to query for.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of services in the cluster for the specified application.<br/> | [PagedServiceInfoList](model-PagedServiceInfoList.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](model-FabricError.md) |
