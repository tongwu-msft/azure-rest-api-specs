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

[Azure Service Fabric Mesh](http://aka.ms/sfmesh) is a fully managed service which enables developers to build and deploy mission critical applications without managing any infrastructure. Use Service Fabric Mesh to build and run secure, distributed microservices applications that scale on demand. 

Following are the main REST APIs categories:

- **Service Fabric Mesh Resource Manager APIs** perform resource manager operations to manage microservices applications deployed in Azure Service Fabric Mesh environment through `management.azure.com`. 

- **Service Fabric Resource Manager APIs** perform resource manager operations on Service Fabric cluster, application, service, and container resources through `management.azure.com`. 
  
- **Service Fabric Client APIs** manage applications, services, and other elements of the Service Fabric cluster. These APIs are located directly at your cluster address, for example, `mycluster.westus.cloudapp.azure.com`.

## [Service Fabric Mesh Resource Manager APIs](sfmeshrp-index.md)
[Service Fabric Mesh Resource Manager APIs](sfmeshrp-index.md) allows you to create and manage microservices applications in Azure without worrying about the infrastructure powering it.

This is a current preview version (2018-07-01-preview) of the Service Fabric Mesh Resource Manager APIs.

## [Service Fabric Resource Manager APIs](sfrp-index.md)
 [Service Fabric Resource Manager APIs](sfrp-index.md) allows you to create and manage Service Fabric clusters in Azure. A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed.

 This is a current stable version of the Service Fabric Resource Manager APIs.

### Service Fabric Resource Manager APIs - Other Versions
 * [Service Fabric Resource Manager APIs (2017-07-01-Preview Version)](sfrp-2017-07-01-preview-index.md)
This is a preview version of the Service Fabric Resource Manager APIs. These APIs allow representing and managing application, service, and container resources.

## Service Fabric Client APIs](sfclient-index.md)

Once a cluster is created, you can deploy and manage your applications, services, and containers using the [Service Fabric Client APIs](sfclient-index.md). These APIs are provided by Service Fabric runtime. They are available on all Service Fabric clusters, whether they are running in Azure, on premises, or in another cloud. This APIs are the primary way of interacting with your Service Fabric cluster to deploy, upgrade, delete, and query your applications and services. 

This is a current version of the Service Fabric Client APIs. These APIs work with Service Fabric runtime version *6.1* and above.

### Service Fabric Client APIs - Previous Versions

* [Service Fabric Client APIs (v6.1)](sfclient-v61-index.md)

* [Service Fabric Client APIs (v6.0)](sfclient-v60-index.md)
