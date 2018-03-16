---
title: "Submit a job"
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
ms.assetid: 3702be47-3a26-42a0-8807-8809cd49a90b
caps.latest.revision: 13
ms.author: "jgao"
manager: "jhubbard"
---
# Submit a job
Submit an Azure Data Lake Analytics job.  
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  


|Method|Request URI|  
|-|-|  
|PUT|https://{account-name}.azuredatalakeanalytics.net/jobs/{jobId}?api-version={api-version}|  
  
### Request body  
 The following example shows the request body for submitting a Data Lake Analytics job:  
  
```  
{  
  "jobId": "2271a4cb-b6a9-4633-8bd5-b3bec13a7319",  
  "name": "convertTSVtoCSV",  
  "type": "USql",  
  "degreeOfParallelism": 1,  
  "priority": 1000,  
  "properties": {  
    "type": "USql",  
    "script": "<U-SQL script>"  
  }  
}  
```  
  

|Element name|Required?|Description|  
|-|-|-|  
|name|Required|Specifies the job name.|  
|type|Required|Specifies the job type.|  
|degreeOfParallelism|Required|Specifies the maximum allowable degree of parallelism for the job. if it is not set, the default value is 1.|  
|priority|Required|Specifies the priority of the job. If it is not set, the default value is 1000.|  
|properties|Required|Specifies the properties of the job.|  
|type|Required|Specifies the type of job.|  
|script|Required|Specifies the script contents.|  
|compileMode|Optional|Specifies the U-SQL compile mode. If not set, this will be “full”.|  
|runtimeVersion|Optional|Specifies the U-SQL runtime version. If not set, this will be the latest supported runtime.|  
  
## Response  
  
### Status code  
  

|Status code|Condition(s)|  
|-|-|  
|200 (OK)|The operation is successful.|  
  
### Response body  
 The following example shows the response body for submitting a Data Lake Analytics job:  
  
```  
{  
  "jobId": "2271a4cb-b6a9-4633-8bd5-b3bec13a7319",  
  "name": "convertTSVtoCSV",  
  "type": "USql",  
  "submitter": "my@microsoft.com",  
  "degreeOfParallelism": 1,  
  "priority": 1000,  
  "submitTime": "2016-08-31T11:44:20.0489664-04:00",  
  "state": "Compiling",  
  "result": "Succeeded",  
  "stateAuditRecords": [  
    {  
      "newState": "New",  
      "timeStamp": "2016-08-31T11:44:20.0489664-04:00",  
      "details": "userName:my@microsoft.com;submitMachine:N/A"  
    }  
  ],  
  "properties": {  
    "owner": "my@microsoft.com",  
    "resources": [],  
    "runtimeVersion": "default",  
    "rootProcessNodeId": "00000000-0000-0000-0000-000000000000",  
    "algebraFilePath": "adl://myadls0825.azuredatalakestore.net/system/jobservice/jobs/Usql/2016/08/31/15/44/2271a4cb-b6a9-4633-8bd5-b3bec13a7319/algebra.xml",  
    "compileMode": "Semantic",  
    "errorSource": "Unknown",  
    "totalCompilationTime": "PT0S",  
    "totalPausedTime": "PT0S",  
    "totalQueuedTime": "PT0S",  
    "totalRunningTime": "PT0S",  
    "type": "USql"  
  }  
}  
```  
  

|Element name|Description| 
|-|-|   
|jobId|The job ID.|  
|name|The job name.|  
|type|The job type.|  
|degreeOfParallelism|The maximum allowable degree of parallelism for the job.|  
|priority|The priority of the job.|  
|errorMessage|The job’s error message.|  
|properties|The property of the U-SQL job.|  
|script|The script that was submitted.|  
|compileMode|The level of compilation.|  
|runtimeVersion|The runtime version that the job.|