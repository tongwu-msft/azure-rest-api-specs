---
title: "List the usage metrics for an account | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 98891414-bc1c-48b7-ab91-9cbf92757d38
caps.latest.revision: 14
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# List the usage metrics for an account
  Lists the usage metrics, aggregated by pool across individual time intervals, for the specified account.  You can filter the statistics to a specific pool and/or time range.

## Request
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.

|Method|Request URI|
|------------|-----------------|
|GET|`https://{account-name}.{region-id}.batch.azure.com/poolusagemetrics?startTime=(startTime)&endTime=(endTime)&$filter={filter}&$skiptoken={skiptoken}&maxresults={result-number}&api-version={api-version}`|

|Parameter|Required|Description|
|---------------|--------------|-----------------|
|startTime|No|The startTime should be at least two and half hours earlier. If not specified, it defaults to the start time of the last aggregation interval currently available.|
|endTime|No|The endTime should be at least two hours earlier. If not specified, it defaults to the end time of the last aggregation interval currently available.|
|$filter|No|Specifies the condition to use to filter the list of metrics returned. The only valid property is **poolId** with a string value. Possible operations are: eq, ge, gt, le, lt, startswith|

## Response
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).

```

{
  "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#usagemetrics",
  "value":[
   {
      "startTime":"2013-04-01T00:00:00Z",
      "endTime":"2013-04-01T00:30:00Z",
      "poolId":"p1",
      "vmSize":"a1",
      "totalCoreHours":39.384838,
      "dataIngressGiB":0.0692861778661609,
      "dataEgressGiB":0.00622838735580444
    },
    {
      "startTime":"2013-04-01T00:30:00Z",
      "endTime":"2013-04-01T01:00:00Z",
      "poolId":"p2",
      "vmSize":"a8",
      "totalCoreHours":3039.384838,
      "dataIngressGiB":0.6092861778661609,
      "dataEgressGiB":0.06222838735580444
    }]
}

```

|Element name|Type|Notes|
|------------------|----------|-----------|
|startTime|DateTime|The start time of the aggregation interval covered by this entry.|
|endTime|DateTime|The end time of the aggregation interval for this entry|
|poolId|String|The id of the pool whose metrics are aggregated in this entry.|
|vmSize|String|The size of the virtual machines in the pool. All virtual machines in a pool are the same size. <br/><br/> For information about available sizes of virtual machines for Cloud Services pools (pools created with cloudServiceConfiguration), see [Sizes for Cloud Services](http://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/). Batch supports all Cloud Services VM sizes except `ExtraSmall`, `Standard_A1_v2`, and `Standard_A2_v2`.<br/><br/> For information about available VM sizes for pools using images from the Virtual Machines Marketplace (pools created with virtualMachineConfiguration) see [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/) (Linux) or [Sizes for Virtual Machines](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/) (Windows). Batch supports all Azure VM sizes except `STANDARD_A0`, `STANDARD_A1_V2`, `STANDARD_A2_V2`, and those with premium storage (`STANDARD_GS`, `STANDARD_DS`, and `STANDARD_DSV2` series).|
|totalCoreHours|Double|The total core hours used in the pool during this aggregation interval.|
|dataIngressGiB|Double|The cross data center network ingress to the pool during this interval, in GiB.|
|dataEgressGiB|Double|The cross data center network egress from the pool during this interval, in GiB.|

 **Remarks**

 If you do not specify a $filter clause including a poolId, the response includes all pools that existed in the account in the time range of the returned aggregation intervals.

 If not specified, the startTime and endTime filters default to the start and end times of the last aggregation interval currently available; that is, only the last aggregation interval is returned.

