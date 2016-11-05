---
title: "Partition"
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
ms.assetid: 02f920e8-2c2d-46e6-859f-2ede5c900415
caps.latest.revision: 7
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
# Partition
APIs to manage Azure Service Fabric partitions.  
  
##  <a name="bk_common"></a> Common parameters and headers  
 The following information is common to all tasks that you might do related to partitions:  
  
-   Replace {api-version} with the version of the REST API you are targeting. For version 1.0, use the value "1.0".  
  
-   Replace {application-name} with the name of the application in the URI.  
  
-   Replace {service-name} with the name of the service in the URI.  
  
-   Replace {partition-id} with the partition ID in the URI.  
  
## Tasks  
 You can do the following with partition resources:  
  
-   [Get a list of partitions](../ServiceFabricREST/get-a-list-of-partitions.md)  
  
-   [Get the health of a partition](../ServiceFabricREST/get-the-health-of-a-partition.md)  
  
-   [Get the health of a partition by using a health policy](../ServiceFabricREST/get-the-health-of-a-partition-by-using-a-health-policy.md)  
  
-   [Report the health of a partition](../ServiceFabricREST/report-the-health-of-a-partition.md)  
  
-   [Recover a partition from quorum loss state](../ServiceFabricREST/recover-a-partition-from-quorum-loss-state.md)  
  
-   [Get the load of a partition](../ServiceFabricREST/get-the-load-of-a-partition.md)  
  
-   [Reset the load of a partition](../ServiceFabricREST/reset-the-load-of-a-partition.md)