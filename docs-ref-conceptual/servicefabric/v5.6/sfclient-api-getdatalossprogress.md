---
title: "Get Data Loss Progress"
ms.date: "2017-05-09"
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
| GET | `/Faults/Services/{serviceId}/$/GetPartitions/{partitionId}/$/GetDataLossProgress?api-version=3.0&OperationId={OperationId}&timeout={timeout}` |


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
__Default__: 3.0 <br/>
<br/>
The version of the API. This is a required parameter and it's value must be "3.0".

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
| 200 (OK) | Information about the progress of the partition data loss operation.<br/> | [PartitionDataLossProgress](sfclient-model-partitiondatalossprogress.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Gets information about a partition data loss operation.  In this case the operation has a State of Completed

This shows an example of possible output when GetDataLossProgress has reached a State of Completed.  If the State has a value of Running, only the State field will have a value.

#### Request
```
GET http://localhost:19080/Faults/Services/fabric:/myapp/myservice/$/GetPartitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetDataLossProgress?api-version=3.0&OperationId=7216486c-1ee9-4b00-99b2-92b26fcb07f5
```

#### 200 Response
##### Body
```json
{
  "State": "Completed",
  "InvokeDataLossResult": {
    "ErrorCode": 0,
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
GET http://localhost:19080/Faults/Services/fabric:/myapp/myservice/$/GetPartitions/1daae3f5-7fd6-42e9-b1ba-8c05f873994d/$/GetDataLossProgress?api-version=3.0&OperationId=7216486c-1ee9-4b00-99b2-92b26fcb07f5
```

#### 200 Response
##### Body
```json
{
  "State": "Running"
}
```

