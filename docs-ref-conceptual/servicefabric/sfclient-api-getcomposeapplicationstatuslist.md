---
title: "Get Compose Application Status List"
ms.date: "2017-05-04"
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
# Get Compose Application Status List
Gets the list of compose applications created in the Service Fabric cluster.

Gets the status about the compose applications that were created or in the process of being created in the Service Fabric cluster. The response includes the name, status and other details about the compose application. If the applications do not fit in a page, one page of results is returned as well as a continuation token which can be used to get the next page.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ComposeDeployments?api-version=4.0-preview&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [MaxResults](#maxresults) | integer (int64) | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 4.0-preview <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "4.0-preview".

____
### ContinuationToken
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### MaxResults
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 0 <br/>
__InclusiveMinimum__: 0 <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged queries includes as much results as possible that fit in the return message.

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
| 200 (OK) | List of status of compose applications ins the cluster.<br/> | [PagedComposeApplicationStatusInfoList](sfclient-model-pagedcomposeapplicationstatusinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |
