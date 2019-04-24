---
title: "Get Application Type Info List"
ms.date: "2018-04-23"
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
# Get Application Type Info List
Gets the list of application types in the Service Fabric cluster.

Returns the information about the application types that are provisioned or in the process of being provisioned in the Service Fabric cluster. Each version of an application type is returned as one application type. The response includes the name, version, status and other details about the application type. This is a paged query, meaning that if not all of the application types fit in a page, one page of results is returned as well as a continuation token which can be used to get the next page. For example, if there are 10 application types but a page only fits the first 3 application types, or if max results is set to 3, then 3 is returned. To access the rest of the results, retrieve subsequent pages by using the returned continuation token in the next query. An empty continuation token is returned if there are no subsequent pages.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/ApplicationTypes?api-version=6.0&ApplicationTypeDefinitionKindFilter={ApplicationTypeDefinitionKindFilter}&ExcludeApplicationParameters={ExcludeApplicationParameters}&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ApplicationTypeDefinitionKindFilter`](#applicationtypedefinitionkindfilter) | integer | No | Query |
| [`ExcludeApplicationParameters`](#excludeapplicationparameters) | boolean | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.0` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.0'.

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### `ApplicationTypeDefinitionKindFilter`
__Type__: integer <br/>
__Required__: No<br/>
__Default__: `0` <br/>
<br/>
Used to filter on ApplicationTypeDefinitionKind which is the mechanism used to define a Service Fabric application type.
- Default - Default value, which performs the same function as selecting "All". The value is 0.
- All - Filter that matches input with any ApplicationTypeDefinitionKind value. The value is 65535.
- ServiceFabricApplicationPackage - Filter that matches input with ApplicationTypeDefinitionKind value ServiceFabricApplicationPackage. The value is 1.
- Compose - Filter that matches input with ApplicationTypeDefinitionKind value Compose. The value is 2.


____
### `ExcludeApplicationParameters`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
The flag that specifies whether application parameters will be excluded from the result.

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged queries includes as many results as possible that fit in the return message.

____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | List of application types in the cluster.<br/> | [PagedApplicationTypeInfoList](sfclient-v62-model-pagedapplicationtypeinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Limit maximum results

This example shows how to get information about application types that are provisioned or being provisioned in the cluster. The number of results in a page are limited to maximum of five using MaxResult parameter.

#### Request
```
GET http://localhost:19080/ApplicationTypes?api-version=6.0&MaxResults=5
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "PersistentQueueApp+2.0",
  "Items": [
    {
      "Name": "CalculatorApp",
      "Version": "1.0",
      "DefaultParameterList": [
        {
          "Key": "ServiceInstanceCount",
          "Value": "3"
        }
      ],
      "Status": "Available"
    },
    {
      "Name": "CalculatorApp",
      "Version": "2.0",
      "DefaultParameterList": [
        {
          "Key": "ServiceInstanceCount",
          "Value": "3"
        }
      ],
      "Status": "Available"
    },
    {
      "Name": "GatewayApp",
      "Version": "1.0",
      "DefaultParameterList": [
        {
          "Key": "GatewayPort",
          "Value": "8505"
        },
        {
          "Key": "ServiceInstanceCount",
          "Value": "1000"
        }
      ],
      "Status": "Available"
    },
    {
      "Name": "PersistentQueueApp",
      "Version": "1.0",
      "DefaultParameterList": [
        {
          "Key": "MinReplicaSetSize",
          "Value": "2"
        },
        {
          "Key": "TargetReplicaSetSize",
          "Value": "3"
        }
      ],
      "Status": "Available"
    },
    {
      "Name": "PersistentQueueApp",
      "Version": "2.0",
      "DefaultParameterList": [
        {
          "Key": "MinReplicaSetSize",
          "Value": "2"
        },
        {
          "Key": "TargetReplicaSetSize",
          "Value": "3"
        }
      ],
      "Status": "Available"
    }
  ]
}
```


### Page using continuation token

This example shows how to page through the information about application types that are provisioned or being provisioned in the cluster using ContinuationToken parameter. The value of this parameter is provided from the previous query, in this case the example shown above. The response contains the remaining two results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/ApplicationTypes?api-version=6.0&ContinuationToken=PersistentQueueApp+2.0&MaxResults=5
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Name": "VolatileQueueApp",
      "Version": "1.0",
      "DefaultParameterList": [
        {
          "Key": "MinReplicaSetSize",
          "Value": "2"
        },
        {
          "Key": "TargetReplicaSetSize",
          "Value": "3"
        }
      ],
      "Status": "Available"
    },
    {
      "Name": "VolatileQueueApp",
      "Version": "2.0",
      "DefaultParameterList": [
        {
          "Key": "MinReplicaSetSize",
          "Value": "2"
        },
        {
          "Key": "TargetReplicaSetSize",
          "Value": "3"
        }
      ],
      "Status": "Available"
    }
  ]
}
```


### Exclude application parameters from the result

This example shows how to exclude application parameter in the result when getting the information about application types that are provisioned or being provisioned in the cluster.

#### Request
```
GET http://localhost:19080/ApplicationTypes?api-version=6.0&ExcludeApplicationParameters=true
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "Name": "CalculatorApp",
      "Version": "1.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "CalculatorApp",
      "Version": "2.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "GatewayApp",
      "Version": "1.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "PersistentQueueApp",
      "Version": "1.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "PersistentQueueApp",
      "Version": "2.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "VolatileQueueApp",
      "Version": "1.0",
      "DefaultParameterList": [],
      "Status": "Available"
    },
    {
      "Name": "VolatileQueueApp",
      "Version": "2.0",
      "DefaultParameterList": [],
      "Status": "Available"
    }
  ]
}
```

