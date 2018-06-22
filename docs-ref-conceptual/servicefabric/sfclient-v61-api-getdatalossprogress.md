---
title: "Get Data Loss Progress"
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
# Get Data Loss Progress
Gets the progress of a partition data loss operation started using the StartDataLoss API.

Gets the progress of a data loss operation started with StartDataLoss, using the OperationId.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/GetDataLossProgress?api-version=6.0&OperationId={OperationId}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [serviceId](#serviceid) | string | Yes | Path |
| [partitionId](#partitionid) | string (uuid) | Yes | Path |
| [api-version](#api-version) | string | Yes | Query |
| [OperationId](#operationid) | string (uuid) | Yes | Query |
| [timeout](#timeout) | integer (int64) | No | Query |

____
### serviceId
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


____
### partitionId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
The identity of the partition.

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
### OperationId
__Type__: string (uuid) <br/>
__Required__: Yes<br/>
<br/>
A GUID that identifies a call of this API.  This is passed into the corresponding GetProgress API

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
| 200 (OK) | Information about the progress of the partition data loss operation.<br/> | [PartitionDataLossProgress](sfclient-v61-model-partitiondatalossprogress.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-v61-model-fabricerror.md) |

## Examples

### Gets information about a partition data loss operation.  In this case the operation has a State of Completed

This shows an example of possible output when GetDataLossProgress has reached a State of Completed.  If the State has a value of Running, only the State field will have a value.

#### Request
```
GET http://localhost:19080/Faults/Services/fabric:/myapp/myservice/$/GetPartitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetDataLossProgress?api-version=6.0&OperationId=7216486c-1ee9-4b00-99b2-92b26fcb07f5
```

#### 200 Response
##### Body
```json
{
  "State": "Completed",
  "InvokeDataLossResult": {
    "ErrorCode": "0",
    "SelectedPartition": {
      "ServiceName": "fabric:/myapp/myservice",
      "PartitionId": "1daae3f5-7fd6-42e9-b1ba-8c05f873994d"
    }
  }
}
```


### Get information about a partition data loss operation.  In this case the operation is a State of Running

This shows an example of output when a data loss operation is in a Running State.  If the State has a value of Running, only the State field will have a value.

#### Request
```
GET http://localhost:19080/Faults/Services/fabric:/myapp/myservice/$/GetPartitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetDataLossProgress?api-version=6.0&OperationId=7216486c-1ee9-4b00-99b2-92b26fcb07f5
```

#### 200 Response
##### Body
```json
{
  "State": "Running"
}
```

