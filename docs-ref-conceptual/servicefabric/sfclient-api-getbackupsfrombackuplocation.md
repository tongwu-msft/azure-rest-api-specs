---
title: "Get Backups From Backup Location"
ms.date: "2018-07-20"
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
# Get Backups From Backup Location
Gets the list of backups available for the specified backed up entity at the specified backup location.

Gets the list of backups available for the specified backed up entity (Application, Service or Partition) at the specified backup location (FileShare or Azure Blob Storage).


## Request
| Method | Request URI |
| ------ | ----------- |
| POST | `/BackupRestore/$/GetBackups?api-version=6.2-preview&timeout={timeout}&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`GetBackupByStorageQueryDescription`](#getbackupbystoragequerydescription) | [GetBackupByStorageQueryDescription](sfclient-model-getbackupbystoragequerydescription.md) | Yes | Body |

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2-preview'.


____
### `timeout`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `60` <br/>
__InclusiveMaximum__: `4294967295` <br/>
__InclusiveMinimum__: `1` <br/>
<br/>
The server timeout for performing the operation in seconds. This timeout specifies the time duration that the client is willing to wait for the requested operation to complete. The default value for this parameter is 60 seconds.

____
### `ContinuationToken`
__Type__: string <br/>
__Required__: No<br/>
<br/>
The continuation token parameter is used to obtain next set of results. A continuation token with a non-empty value is included in the response of the API when the results from the system do not fit in a single response. When this value is passed to the next API call, the API returns next set of results. If there are no further results, then the continuation token does not contain a value. The value of this parameter should not be URL encoded.

____
### `MaxResults`
__Type__: integer (int64) <br/>
__Required__: No<br/>
__Default__: `0` <br/>
__InclusiveMinimum__: `0` <br/>
<br/>
The maximum number of results to be returned as part of the paged queries. This parameter defines the upper bound on the number of results returned. The results returned can be less than the specified maximum results if they do not fit in the message as per the max message size restrictions defined in the configuration. If this parameter is zero or not specified, the paged query includes as many results as possible that fit in the return message.

____
### `GetBackupByStorageQueryDescription`
__Type__: [GetBackupByStorageQueryDescription](sfclient-model-getbackupbystoragequerydescription.md) <br/>
__Required__: Yes<br/>
<br/>
Describes the filters and backup storage details to be used for enumerating backups.

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and a paged list of backup information.<br/> | [PagedBackupInfoList](sfclient-model-pagedbackupinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Limit maximum results

This example shows how to get list of application backups from a specified backup location. The number of results in a page are limited to maximum of two using the MaxResult parameter.

#### Request
```
POST http://localhost:19080/BackupRestore/$/GetBackups?api-version=6.2-preview&MaxResults=2
```

##### Body
```json
{
  "Storage": {
    "StorageKind": "AzureBlobStore",
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  },
  "BackupEntity": {
    "EntityKind": "Application",
    "ApplicationName": "fabric:/CalcApp"
  }
}
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "fabric:/CalcApp/CalcService#1daae3f5-7fd6-42e9-b1ba-8c05f873994d#7903dc2a-228d-44b0-b7c8-a13a6c9b46bd",
  "Items": [
    {
      "BackupId": "3a056ac9-7206-43c3-8424-6f6103003eba",
      "BackupChainId": "3a056ac9-7206-43c3-8424-6f6103003eba",
      "ApplicationName": "fabric:/CalcApp",
      "ServiceName": "fabric:/CalcApp/CalcService",
      "PartitionInformation": {
        "LowKey": "-9223372036854775808",
        "HighKey": "9223372036854775807",
        "ServicePartitionKind": "Int64Range",
        "Id": "1daae3f5-7fd6-42e9-b1ba-8c05f873994d"
      },
      "BackupLocation": "CalcApp\\CalcService\\1daae3f5-7fd6-42e9-b1ba-8c05f873994d\\2018-01-01 09.00.55.zip",
      "BackupType": "Full",
      "EpochOfLastBackupRecord": {
        "DataLossNumber": "131462452931584510",
        "ConfigurationNumber": "8589934592"
      },
      "LsnOfLastBackupRecord": "261",
      "CreationTimeUtc": "2018-01-01T09:00:55Z",
      "FailureError": null
    },
    {
      "BackupId": "7903dc2a-228d-44b0-b7c8-a13a6c9b46bd",
      "BackupChainId": "3a056ac9-7206-43c3-8424-6f6103003eba",
      "ApplicationName": "fabric:/CalcApp",
      "ServiceName": "fabric:/CalcApp/CalcService",
      "PartitionInformation": {
        "LowKey": "-9223372036854775808",
        "HighKey": "9223372036854775807",
        "ServicePartitionKind": "Int64Range",
        "Id": "1daae3f5-7fd6-42e9-b1ba-8c05f873994d"
      },
      "BackupLocation": "CalcApp\\CalcService\\1daae3f5-7fd6-42e9-b1ba-8c05f873994d\\2018-01-01 17.01.02.zip",
      "BackupType": "Incremental",
      "EpochOfLastBackupRecord": {
        "DataLossNumber": "131462452931584510",
        "ConfigurationNumber": "8589934592"
      },
      "LsnOfLastBackupRecord": "446",
      "CreationTimeUtc": "2018-01-01T17:01:02Z",
      "FailureError": null
    }
  ]
}
```


### Page using continuation token

This example shows how to get list of application backups. The number of results in a page are limited to maximum of two using the MaxResult parameter. This example uses the ContinuationToken parameter. The value of this parameter is provided from the previous query; in this case the example shown above. The response contains the remaining results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
POST http://localhost:19080/BackupRestore/$/GetBackups?api-version=6.2-preview&ContinuationToken=fabric:/CalcApp/CalcService#1daae3f5-7fd6-42e9-b1ba-8c05f873994d#7903dc2a-228d-44b0-b7c8-a13a6c9b46bd&MaxResults=2
```

