---
title: "Deployed application"
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
ms.assetid: eaa298f8-4335-4af5-9b46-1d6e2d92e7ed
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
# Deployed application
APIs to manage Azure Service Fabric applications.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to deployed applications:  
  
-   Replace {api-version} with the version of the REST API you are targeting. For version 1.0, use the value "1.0".  
  
-   Replace {node-name} with the name of the node in the URI.  
  
-   Replace {application-name} with the name of the application in the URI.  
  
## Tasks  
 You can do the following with deployed application resources:  
  
-   [Get a list of deployed applications on a node](get-a-list-of-deployed-applications-on-a-node.md)  
  
-   [Get the health of a deployed application](get-the-health-of-a-deployed-application.md)  
  
-   [Get the health of a deployed application by using a health policy](get-the-health-of-a-deployed-application-by-using-a-health-policy.md)  
  
-   [Report the health of a deployed application](report-the-health-of-a-deployed-application.md)