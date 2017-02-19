---
title: "Service package"
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
ms.assetid: fa65bfc1-1eec-4afd-aa0f-2adbdc05da13
caps.latest.revision: 6
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
# Service package
APIs to manage Azure Service Fabric service packages.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to service packages:  
  
-   Replace {api-version} with the version of the REST API you are targeting. For version 1.0, use the value "1.0".  
  
-   Replace {node-name} with the name of the node in the URI.  
  
-   Replace {application-name} with the name of the application in the URI.  
  
-   Replace {service-package-name} with the name of the service package in the URI.  
  
## Tasks  
 You can do the following with service package resources:  
  
-   [Get a list of service packages](get-a-list-of-service-packages.md)  
  
-   [Get the health of a service package](get-the-health-of-a-service-package.md)  
  
-   [Get the health of a service package by using a health policy](get-the-health-of-a-service-package-by-using-a-health-policy.md)  
  
-   [Report the health of a service package](report-the-health-of-a-service-package.md)