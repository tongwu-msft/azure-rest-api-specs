---
title: "Service Fabric REST APIs"
ms.date: "2017-04-23"
ms.prod: "azure"
ms.service: "service-fabric"
ms.topic: "reference"
applies_to: 
  - "Azure"
  - "Windows Server 2012 R2"
  - "Windows Server 2016"
dev_langs: 
  - "rest-api"
helpviewer_keywords: 
  - "Service Fabric REST API Reference"
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
service_description: To be added
---

# Service Fabric REST APIs

[Service Fabric](http://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. Service Fabric also addresses the significant challenges in developing and managing cloud applications. Developers and administrators can avoid complex infrastructure problems and focus on implementing mission-critical, demanding workloads that are scalable, reliable, and manageable. Service Fabric represents the next-generation middleware platform for building and managing these enterprise-class, tier-1, cloud-scale applications.

The REST APIs fall into two main categories:

  - **Service Fabric Resource Manager**: APIs that perform resource manager operations are typically located at `management.azure.com` and include some form of the following in the request URI: `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabric`. 
  
  - **Service Fabric Client**: APIs that manage applications, services, and elements of the cluster itself are located directly at your cluster address, e.g., `mycluster.westus.cloudapp.azure.com`.  

## [Service Fabric Resource Manager APIs](sfrp-index.md)

 [Service Fabric Resource Manager APIs](sfrp-index.md) allows you to create and manage Service Fabric cluster in Azure. A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed.  Once a cluster is created you can manage and deploy applications, services and containers in the cluster using Service Fabric Client APIs. 

## [Service Fabric Client APIs](sfclient-index.md)

Once a cluster is created you can deploy and manage your applications, services, and containers using the [Service Fabric Client APIs](sfclient-index.md). These APIs are provided by Service Fabric itself and are always available anywhere Service Fabric runs, whether that's in Azure, on-premises, or another cloud. This API is the primary way of interacting with your Service Fabric cluster to deploy, upgrade, delete, and query your applications and services. 
