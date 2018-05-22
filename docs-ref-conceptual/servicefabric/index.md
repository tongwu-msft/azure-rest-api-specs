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

- **Service Fabric Resource Manager APIs** perform resource manager operations are typically located at `management.azure.com` and have `/subscriptions/{subscriptionId}/providers/Microsoft.ServiceFabric` in the request URI. 
  
- **Service Fabric Client APIs** manage applications, services, and other elements of the Service Fabric cluster. These APIs are located directly at your cluster address, for example, `mycluster.westus.cloudapp.azure.com`.

## [Service Fabric Resource Manager APIs](sfrp-index.md)

 [Service Fabric Resource Manager APIs](sfrp-index.md) allows you to create and manage Service Fabric cluster in Azure. A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed.  Once a cluster is created, you can manage and deploy applications, services, and containers in the cluster using Service Fabric Client APIs. 

 This is a current stable version of the Service Fabric Resource Manager APIs.

### [Service Fabric Resource Manager APIs (2017-07-01-Preview Version)](sfrp-2017-07-01-preview-index.md)
This is a preview version of the Service Fabric Resource Manager APIs. In addition to managing the cluster resource, these APIs allow representing and managing applications and services resources.

## [Service Fabric Client APIs](sfclient-index.md)

Once a cluster is created, you can deploy and manage your applications, services, and containers using the [Service Fabric Client APIs](sfclient-index.md). These APIs are provided by Service Fabric runtime. They are available on all Service Fabric clusters, whether they are running in Azure, on premises, or in another cloud. This APIs are the primary way of interacting with your Service Fabric cluster to deploy, upgrade, delete, and query your applications and services. 

This is a current version of the Service Fabric Client APIs. These APIs work with Service Fabric runtime version *6.1* and above.

### Service Fabric Client APIs - Previous Versions

* [Service Fabric Client APIs (v6.1)](sfclient-v61-index.md)

* [Service Fabric Client APIs (v6.0)](sfclient-v60-index.md)
