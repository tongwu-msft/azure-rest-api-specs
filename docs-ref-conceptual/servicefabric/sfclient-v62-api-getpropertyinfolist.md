---
title: "Get Property Info List"
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
# Get Property Info List
Gets information on all Service Fabric properties under a given name.

A Service Fabric name can have one or more named properties that stores custom information. This operation gets the information about these properties in a paged list. The information include name, value and metadata about each of the properties.

## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Names/{nameId}/$/GetProperties?api-version=6.0&IncludeValues={IncludeValues}&ContinuationToken={ContinuationToken}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`nameId`](#nameid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`IncludeValues`](#includevalues) | boolean | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `nameId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The Service Fabric name, without the 'fabric:' URI scheme.

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
### `IncludeValues`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Allows specifying whether to include the values of the properties returned. True if values should be returned with the metadata; False to return only property metadata.

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

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
| 200 (OK) | A paged list of Service Fabric properties.<br/> | [PagedPropertyInfoList](sfclient-v62-model-pagedpropertyinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v62-model-fabricerror.md) |

## Examples

### Get property info list

This example shows how to get all Service Fabric properties under a given name.

#### Request
```
GET http://localhost:19080/Names/samples/apps/$/GetProperties?api-version=6.0
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "PersistentQueueAppData$131439231986491349",
  "IsConsistent": true,
  "Properties": [
    {
      "Name": "CalculatorAppData",
      "Metadata": {
        "TypeId": "Int64",
        "CustomTypeId": "",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "5",
        "LastModifiedUtcTimestamp": "2017-07-17T04:27:19.049Z",
        "SequenceNumber": "10"
      }
    },
    {
      "Name": "PersistentQueueAppData",
      "Metadata": {
        "TypeId": "Binary",
        "CustomTypeId": "InitializationDataType",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "5",
        "LastModifiedUtcTimestamp": "2017-07-17T04:36:19.049Z",
        "SequenceNumber": "12"
      }
    }
  ]
}
```


### Get property info list with values

This example shows how to get all Service Fabric properties and their values under a given name.

#### Request
```
GET http://localhost:19080/Names/samples/apps/$/GetProperties?api-version=6.0&IncludeValues=True
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "PersistentQueueAppData$131439231986491349",
  "IsConsistent": true,
  "Properties": [
    {
      "Name": "CalculatorAppData",
      "Value": {
        "Kind": "Int64",
        "Data": "4534"
      },
      "Metadata": {
        "TypeId": "Int64",
        "CustomTypeId": "",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "8",
        "LastModifiedUtcTimestamp": "2017-07-17T04:27:19.049Z",
        "SequenceNumber": "10"
      }
    },
    {
      "Name": "PersistentQueueAppData",
      "Value": {
        "Kind": "Binary",
        "Data": [
          "6",
          "7",
          "8",
          "9",
          "10"
        ]
      },
      "Metadata": {
        "TypeId": "Binary",
        "CustomTypeId": "InitializationDataType",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "5",
        "LastModifiedUtcTimestamp": "2017-07-17T04:36:19.049Z",
        "SequenceNumber": "12"
      }
    }
  ]
}
```


### Page using continuation token

This example shows how to page through the information about properties under a given Service Fabric name using ContinuationToken parameter. The value of this parameter is provided from the previous query, in this case the example shown above. The response contains the remaining two results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/Names/samples/apps/$/GetProperties?api-version=6.0&IncludeValues=True&ContinuationToken=PersistentQueueAppData$131439231986491349
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "IsConsistent": true,
  "Properties": [
    {
      "Name": "VolatileQueueAppData",
      "Value": {
        "Kind": "Double",
        "Data": "67.89"
      },
      "Metadata": {
        "TypeId": "Double",
        "CustomTypeId": "",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "8",
        "LastModifiedUtcTimestamp": "2017-07-17T04:01:19.049Z",
        "SequenceNumber": "8"
      }
    }
  ]
}
```

