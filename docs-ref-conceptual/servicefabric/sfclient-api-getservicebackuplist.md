---
title: "Get Service Backup List"
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
# Get Service Backup List
Gets the list of backups available for every partition in this service.

Returns a list of backups available for every partition in this Service Fabric service. The server enumerates all the backups available in the backup store configured in the backup policy. It also allows filtering of the result based on start and end datetime or just fetching the latest available backup for every partition.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/Services/{serviceId}/$/GetBackups?api-version=6.2-preview&timeout={timeout}&Latest={Latest}&StartDateTimeFilter={StartDateTimeFilter}&EndDateTimeFilter={EndDateTimeFilter}&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`serviceId`](#serviceid) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |
| [`Latest`](#latest) | boolean | No | Query |
| [`StartDateTimeFilter`](#startdatetimefilter) | string (date-time) | No | Query |
| [`EndDateTimeFilter`](#enddatetimefilter) | string (date-time) | No | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |

____
### `serviceId`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The identity of the service. This is typically the full name of the service without the 'fabric:' URI scheme.
Starting from version 6.0, hierarchical names are delimited with the "~" character.
For example, if the service name is "fabric:/myapp/app1/svc1", the service identity would be "myapp~app1~svc1" in 6.0+ and "myapp/app1/svc1" in previous versions.


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
### `Latest`
__Type__: boolean <br/>
__Required__: No<br/>
__Default__: `false` <br/>
<br/>
Specifies whether to get only the most recent backup available for a partition for the specified time range.

____
### `StartDateTimeFilter`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Specify the start date time from which to enumerate backups, in datetime format. The date time must be specified in ISO8601 format. This is an optional parameter. If not specified, all backups from the beginning are enumerated.

____
### `EndDateTimeFilter`
__Type__: string (date-time) <br/>
__Required__: No<br/>
<br/>
Specify the end date time till which to enumerate backups, in datetime format. The date time must be specified in ISO8601 format. This is an optional parameter. If not specified, enumeration is done till the most recent backup.

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

## Responses

| HTTP Status Code | Description | Response Schema |
| --- | --- | --- |
| 200 (OK) | A successful operation will return 200 status code and a paged list of backup information.<br/> | [PagedBackupInfoList](sfclient-model-pagedbackupinfolist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Get application backups within a time range

This example shows how to get list of service backups within a time range.

#### Request
```
GET http://localhost:19080/Services/CalcApp/CalcService/$/GetBackups?api-version=6.2-preview&StartDateTimeFilter=2018-01-01T00:00:00Z&EndDateTimeFilter=2018-01-01T23:59:59Z
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
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
    },
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


### Get latest backup

This example shows how to get the latest backup for each partition within a service.

#### Request
```
GET http://localhost:19080/Services/CalcApp/CalcService/$/GetBackups?api-version=6.2-preview&Latest=True
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
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


### Limit maximum results

This example shows how to get list of service backups. The number of results in a page are limited to maximum of two using the MaxResult parameter.

#### Request
```
GET http://localhost:19080/Services/CalcApp/CalcService/$/GetBackups?api-version=6.2-preview&MaxResults=2
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

This example shows how to get list of service backups. The number of results in a page are limited to maximum of two using the MaxResult parameter. This example uses the ContinuationToken parameter. The value of this parameter is provided from the previous query; in this case the example shown above. The response contains the remaining results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/Services/CalcApp/CalcService/$/GetBackups?api-version=6.2-preview&ContinuationToken=fabric:/CalcApp/CalcService#1daae3f5-7fd6-42e9-b1ba-8c05f873994d#7903dc2a-228d-44b0-b7c8-a13a6c9b46bd&MaxResults=2
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

