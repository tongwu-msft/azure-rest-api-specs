---
title: "Replica"
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
ms.assetid: b607b235-d1cd-4350-aca5-21924475f6ad
caps.latest.revision: 9
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
# Replica
APIs to list replicas and report on replica health.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to replicas:  
  
-   Replace {api-version} with the version of the REST API you are targeting. For version 1.0, use the value "1.0". For 2.0, use "2.0"  
  
-   Replace {application-name} with the name of your application in the URI.  
  
-   Replace {service-name} with the name of your service in the URI.  
  
-   Replace {partition-id} with the partition ID in the URI.  
  
-   Replace {replica-id} with the replica ID in the URI.  
  
-   Replace {node-name} with the name of the node in the URI.  
  
## Tasks  
 You can do the following with replica resources:  
  
-   [Get a list of replicas](get-a-list-of-replicas.md)  
  
-   [Get a list of replicas for a service package](get-a-list-of-replicas-for-a-service-package.md)  
  
-   [Get details of a deployed replica’s status](get-details-of-a-deployed-replica’s-status.md)  
  
-   [Get the health of a replica](get-the-health-of-a-replica.md)  
  
-   [Get the health of a replica by using a health policy](get-the-health-of-a-replica-by-using-a-health-policy.md)  
  
-   [Report the health of a replica](report-the-health-of-a-replica.md)  
  
-   [Get the load of a replica](get-the-load-of-a-replica.md)