---
title: "Get Application Info List"
ms.date: "2018-01-22"
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

Gets the information about the applications that were created or in the process of being created in the Service Fabric cluster and match filters specified as the parameter. The response includes the name, type, status, parameters and other details about the application. If the applications do not fit in a page, one page of results is returned as well as a continuation token which can be used to get the next page. Filters ApplicationTypeName and ApplicationDefinitionKindFilter cannot be specified at the same time.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Applications?api-version=6.1&ApplicationDefinitionKindFilter={ApplicationDefinitionKindFilter}&ApplicationTypeName={ApplicationTypeName}&ExcludeApplicationParameters={ExcludeApplicationParameters}&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [api-version](#api-version) | string | Yes | Query |
| [ApplicationDefinitionKindFilter](#applicationdefinitionkindfilter) | integer | No | Query |
| [ApplicationTypeName](#applicationtypename) | string | No | Query |
| [ExcludeApplicationParameters](#excludeapplicationparameters) | boolean | No | Query |
| [ContinuationToken](#continuationtoken) | string | No | Query |
| [MaxResults](#maxresults) | integer (int64) | No | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### api-version
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: 6.1 <br/>
<br/>
The version of this API. This is a required parameter and its value must be "6.1".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### ApplicationDefinitionKindFilter
__Type__: integer <br/>
__Required__: No<br/>
__Default__: 0 <br/>
<br/>
Used to filter on ApplicationDefinitionKind which is the mechanism used to define a Service Fabric application.
- Default - Default value, which performs the same function as selecting "All". The value is 0.
- All - Filter that matches input with any ApplicationDefinitionKind value. The value is 65535.
- ServiceFabricApplicationDescription - Filter that matches input with ApplicationDefinitionKind value ServiceFabricApplicationDescription. The value is 1.
- Compose - Filter that matches input with ApplicationDefinitionKind value Compose. The value is 2.


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
| 200 (OK) | List of applications created in the cluster.<br/> | [PagedApplicationInfoList](sfclient-model-pagedapplicationinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Limit maximum results

This example shows how to get information about applications on the cluster. The number of results in a page are limited to maximum of two using the MaxResult parameter.

#### Request
```
GET http://localhost:19080/Applications?api-version=6.1&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "fabric:/samples/PQueueApp1",
  "Items": [
    {
      "Id": "samples~CalculatorApp",
      "Name": "fabric:/samples/CalculatorApp",
      "TypeName": "CalculatorApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Ok",
      "ApplicationDefinitionKind": "ServiceFabricApplicationDescription"
    },
    {
      "Id": "samples~PQueueApp1",
      "Name": "fabric:/samples/PQueueApp1",
      "TypeName": "PersistentQueueApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Ok",
      "ApplicationDefinitionKind": "ServiceFabricApplicationDescription"
    }
  ]
}
```


### Page using continuation token

This example shows how to page through the information about applications on the cluster using the ContinuationToken parameter. The value of this parameter is provided from the previous query, in this case the example shown above. The response contains the remaining one result and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/Applications?api-version=6.1&ContinuationToken=fabric:/samples/PQueueApp1&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Id": "samples~VQueueApp1",
      "Name": "fabric:/samples/VQueueApp1",
      "TypeName": "VolatileQueueApp",
      "TypeVersion": "1.0",
      "Status": "Ready",
      "Parameters": [],
      "HealthState": "Ok",
      "ApplicationDefinitionKind": "ServiceFabricApplicationDescription"
    }
  ]
}
```

