---
title: "HealthEvaluationKind"
ms.date: "2018-01-22"
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
---
# HealthEvaluationKind enum

type: string

The health manager in the cluster performs health evaluations in determining the aggregated health state of an entity. This enumeration provides information on the kind of evaluation that was performed. Following are the possible values.

Possible values are: 

  - Invalid - Indicates that the health evaluation is invalid. The value is zero.
  - Event - Indicates that the health evaluation is for a health event. The value is 1.
  - Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.
  - Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.
  - DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.
  - DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.
  - Services - Indicates that the health evaluation is for services of an application. The value is 6.
  - Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.
  - Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.
  - SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.
  - UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.
  - UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.
  - Replica - Indicates that the health evaluation is for a replica. The value is 13.
  - Partition - Indicates that the health evaluation is for a partition. The value is 14.
  - DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.
  - DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.
  - Service - Indicates that the health evaluation is for a service. The value is 15.
  - Node - Indicates that the health evaluation is for a node. The value is 12.
  - Application - Indicates that the health evaluation is for an application. The value is 18.
  - DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.
  - UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.
  - ApplicationTypeApplications - – Indicates that the health evaluation is for applications of an application type. The value is 21.

