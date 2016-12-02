---
title: "Service Bus Entity Metrics REST APIs"
ms.custom: ""
ms.date: "05/20/2015"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-bus"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
ms.assetid: eafbd82c-02cf-4db7-a4db-ccdf94793041
caps.latest.revision: 15
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
# Service Bus Entity Metrics REST APIs
Service Bus collects usage telemetry for queues, topics, and subscriptions. You can access this data either through the Azure classic portal or by using the Service Bus RDFE APIs.  
  
 Service Bus collects data for messaging entities every 5 minutes. However, you can retrieve your metrics data within hourly and daily precision time windows.  
  
## Using the Service Bus entity metrics REST APIs  
 Before using the Service Bus entity metrics REST APIs, you must obtain a management certificate and upload this certificate to your Azure subscription. For information about how to create and upload management certificates in Azure, see [Create a new self-signed certificate](/azure/cloud-services/cloud-services-certs-create) and [Upload a management certificate](/azure/azure-api-management-certs).  
  
 The Service Bus entity metrics APIs enable you to discover the data points supported for each messaging entity, and their rollup policy (aggregation as well as data retention), before you make a call to return the actual data. While each call returns a single data point in a given time precision, you can use batching to bundle multiple queries into a single REST call.  
  
## In this section  
 [Get Supported Metrics](get-supported-metrics.md)  
  
 [Get Metrics Data](get-metrics-data.md)  
  
 [Available Metrics](available-metrics.md)  
  
 [Get Metrics Rollups](get-metrics-rollups.md)  
  
 [Supported Rollups](supported-rollups.md)