---
title: "Create service group from a template"
ms.custom: ""
ms.date: "2016-03-30"
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
ms.assetid: 3eade9ef-a15c-4146-ad7d-9b7b62de5b46
caps.latest.revision: 3
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
# Create service group from a template
Creates a Service Fabric service group instance from a service template.  
  
## Request  
 See [Common parameters and headers](../ServiceFabricREST/service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServiceGroups/$/CreateServiceGroupFromTemplate?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|Application-name|Yes|Application under which this servicegroup is to be created|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ApplicationName|Yes|String|The application name.|  
|ServiceName|Yes|String|The service name.|  
|ServiceTypeName|Yes|String|The service type name.|  
|InitializationData|Yes|Array|The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).