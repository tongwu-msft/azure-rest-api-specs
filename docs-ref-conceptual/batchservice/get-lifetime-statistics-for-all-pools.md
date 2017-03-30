---
title: "Get lifetime statistics for all pools | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 44ee1b90-025c-4fd0-bb21-4d4bef8e735e
caps.latest.revision: 11
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get lifetime statistics for all pools
  Gets the lifetime statistics for all of the pools in the specified account. Statistics are aggregated across all pools that have ever existed in the account, from account creation to the last update time of the statistics.

##  <a name="bk_lifetime"></a> Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/lifetimepoolstats?api-version={api-version}`|

##  <a name="bk_detailed"></a> Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

```json

{ "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#poolstats/@Element",
  "url":"https://myaccount.myregion.batch.azure.com/lifetimepoolstats",
  "usageStats": {
    "startTime":"2014-08-01T18:30:00.4345729Z",
    "lastUpdateTime":"2014-08-04T18:30:00.4345729Z",
    "dedicatedCoreTime":"PT0S"
  },
  "resourceStats": {
    "startTime":"2014-08-01T18:30:00.4345729Z",
    "lastUpdateTime":"2014-08-04T18:30:00.4345729Z",
    "avgCPUPercentage":"40.0",
    "avgMemoryGiB":"2.0",
    "peakMemoryGiB":"4.0",
    "avgDiskGiB":"125.0",
    "peakDiskGiB":"240.0",
    "diskReadIOps":"0",
    "diskWriteIOps":"0",
    "diskReadGiB":"10.0",
    "diskWriteGiB":"1.0",
    "networkReadGiB":"20.0",
    "networkWriteGiB":"25.0"
  }
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|[usageStats](../batchservice/get-lifetime-statistics-for-all-pools.md#usageStats)|Complex Type|Contains statistics related to pool usage information, such as the amount of core\-time used.|
|[resourceStats](../batchservice/get-lifetime-statistics-for-all-pools.md#bk_resourceStats)|Complex Type|Contains statistics related to resource consumption by nodes in the pool.|

##  <a name="usageStats"></a> usageStats

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The start time of the time range covered by the statistics.|
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|
|dedicatedCoreTime|Time|Aggregated wall\-clock time of the dedicated node cores being part of the pool.|

##  <a name="bk_resourceStats"></a> resourceStats

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The start time of the time range covered by the statistics.|
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|
|avgCPUPercentage|Double|The average CPU usage across all nodes in the pool \(percentage per node\).|
|avgMemoryGiB|Double|The average memory usage in GiB across all nodes in the pool.|
|peakMemoryGiB|Double|The peak memory usage in GiB across all nodes in the pool.|
|avgDiskGiB|Double|The average used disk space in GiB across all nodes in the pool.|
|peakDiskGiB|Double|The peak used disk space in GiB across all nodes in the pool.|
|diskReadIOps|Int64|The total number of disk read operations across all nodes in the pool.|
|diskWriteIOps|Int64|The total number of disk write operations across all nodes in the pool.|
|diskReadGiB|Double|The total amount of data in GiB of disk reads across all nodes in the pool.|
|diskWriteGiB|Double|The total amount of data in GiB of disk writes across all nodes in the pool.|
|networkReadGiB|Double|The total amount of data in GiB of network reads across all nodes in the pool.|
|networkWriteGiB|Double|The total amount of data in GiB of network writes across all nodes in the pool.|

