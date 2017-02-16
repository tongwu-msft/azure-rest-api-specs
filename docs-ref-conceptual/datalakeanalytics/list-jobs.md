---
title: "List jobs"
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
ms.assetid: 6140becd-58ca-4357-af93-5c35b2aae19e
caps.latest.revision: 12
ms.author: "jgao"
manager: "jhubbard"
---
# List jobs
List Azure Data Lake Analytics jobs.  
  
## Request  
 See [Common parameters and headers](../AzureDataLakeStoreREST/job-management-apis.md#bk_common_adla) for headers and parameters that are used by the REST call.  
  

|Method|Request URI|  
|-|-|  
|GET|https://{account-name}.azuredatalakeanalytics.net/jobs?api-version={api-version}[&skipToken={skip-token}][&\<odata query params>]|  
  
## Response  
  
### Status code  
  
  
|Status code|Condition(s)|  
|-|-|
|200 (OK)|The operation is successful.|  
  
### Response body  
 The following example shows the response body for requesting a list of Data Lake Analytics jobs:  
  
```  
{  
  "value": [  
    {  
      "jobId": "45e6d645-e468-4227-b1b2-69f57718e46f",  
      "name": "convertTSVtoCSV",  
      "type": "USql",  
      "submitter": "my@microsoft.com",  
      "degreeOfParallelism": 1,  
      "priority": 1000,  
      "submitTime": "2016-08-31T11:42:43.9699823-04:00",  
      "startTime": "2016-08-31T11:43:13.0066568-04:00",  
      "endTime": "2016-08-31T11:43:58.2672126-04:00",  
      "state": "Ended",  
      "result": "Succeeded"  
    },  
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
      "result": "Succeeded"  
    }  
  ]  
}  
```  
  

|Element name|Description|  
|-|-|  
|count|The total number of jobs matching the query.|  
|value|The list of Jobs.|  
|jobId|The job ID.|  
|name|The job name.|  
|type|The job type / language.|  
|submitter|The user that submitted the job.|  
|degreeOfParallelism|The maximum allowable degree of parallelism for the job.|  
|priority|The priority of the job.|  
|submitTime|The submit time of the job.|  
|startTime|The start time of the job.|  
|endTime|The end time of the job.|  
|state|The current state of the job.|  
|result|The reason why the job ended.|