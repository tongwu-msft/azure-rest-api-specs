---
title: "Create service from a template&#160;"
ms.custom: ""
ms.date: "2017-02-03"
ms.prod: "azure"
ms.reviewer: ""
ms.service: "service-fabric"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows 10"
  - "Windows 8"
  - "Windows 8.1"
  - "Windows Server 2012 R2"
dev_langs: 
  - "CSharp"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
ms.assetid: d1596a36-6eb7-451b-aea0-3f5c117ec6d9
caps.latest.revision: 15
author: "rwike77"
ms.author: "ryanwi"
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
# Create service from a template&#160;
Creates a Service Fabric service instance from a service template.  
  
## Request  
 See [Service](service.md) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServices/$/CreateFromTemplate?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|Application-name|Yes|Application under which this service is to be created|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ApplicationName|Yes|String|The application name.|  
|ServiceName|Yes|String|The service name.|  
|ServiceTypeName|Yes|String|The service type name.|  
|InitializationData|No|Array|The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).