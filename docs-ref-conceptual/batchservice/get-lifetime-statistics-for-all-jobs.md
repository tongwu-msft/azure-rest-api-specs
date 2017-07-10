---
title: "Get lifetime statistics for all jobs | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: af717754-3d1d-4761-a876-aea851f08e85
caps.latest.revision: 15
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Get lifetime statistics for all jobs
  Gets lifetime summary statistics for all of the jobs in the specified account. Statistics are aggregated across all jobs that have ever existed in the account, from account creation to the last update time of the statistics.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to accounts.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`https://{account-name}.{region-id}.batch.azure.com/lifetimejobstats?api-version={api-version}`|  
  
##  <a name="bk_detailed"></a> Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
```  
{ "odata.metadata":"https://myaccount.myregion.batch.azure.com/$metadata#jobstats/@Element",  
  "url":"https://myaccount.myregion.batch.core.windows.net/lifetimejobstats",  
  "startTime":"2014-08-01T18:30:00.4345729Z",  
  "lastUpdateTime":"2014-08-04T18:30:00.4345729Z",  
  "userCPUTime":"PT0S",  
  "kernelCPUTime":"PT0S",  
  "wallClockTime":"PT0S",  
  "readIOps":"0",  
  "writeIOps":"0",  
  "readIOGiB":"10.0",  
  "writeIOGiB":"5.0",  
  "numSucceededTasks":"0",  
  "numFailedTasks":"0",  
  "numTaskRetries":"0",  
  "waitTime":"PT0S"  
}  
  
```  
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|startTime|DateTime|The start time of the time range covered by the statistics|  
|lastUpdateTime|DateTime|The time at which the statistics were last updated. All statistics are limited to the range between startTime and lastUpdateTime.|  
|userCPUTime|Time|The total user mode CPU time (summed across all cores and all compute nodes) consumed by all the tasks in the job.|  
|kernelCPUTime|Time|The total kernel mode CPU time (summed across all cores and all compute nodes) consumed by all the tasks in the job.|  
|wallClockTime|Time|The total wall clock time of all the tasks in the job. The wall clock time is the elapsed time from when the task started running on a compute node to when it finished (or to the last time the statistics were updated, if the task had not finished by then).<br /><br /> If a task was retried, this includes the wall clock time of all the task retries.|  
|readIOps|Int64|The total number of disk read operations made by all tasks in the job.|  
|writeIOps|Int64|The total number of disk write operations made by all tasks in the job.|  
|readIOGiB|Double|The total gibibytes read from disk by all tasks in the job.|  
|writeIOGiB|Double|The total gibibytes written to disk by all tasks in the job.|  
|numSucceededTasks|Int64|The total number of tasks successfully completed in the job during the given time range.  A task completes successfully if it returns exit code 0.|  
|numFailedTasks|Int64|The total number of tasks in the job that failed during the given time range. A task fails if it exhausts its maximum retry count without returning exit code 0.|  
|numTaskRetries|Int64|The total number of retries on all the tasks in the job during the given time range.|  
|waitTime|Time|The total wait time of all the tasks in the job.  The wait time for a task is defined as the elapsed time between the creation of the task creation and the start of task execution.  (If the task is retried due to failures, the wait time is the time to the most recent task execution.)  This value is only reported in the account lifetime statistics; it is not included in the job statistics.|  
  
  