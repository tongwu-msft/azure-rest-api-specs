---
title: "Get Supported Metrics"
ms.custom: ""
ms.date: "05/13/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: 2d886358-72f4-4e7b-aafa-64b3cc084454
caps.latest.revision: 12
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
# Get Supported Metrics
This operation returns the list of supported metrics (data points) of a target Service Bus messaging entity.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|https://management.core.windows.net/{subscription ID}/ services/servicebus/Namespaces/{Namespace}/\<ResourcePath>/Metrics|  
  
### Parameters  
  
|Parameter Name|Description|  
|--------------------|-----------------|  
|**SubscriptionID**|The Azure subscription.|  
|**Namespace**|The Azure Service Bus namespace.|  
|**ResourcePath**|Path to the Service Bus entity.|  
  
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
|Content-Type|application/xml; application/json|  
  
### Response Body  
  
-   If the entity exists  
  
    -   Requested Metric list  
  
-   Else  
  
    -   None  
  
## Example  
 The following example returns the data points (and units) that are available for MyNamespace/MyQueue:  
  
```  
GET https://management.core.windows.net/{subscriptionID}/services/ServiceBus/Namespaces/MyNamespaceName/Queues/MyQueueName/metrics  
```