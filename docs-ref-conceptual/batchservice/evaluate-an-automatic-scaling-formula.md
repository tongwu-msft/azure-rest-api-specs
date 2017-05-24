---
title: "Evaluate an automatic scaling formula | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: e40475c7-827c-4d24-9716-b2aa20cf5312
caps.latest.revision: 17
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Evaluate an automatic scaling formula
  Gets the result of evaluating an automatic scaling formula on the pool.  This API is primarily for validating an autoscale formula, as it simply returns the result to the client without applying the formula to the pool.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/evaluateautoscale?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool on which you want to evaluate an automatic scaling formula.  
  
> [!NOTE]  
>  Automatic scaling must be enabled on the pool to evaluate a formula. For more information, see [Enable automatic scaling on a pool](../batchservice/enable-automatic-scaling-on-a-pool.md).  
  
 The following example shows a request body that could be used when automatic scaling is enabled. The formula increases the number of nodes that are used by 10% when the CPU usage in the pool for past 10 minutes stays over 70%.  
  
```  
{  
  "autoScaleFormula": "totalNodes=($CPUPercent.GetSamplePercent(TimeInterval_Minute*0,TimeInterval_Minute*10)<0.7?5:(min($CPUPercent.GetSample(TimeInterval_Minute*0, TimeInterval_Minute*10))>0.8?($CurrentDedicated*1.1):$CurrentDedicated));$targetDedicatedNodes=min(100,totalNodes);"  
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|autoScaleFormula|Yes|String|Specifies a formula for the desired number of compute nodes in the pool.<br /><br /> The formula is validated and its results calculated, but is not applied to the pool.  To apply the formula to the pool, use [Enable automatic scaling on a pool](../batchservice/enable-automatic-scaling-on-a-pool.md).<br /><br /> For more information about specifying this formula, see [Automatically scale compute nodes in an Azure Batch pool](https://msdn.microsoft.com/library/azure/dn820182.aspx).|  
  
## Response  
 For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md).  
  
```  
{  
  "odata.metadata":"https://myaccount.batch.core.windows.net/$metadata#Microsoft.WindowsAzure.Batch.Protocol.Entities.AutoScaleRun",  
  "timestamp":"2014-09-02T17:04:50.0818057Z",  
  "results":"$targetDedicatedNodes=5;$NodeDeallocationOption=requeue",  
  "error": {  
    "code":"InsufficientSampleData",  
    "message":"Autoscale evaluation failed due to insufficient sample data",  
    "values":[ {  
      "name":"Message",  
      "value":"Line 1, Col 37: Insufficient data from data set: $CPUPercent wanted 10%, received 0%"  
    } ]  
  }  
}  
  
```  
  
> [!NOTE]  
>  The previous example shows a typical error that occurs when data cannot be obtained from the pool.  
  
|Element name|Type|Notes|  
|------------------|----------|-----------|  
|timestamp|DateTime|The time at which the autoscale formula was evaluated|  
|results|String|The final values of all variables used in the autoscale formula.  Each variable value is returned in the form $*variable=value*, and variables are separated by semicolons.|  
|error|Complex Type|Contains details of the error encountered evaluating the autoscale formula on the pool, if evaluation was unsuccessful|  
  
  