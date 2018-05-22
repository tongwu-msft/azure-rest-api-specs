---
title: "Submit Property Batch"
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
# Submit Property Batch
Submits a property batch.

Submits a batch of property operations. Either all or none of the operations will be committed.

## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/Names/{nameId}/$/GetProperties/$/SubmitBatch?api-version=6.0&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [nameId](#nameid) | string | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |
| [PropertyBatchDescriptionList](#propertybatchdescriptionlist) | [PropertyBatchDescriptionList](sfclient-v61-model-propertybatchdescriptionlist.md) | Yes | Body |

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
The version of this API. This is a required parameter and its value must be "6.0".

Service Fabric REST API version is based on the runtime version in which the API was introduced or was changed. Service Fabric runtime supports more than one version of the API. This is the latest supported version of the API. If a lower API version is passed, the returned response may be different from the one documented in this specification.

Additionally the runtime accept any version that is higher than the latest supported version up to the current version of the runtime. So if the latest API version is 6.0, but if the runtime is 6.1, in order to make it easier to write the clients, the runtime will accept version 6.1 for that API. However the behavior of the API will be as per the documented 6.0 version.


____
### timeout
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: 60 <br/>
__InclusiveMaximum__: 4294967295 <br/>
__InclusiveMinimum__: 1 <br/>
<br/>
The server timeout for performing the operation in seconds. This specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### PropertyBatchDescriptionList
__Type__: [PropertyBatchDescriptionList](sfclient-v61-model-propertybatchdescriptionlist.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the property batch operations to be submitted.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful response means that the property batch succeeded.<br/> | [SuccessfulPropertyBatchInfo](sfclient-v61-model-successfulpropertybatchinfo.md) |
| 409 (Conflict) | A 409 response means that one of the property batch operations failed, and contains more information about the failure. None of the operations were commited.<br/> | [FailedPropertyBatchInfo](sfclient-v61-model-failedpropertybatchinfo.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |

## Examples

### Successful property batch

This example shows how to submit a property batch. This batch ensures that a property exists, checks that the property has the expected sequence number, and edits the property only if the previous conditions succeed. It then performs a get operation to get the property's current info. All the operations succeed, so the batch is committed in a transactional manner.

#### Request
```
POST http://localhost:19080/Names/samples/apps/$/GetProperties/$/SubmitBatch?api-version=6.0
```

##### Body
```json
{
  "Operations": [
    {
      "Kind": "CheckExists",
      "PropertyName": "PersistentQueueAppData",
      "Exits": true
    },
    {
      "Kind": "CheckSequence",
      "PropertyName": "PersistentQueueAppData",
      "SequenceNumber": "12"
    },
    {
      "Kind": "Put",
      "PropertyName": "PersistentQueueAppData",
      "Value": {
        "Kind": "Binary",
        "Data": [
          "1",
          "2",
          "3",
          "4",
          "5"
        ]
      },
      "CustomTypeId": "InitializationData"
    },
    {
      "Kind": "Get",
      "PropertyName": "PersistentQueueAppData",
      "IncludeValue": false
    }
  ]
}
```

#### 200 Response
##### Body
```json
{
  "Kind": "Successful",
  "Properties": {
    "3": {
      "Name": "PersistentQueueAppData",
      "Metadata": {
        "TypeId": "Binary",
        "CustomTypeId": "InitializationData",
        "Parent": "fabric:/samples/apps",
        "SizeInBytes": "5",
        "LastModifiedUtcTimestamp": "2017-07-17T05:01:19.049Z",
        "SequenceNumber": "13"
      }
    }
  }
}
```


### Failed property batch

This example shows how to submit a property batch. This batch ensures that a property exists, checks that the property has the expected value, and deletes the property only if the previous conditions succeed. The batch fails because the property does not have the expected value, so the batch is not committed in a transactional manner.

#### Request
```
POST http://localhost:19080/Names/samples/apps/$/GetProperties/$/SubmitBatch?api-version=6.0
```

##### Body
```json
{
  "Operations": [
    {
      "Kind": "CheckExists",
      "PropertyName": "PersistentQueueAppData",
      "Exits": true
    },
    {
      "Kind": "CheckValue",
      "PropertyName": "PersistentQueueAppData",
      "Value": {
        "Kind": "Binary",
        "Data": [
          "10",
          "11",
          "12",
          "13",
          "14",
          "15"
        ]
      }
    },
    {
      "Kind": "Delete",
      "PropertyName": "PersistentQueueAppData"
    }
  ]
}
```

#### 200 Response
##### Body
```json
{
  "Kind": "Failed",
  "ErrorMessage": "FABRIC_E_PROPERTY_CHECK_FAILED",
  "OperationIndex": "1"
}
```

