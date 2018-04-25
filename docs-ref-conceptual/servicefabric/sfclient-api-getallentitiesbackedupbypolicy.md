---
title: "Get All Entities Backed Up By Policy"
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
# Get All Entities Backed Up By Policy
Gets the list of backup entities that are associated with this policy.

Returns a list of Service Fabric application, service or partition which are associated with this backup policy.


## Request
| Method | Request URI |
| ------ | ----------- |
| GET | `/BackupRestore/BackupPolicies/{backupPolicyName}/$/GetBackupEnabledEntities?api-version=6.2-preview&ContinuationToken={ContinuationToken}&MaxResults={MaxResults}&timeout={timeout}` |


## Parameters
| Name | Type | Required | Location |
| --- | --- | --- | --- |
| [`backupPolicyName`](#backuppolicyname) | string | Yes | Path |
| [`api-version`](#api-version) | string | Yes | Query |
| [`ContinuationToken`](#continuationtoken) | string | No | Query |
| [`MaxResults`](#maxresults) | integer (int64) | No | Query |
| [`timeout`](#timeout) | integer (int64) | No | Query |

____
### `backupPolicyName`
__Type__: string <br/>
__Required__: Yes<br/>
<br/>
The name of the backup policy.

____
### `api-version`
__Type__: string <br/>
__Required__: Yes<br/>
__Default__: `6.2-preview` <br/>
<br/>
The version of the API. This parameter is required and its value must be '6.2-preview'.


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
| 200 (OK) | A successful operation will return 200 status code and a paged list of Service Fabric entities that are associated with this policy.<br/> | [PagedBackupEntityList](sfclient-model-pagedbackupentitylist.md) |
| All other status codes | The detailed error response.<br/> | [FabricError](sfclient-model-fabricerror.md) |

## Examples

### Limit maximum results

This example shows how to get list of backup entities that are currently associated with a backup policy. The number of results in a page are limited to maximum of two using the MaxResult parameter.

#### Request
```
GET http://localhost:19080/BackupRestore/BackupPolicies/DailyAzureBackupPolicy/$/GetBackupEnabledEntities?api-version=6.2-preview&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "fabric:/DemoApp",
  "Items": [
    {
      "EntityKind": "Application",
      "ApplicationName": "fabric:/CalcApp"
    },
    {
      "EntityKind": "Application",
      "ApplicationName": "fabric:/DemoApp"
    }
  ]
}
```


### Page using continuation token

This example shows how to get list of backup entities that are currently associated with a backup policy. This example uses the ContinuationToken parameter. The value of this parameter is provided from the previous query; in this case the example shown above. The response contains the remaining results and an empty ContinuationToken. The empty ContinuationToken indicates that additional results are not available.

#### Request
```
GET http://localhost:19080/BackupRestore/BackupPolicies/DailyAzureBackupPolicy/$/GetBackupEnabledEntities?api-version=6.2-preview&ContinuationToken=fabric:/DemoApp&MaxResults=2
```

#### 200 Response
##### Body
```json
{
  "ContinuationToken": "",
  "Items": [
    {
      "EntityKind": "Service",
      "ServiceName": "fabric:/VotingApp/VotingActorService"
    }
  ]
}
```

