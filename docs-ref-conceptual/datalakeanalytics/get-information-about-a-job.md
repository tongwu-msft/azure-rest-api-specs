---
title: "Get information about a job"
ms.custom: ""
ms.date: "2016-10-27"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "data-lake-analytics"
ms.suite: ""
ms.technology: 
  - "analysis-services"
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 32d4f73a-744a-45f9-99a3-3cecb2774f7e
caps.latest.revision: 14
ms.author: "jgao"
manager: "jhubbard"
---
# Get information about a job
Get information about an Azure Data Lake Analytics job.  
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  


|Method|Request URI|  
|-|-|  
|GET|https://{account-name}.azuredatalakeanalytics.net/jobs/{job-id}?api-version={api-version}|  
  
## Response  
  
### Status code  
  

|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|  
  
### Response body  
The following example shows the reponse body for getting information for a Data Lake Analytics job:  
  
```  
{  
  "jobId": "2271a4cb-b6a9-4633-8bd5-b3bec13a7319",  
  "name": "convertTSVtoCSV",  
  "type": "USql",  
  "submitter": "my@microsoft.com",  
  "degreeOfParallelism": 1,  
  "priority": 1000,  
  "submitTime": "2016-08-31T11:44:20.0489664-04:00",  
  "startTime": "2016-08-31T11:44:46.7593536-04:00",  
  "endTime": "2016-08-31T11:45:41.6840064-04:00",  
  "state": "Ended",  
  "result": "Succeeded",  
  "stateAuditRecords": [  
    {  
      "newState": "New",  
      "timeStamp": "2016-08-31T11:44:20.0489664-04:00",  
      "details": "userName:my@microsoft.com;submitMachine:N/A"  
    },  
    {  
      "newState": "Compiling",  
      "timeStamp": "2016-08-31T11:44:20.6583211-04:00",  
      "details": "CcsAttempts:1;Status:Dispatched"  
    },  
    {  
      "newState": "Queued",  
      "timeStamp": "2016-08-31T11:44:36.408693-04:00"  
    },  
    {  
      "newState": "Scheduling",  
      "timeStamp": "2016-08-31T11:44:36.4243176-04:00",  
      "details": "Detail:Dispatching job to cluster.;rootProcessId:f56f2a05-3904-442e-8a2d-01875f07fc8f"  
    },  
    {  
      "newState": "Starting",  
      "timeStamp": "2016-08-31T11:44:36.4399255-04:00",  
      "details": "runtimeVersion:kobo_live_signed_5080972"  
    },  
    {  
      "newState": "Running",  
      "timeStamp": "2016-08-31T11:44:46.7593536-04:00",  
      "details": "runAttempt:1"  
    },  
    {  
      "newState": "Ended",  
      "timeStamp": "2016-08-31T11:45:41.6840064-04:00",  
      "details": "result:Succeeded"  
    }  
  ],  
  "properties": {  
    "owner": "my@microsoft.com",  
    "resources": [  
      {  
        "name": "__ScopeCodeGen__.dll",  
        "resourcePath": "adl://myadls0825.azuredatalakestore.net/system/jobservice/jobs/Usql/2016/08/31/15/44/2271a4cb-b6a9-4633-8bd5-b3bec13a7319/__ScopeCodeGen__.dll",  
        "type": "VertexResource"  
      },  
	  ...  
    ],  
    "runtimeVersion": "kobo_live_signed_5080972",  
    "rootProcessNodeId": "f56f2a05-3904-442e-8a2d-01875f07fc8f",  
    "script": "<U-SQL script>",  
    "algebraFilePath": "adl://myadls0825.azuredatalakestore.net/system/jobservice/jobs/Usql/2016/08/31/15/44/2271a4cb-b6a9-4633-8bd5-b3bec13a7319/algebra.xml",  
    "yarnApplicationId": 277,  
    "yarnApplicationTimeStamp": 1472654842050,  
    "compileMode": "Semantic",  
    "errorSource": "Unknown",  
    "totalCompilationTime": "PT15.7503719S",  
    "totalPausedTime": "PT0S",  
    "totalQueuedTime": "PT0.0156246S",  
    "totalRunningTime": "PT54.9246528S",  
    "type": "USql"  
  }  
}  
```  
  

|Element name|Description| 
|-|-|   
|jobId|The job ID.|  
|name|The job name.|  
|type|The job type.|  
|submitter|The user that submitted the job.|  
|degreeOfParallelism|The maximum allowable degree of parallelism for the job.|  
|priority|The priority of the job.|  
|submitTime|The submit time of the job.|  
|startTime|The start time of the job.|  
|endTime|The end time of the job.|  
|state|The current state of the job.|  
|result|The reason why the job ended.|  
|errorMessage|The error text.|  
|stateAuditRecords|The list of job state audit records.|  
|newState|The new state that resulted from this state change.|  
|timeStamp|The time at which the state change occurred.|  
|requestedByUser|The user who requested the state change, if available.|  
|details|The additional details regarding the state change.|  
|properties|The job properties|  
|rootProcessNodeId|The root process node ID.|  
|yarnApplicationId|The YARN application ID.|  
|resources|The job resources.|  
|name|The filename of the resource.|  
|resourcePath|The fully qualified path to the resource. |  
|type|The type of job resource.|  
|script|The U-SQL script contents.|  
|algebraFilePath|The U-SQL algebra XML file path.|  
|compileMode|The U-SQL compile mode.|  
|runtimeVersion|The U-SQL runtime version.|  
|totalCompilationTime|The total time spent in the ‘compiling’ state.|  
|totalQueuedTime|The total time spent in the ‘queued’ state.|  
|totalRunningTime|The total time spent in the ‘running’ state.|