---
title: "Get Sub Name Info List"
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
# Get Sub Name Info List
Enumerates all the Service Fabric names under a given name.

Enumerates all the Service Fabric names under a given name. If the subnames do not fit in a page, one page of results is returned as well as a continuation token which can be used to get the next page. Querying a name that doesn't exist will fail.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Names/{nameId}/$/GetSubNames?api-version=6.0&Recursive={Recursive}&ContinuationToken={ContinuationToken}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nameId](#nameid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [Recursive](#recursive) | boolean | No | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### nameId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Service Fabric name, without the 'fabric:' URI scheme.

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "6.0".

____
### Recursive
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: false <br/>
<br/>
Allows specifying that the search performed should be recursive.

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
| 200 (OK) | A paged list of Service Fabric names.<br/> | [PagedSubNameInfoList](sfclient-v60-model-pagedsubnameinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v60-model-fabricerror.md) |

## Examples

### Get sub names

This example shows how to get information about all sub names of a given Service Fabric name.

#### Request
```
GET http://localhost:19080/Names/samples/$/GetSubNames?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "IsConsistent": true,
  "SubNames": [
    "fabric:/samples/CalculatorApp",
    "fabric:/samples/mynames"
  ]
}
```


### Recursively search sub names

This example shows how to recursively get information about all child sub names of a given Service Fabric name.

#### Request
```
GET http://localhost:19080/Names/samples/$/GetSubNames?api-version=6.0&Recursive=True
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "IsConsistent": true,
  "SubNames": [
    "fabric:/samples/apps",
    "fabric:/samples/data",
    "fabric:/samples/CalculatorApp",
    "fabric:/samples/CalculatorApp/CalculatorService",
    "fabric:/samples/CalculatorApp/CalculatorService/Name-1",
    "fabric:/samples/CalculatorApp/CalculatorService/Name-2",
    "fabric:/samples/mynames/name-1"
  ]
}
```


### Page using continuation token

This example shows how to page through the information about sub names under a given Service Fabric name using ContinuationToken parameter. The value of this parameter is provided from the previous query, in this case the example shown above. The response contains the remaining two results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/Names/samples/$/GetSubNames?api-version=6.0&Recursive=True&ContinuationToken=fabric:/samples/apps/PersistentQueueApp$131439231986491349
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "IsConsistent": true,
  "SubNames": [
    "fabric:/samples/apps/VolatileQueueApp",
    "fabric:/samples/apps/NotepadApp"
  ]
}
```

