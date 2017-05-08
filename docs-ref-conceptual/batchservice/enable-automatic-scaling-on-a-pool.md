---
title: "Enable automatic scaling on a pool | Microsoft Docs"
ms.custom: ""
ms.date: "2017-02-01"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "batch"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: a1ac3653-0840-45cd-a682-f1f51566a6cd
caps.latest.revision: 14
author: "tamram"
ms.author: "tamram"
manager: "timlt"
---
# Enable automatic scaling on a pool
  Enables automatic scaling for a pool or changes the existing automating scaling settings for a pool.  
  
##  <a name="bk_lifetime"></a> Request  
 See [Common Parameters and Headers](../batchservice/common-parameters-and-headers.md) for headers and parameters that are used by all requests related to pools.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`https://{account-name}.{region-id}.batch.azure.com/pools/{pool-id}/enableautoscale?api-version={api-version}`|  
  
 Replace {pool-id} with the id of the pool that you want to update.  
  
 If automatic scaling of the pool is currently disabled, you must specify a valid autoscale formula as part of the request. Autoscale evaluation interval is optional.  
  
 If automatic scaling of the pool is already enabled, you may specify a new autoscale formula and/or a new evaluation interval (but you must specify at least one of these).  
  
-   If you specify a new autoscaleEvaluationInterval, then the existing autoscale evaluation schedule will be stopped and a new autoscale evaluation schedule will be started, with its starting time being the time when this request was issued.  
  
-   If you omit either autoScaleFormula or autoScaleEvaluationInterval, the Batch service continues to use the current value of that setting.  
  
 You cannot call Enable Autoscale for the same pool more than once every 30 seconds.  
  
 The following example shows an Enable Autoscale request whose formula increases the number of nodes that are used by 10% when the CPU usage in the pool for past 10 minutes stays over 70%.  
  
```  
{  
  
"autoScaleFormula": "totalNodes=($CPUPercent.GetSamplePercent(TimeInterval_Minute*0,TimeInterval_Minute*10)<0.7?5:(min($CPUPercent.GetSample(TimeInterval_Minute*0, TimeInterval_Minute*10))>0.8?($CurrentDedicated*1.1):$CurrentDedicated));$targetDedicatedNodes=min(100,totalNodes);"  
}  
  
```  
  
 The following example shows an Enable Autoscale request that updates the automatic scaling evaluation time interval to 10 minutes and keep the current formula unchanged.  
  
```  
{  
"autoScaleEvaluationInterval": "PT10M"      
}  
  
```  
  
|Element name|Required|Type|Notes|  
|------------------|--------------|----------|-----------|  
|autoScaleFormula|No|String|Specifies a formula for the desired number of dedicated compute nodes in the pool.<br /><br /> The formula is checked for validity before it is applied to the pool. If the formula is not valid, the Batch service rejects the request with detailed error information.<br /><br /> For more information about specifying this formula, see [Automatically scale compute nodes in an Azure Batch pool.](https://azure.microsoft.com/en-us/documentation/articles/batch-automatic-scaling)|  
|autoScaleEvaluationInterval|No|Time|Specifies a time interval at which to automatically adjust the pool size according to the autoscale formula.<br />The default value is 15 minutes.<br /><br /> The minimum and maximum value are 5 minutes and 168 hours respectively. If you specify a value less than 5 minutes or greater than 168 hours, the Batch service returns a Bad Request (400).|  
  
## Response  
 Status code: 200. For more information, see [Batch Status and Error Codes](../batchservice/batch-status-and-error-codes.md)  
  
## Remarks  
 You cannot enable automatic scaling on a pool if a resize operation is in progress on the pool.  
  
  