##### Body
```json
{
  "Storage": {
    "StorageKind": "AzureBlobStore",
    "ConnectionString": "DefaultEndpointsProtocol=https;AccountName=storagesample;AccountKey=<PutYourAccountKeyHere>",
    "ContainerName": "BackupContainer"
  },
  "BackupEntity": {
    "EntityKind": "Application",
    "ApplicationName": "fabric:/CalcApp"
  }
}
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "BackupId": "0ff4fdbe-131c-4dfb-8249-7b4029ddc014",
      "BackupChainId": "0ff4fdbe-131c-4dfb-8249-7b4029ddc014",
      "ApplicationName": "fabric:/CalcApp",
      "ServiceName": "fabric:/CalcApp/CalcService",
      "PartitionInformation": {
        "LowKey": "-9223372036854775808",
        "HighKey": "9223372036854775807",
        "ServicePartitionKind": "Int64Range",
        "Id": "81645ec7-d260-4c59-9533-8f129bde8e83"
      },
      "BackupLocation": "CalcApp\\CalcService\\81645ec7-d260-4c59-9533-8f129bde8e83\\2018-01-01 09.01.02.zip",
      "BackupType": "Full",
      "EpochOfLastBackupRecord": {
        "DataLossNumber": "131462452931584510",
        "ConfigurationNumber": "8589934592"
      },
      "LsnOfLastBackupRecord": "161",
      "CreationTimeUtc": "2018-01-01T09:01:02Z",
      "FailureError": null
    },
    {
      "BackupId": "d55a2d98-258b-4a34-8fe5-2063e81af9dc",
      "BackupChainId": "0ff4fdbe-131c-4dfb-8249-7b4029ddc014",
      "ApplicationName": "fabric:/CalcApp",
      "ServiceName": "fabric:/CalcApp/CalcService",
      "PartitionInformation": {
        "LowKey": "-9223372036854775808",
        "HighKey": "9223372036854775807",
        "ServicePartitionKind": "Int64Range",
        "Id": "81645ec7-d260-4c59-9533-8f129bde8e83"
      },
      "BackupLocation": "CalcApp\\CalcService\\81645ec7-d260-4c59-9533-8f129bde8e83\\2018-01-01 17.00.34.zip",
      "BackupType": "Incremental",
      "EpochOfLastBackupRecord": {
        "DataLossNumber": "131462452931584510",
        "ConfigurationNumber": "8589934592"
      },
      "LsnOfLastBackupRecord": "246",
      "CreationTimeUtc": "2018-01-01T17:00:34Z",
      "FailureError": null
    }
  ]
}
```

