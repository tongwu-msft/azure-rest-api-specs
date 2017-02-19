---
title: "Get Metrics Data"
ms.custom: ""
ms.date: "05/13/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: c1598c64-0ae1-43d5-b1ff-8b54bd163f7a
caps.latest.revision: 11
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
# Get Metrics Data
This operation returns the data for a provided data point in a specified time window.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|https://management.core.windows.net/{subscription ID}/ services/servicebus/Namespaces/{Namespace}/\<ResourcePath>/MetricKeyPredicate/Rollups/RollupKeyPredicate/Values/?\<queryOptions>|  
  
### Parameters  
  
|Parameter Name|Description|  
|--------------------|-----------------|  
|**SubscriptionID**|The Azure subscription.|  
|**Namespace**|The Service Bus namespace.|  
|**ResourcePath**|Path to the Service Bus entity being queried.|  
|**MetricKeyPredicate**|Metric name. Metric name (data point) depends on the entity type you are querying.|  
|**RollupKeyPredicate**|Rollup key (name). For example, PT1H specifies a rollup policy of one hour.|  
|**QueryOptions**|$filter=\<Filter expression>|  
|**Filter Expression**|Timestamp \<Logical Operator> \<Value> AND \<Filter expression>|  
|**Logical Operator**|Eq &#124; Ne &#124; Gt &#124; Ge &#124; Lt &#124; Le|  
  
### Request Body  
  
-   *none*  
  
## Response  
  
### Response Codes  
  
|HTTP Code|Condition|  
|---------------|---------------|  
|**200**|Successfully retrieved metric data.|  
|**401**|Authorization failure. Returned when user does not have credentials to retrieve metric data; for example, if a subscription is suspended.|  
|**404**|Entity does not exist under this namespace.|  
|**500**|Internal/unhandled exception.|  
  
### Response Headers  
  
|Response Header|Description|  
|---------------------|-----------------|  
|Content-Type|application/xml; application/json|  
  
### Response Body  
  
-   If the entity exists  
  
    -   Requested metric values  
  
-   Else  
  
    -   None  
  
## Example  
 The following call retrieves the size of MyNamespace/MyQueue in the last day (aggregates by hours):  
  
```  
GET https://management.core.windows.net/{SubscriptionID}/services/servicebus/Namespaces/MyNamespace/Queues/MyQueue/Metrics/size/Rollups/PT1H/Values?$filter=Timestamp%20gt%20datetime'2013-02-23T13:05:09.5409008Z'  
```