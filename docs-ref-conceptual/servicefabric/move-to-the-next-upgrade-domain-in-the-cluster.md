---
title: "Move to the next upgrade domain in the cluster"
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
ms.assetid: e95caa45-a7fb-4fa5-bd8d-3db9901c827d
caps.latest.revision: 18
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
# Move to the next upgrade domain in the cluster
Instructs Service Fabric to upgrade the next upgrade domain in the cluster if the current upgrade domain has been completed.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/$/MoveToNextUpgradeDomain?api-version={api-version}`|  
  
```  
{  
    "UpgradeDomain": "<value>"   
}  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|UpgradeDomain|Yes|String|The name of the next upgrade domain.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).