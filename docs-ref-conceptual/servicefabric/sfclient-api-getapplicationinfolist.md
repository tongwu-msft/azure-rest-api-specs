---
title: "Get Application Info List"
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
# Get Application Info List
Gets the list of applications created in the Service Fabric cluster that match filters specified as the parameter.

Gets the information about the applications that were created or in the process of being created in the Service Fabric cluster and match filters specified as the parameter. The response includes the name, type, status, parameters and other details about the application. If the applications do not fit in a page, one page of results is returned as well as a continuation token which can be used to get the next page.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Applications?api-version=3.0&ApplicationTypeName={ApplicationTypeName}&ExcludeApplicationParameters={ExcludeApplicationParameters}&ContinuationToken={ContinuationToken}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationTypeName](#applicationtypename) | string | No | Query |
| [ExcludeApplicationParameters](#excludeapplicationparameters) | boolean | No | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

____
### ApplicationTypeName
__Type__: string <br/>
__Required__: No<br/>
<br/>
The application type name used to filter the applications to query for. This value should not contain the application type version.

____
### ExcludeApplicationParameters
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
The flag that specifies whether application parameters will be excluded from the result.

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

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
| 200 (OK) | List of applications created in the cluster.<br/> | [PagedApplicationInfoList](sfclient-model-pagedapplicationinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
