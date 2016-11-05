---
title: "Unregister a cluster package"
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
ms.assetid: 133f84ec-ccd6-4822-abec-7e22bb14cb70
caps.latest.revision: 16
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
# Unregister a cluster package
Remove or unregister a Service Fabric cluster package from the ImageStore.  
  
## Request  
 See [Cluster](../ServiceFabricREST/cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/$/Unprovision?api-version={api-version}`|  
  
 Use the following headers:  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|CodeVersion|At least one of CodeVersion or ConfigVersion should be provided|String|The version of the cluster package.|  
|ConfigVersion|At least one of CodeVersion or ConfigVersion should be provided|String|The configuration version (specified in the cluster manifest).|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).