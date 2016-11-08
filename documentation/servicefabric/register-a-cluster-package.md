---
title: "Register a cluster package"
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
ms.assetid: e9dbbbbd-c80f-4f6f-bb60-2066c1bd174a
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
# Register a cluster package
Provision or register a Service Fabric cluster package in the ImageStore.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/$/Provision?api-version={api-version}`|  
  
 Use the following headers:  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|CodeFilePath|At least one of CodeFilePath or ClusterManifestFilePath should be provided|String|The path to the cluster package.|  
|ClusterManifestFilePath|At least one of CodeFilePath or ClusterManifestFilePath should be provided|String|The path to the cluster manifest.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).