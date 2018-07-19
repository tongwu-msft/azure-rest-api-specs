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
author: "vipulm-msft"
ms.author: "vipulm"
manager: "rajak"
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

[Service Fabric](http://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. 

[Azure Service Fabric Mesh](http://aka.ms/sfmesh) is a fully managed service, which enables developers to build and deploy microservices applications without managing any infrastructure.

Following are the main REST APIs categories:

- **Service Fabric Mesh Resource Manager APIs** allow managing microservices applications deployed in Azure Service Fabric Mesh environment through `management.azure.com`. 

- **Service Fabric Resource Manager APIs** allow managing Service Fabric cluster in Azure through `management.azure.com`.
  
- **Service Fabric Client APIs** allow managing microservices applications in a Service Fabric cluster through its  management endpoint. For example, `mycluster.westus.cloudapp.azure.com`.

## [Service Fabric Mesh Resource Manager APIs](sfmeshrp-index.md)
[Service Fabric Mesh Resource Manager APIs](sfmeshrp-index.md) allows you to create and manage microservices applications in Azure without worrying about the infrastructure powering it.

The **latest** version of [Service Fabric Mesh Resource Manager APIs](sfmeshrp-index.md) is `2018-07-01-preview`.

## [Service Fabric Resource Manager APIs](sfrp-index.md)
 [Service Fabric Resource Manager APIs](sfrp-index.md) allows you to create and manage Service Fabric clusters in Azure. A Service Fabric cluster is a network-connected set of virtual or physical machines into which your microservices are deployed and managed.

 The **latest** version of [Service Fabric Resource Manager APIs](sfrp-index.md) is `2018-02-01`. 
 
 Following are some of the other supported versions.

 * [Service Fabric Resource Manager APIs (2017-07-01-preview)](sfrp-2017-07-01-preview-index.md) -
  This preview version of the Service Fabric Resource Manager APIs allow managing microservices applications in Service Fabric clusters hosted in Azure via `management.azure.com`.

## Service Fabric Client APIs](sfclient-index.md)
Service Fabric Client APIs allow managing microservices applications in a Service Fabric cluster through its  management endpoint. These APIs are provided by Service Fabric runtime. These APIs are supported on Service Fabric clusters operating in any environment (in Azure, on premises, or in another cloud).

 The **latest** version of [Service Fabric Client APIs](sfclient-index.md) is `6.2`. 
 
 Following are some of the other supported versions.

* [Service Fabric Client APIs (v6.1)](sfclient-v61-index.md)

* [Service Fabric Client APIs (v6.0)](sfclient-v60-index.md)
