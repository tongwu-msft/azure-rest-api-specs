---
title: "Get Metrics Rollups"
ms.custom: ""
ms.date: "05/12/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: d2955e1e-32cd-4bc2-a3a2-3175c445ed01
caps.latest.revision: 10
author: "sethmanheim"
ms.author: "sethm"
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
# Get Metrics Rollups
This operation gets rollup data for Service Bus metrics. Rollup data includes the time precision for the telemetry aggregation as well as the retention settings for each time detail.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|https://management.core.windows.net/{subscription ID}/ services/servicebus/Namespaces/{Namespace}/\<ResourcePath>/Metrics/\<MetricKeyPredicate>/Rollups|  
  
### Parameters  
  
|Parameter Name|Description|  
|--------------------|-----------------|  
|**SubscriptionID**|Your Azure subscription|  
|**Namespace**|Your Azure Service Bus Namespace|  
|**ResourcePath**|Include path to the Service Bus entity you’re exploring|  
|**MetricKeyPredicate**|Metric name. Metric name (data point) depends on the entity type you are querying.|  
  
### Request Body  
  
-   *none*  
  
## Response  
  
### Response Codes  
  
|HTTP Code|Condition|  
|---------------|---------------|  
|**200**|Successfully retrieved metric data.|  
|**401**|Authorization failure. Returned when user does not have credentials to retrieve metric data. This could be due to suspended subscription.|  
|**404**|Entity does not exist under this namespace.|  
|**500**|Internal/unhandled exception.|  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml ; application/json|  
  
### Response Body  
  
-   If the entity exists  
  
    -   Requested Metric values  
  
-   Else  
  
    -   None  
  
## Example  
 The following call returns the data rollups (time precision and retention windows) available for the “outgoing” data point for MyNamespace/MyQueue:  
  
```  
GET https://management.core.windows.net/{subscriptionID}/services/servicebus/Namespaces/MyNamespace/Queues/MyQueue/metrics/outgoing/rollups  
```