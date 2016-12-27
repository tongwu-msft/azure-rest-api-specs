---
title: "Get the application for a service"
ms.custom: ""
ms.date: "2016-12-14"
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
ms.assetid: 
caps.latest.revision: 8
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
# Get the application for a service
Gets the name of the Service Fabric application for a service.  
  
## Request  
 See [Service](service.md) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Services/{service-id}/$/GetApplicationName?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameters|Required|Description|  
|--------------------|--------------|-----------------|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "2.0”.|  
  
## Response  
A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  

```
{
    "Id": "WordCount",
    "Name": "fabric:\\/WordCount"
}

```
  
|Element name|Description|  
|------------------|-----------------|  
|Id|The application ID.|
|Name|Name of the application.|  
  
