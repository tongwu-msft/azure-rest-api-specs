---
title: "Service Fabric REST API Reference"
ms.date: "2017-04-26"
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


# Service Fabric REST Client API Reference

[Service Fabric](http://aka.ms/ServiceFabric) is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices. Service Fabric also addresses the significant challenges in developing and managing cloud applications. Developers and administrators can avoid complex infrastructure problems and focus on implementing mission-critical, demanding workloads that are scalable, reliable, and manageable. Service Fabric represents the next-generation middleware platform for building and managing these enterprise-class, tier-1, cloud-scale applications.

This document provides a reference of REST APIs to manager Service Fabric cluster, applications and services.

All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](status-and-error-codes.md) in the response body. See [Service Fabric Names and JSON Serialization](service-fabric-names-and-json-serialization.md) for special considerations when serializing and de-serializing names and identities of various entities such as nodes, applications, services, partitions and replicas in the Service Fabric cluster, to and from request and response. You must make sure that requests and responses are secure. For more information, see [Authenticating Service Fabric REST Requests](authenticating-service-fabric-rest-requests.md). 

 To connect to the local development cluster, you must use the correct URI with the correct client connection port, identified by {connection-port} in the URIs listed below. The client connection port is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 Though the examples show http, both http and https protocols are supported by Service Fabric. The protocol is specified by HttpGatewayEndpoint in the cluster manifest file.  
  
 To connect to the local development cluster, use the following URI:  
  
```  
http://localhost:{connection-port}  
```  
  
 To connect to a cluster by fully-qualified domain name, use a URI similar to the following:  
  
```  
http://MyCluster.cloudapp.net:{connection-port}  
```  
  
 To connect to a cluster by IP address, use a URI similar to the following:  
  
```  
http://65.52.117.43:{connection-port}  
```  

Following is a list of Service Fabric REST Client APIs.

# [Cluster](Cluster.md)

## [Get Cluster Manifest](get-cluster-manifest.md)
## [Get Cluster Health](get-cluster-health.md)
## [Get Cluster Health Using Policy](get-cluster-health-using-policy.md)
## [Report Cluster Health](report-cluster-health.md)
## [Get Provisioned Fabric Code Version Info List](get-provisioned-fabric-code-version-info-list.md)
## [Get Provisioned Fabric Config Version Info List](get-provisioned-fabric-config-version-info-list.md)
## [Get Cluster Upgrade Progress](get-cluster-upgrade-progress.md)
## [Get Aad Metadata](get-aad-metadata.md)

# [Node](Node.md)

## [Get Node Info List](get-node-info-list.md)
## [Get Node Info](get-node-info.md)
## [Get Node Health](get-node-health.md)
## [Get Node Health Using Policy](get-node-health-using-policy.md)
## [Report Node Health](report-node-health.md)
## [Get Node Load Info](get-node-load-info.md)
## [Disable Node](disable-node.md)
## [Enable Node](enable-node.md)
## [Remove Node State](remove-node-state.md)
## [Start Node](start-node.md)
## [Stop Node](stop-node.md)
## [Restart Node](restart-node.md)

# [ApplicationType](ApplicationType.md)

## [Get Application Type Info List](get-application-type-info-list.md)
## [Get Application Type Info List By Name](get-application-type-info-list-by-name.md)
## [Register Application Type](register-application-type.md)
## [Unregister Application Type](unregister-application-type.md)
## [Get Application Manifest](get-application-manifest.md)

# [ServiceType](ServiceType.md)

## [Get Service Type Info List](get-service-type-info-list.md)
## [Get Service Manifest](get-service-manifest.md)
## [Get Deployed Service Type Info List](get-deployed-service-type-info-list.md)
## [Get Deployed Service Type Info By Name](get-deployed-service-type-info-by-name.md)

# [Application](Application.md)

## [Create Application](create-application.md)
## [Delete Application](delete-application.md)
## [Get Application Info List](get-application-info-list.md)
## [Get Application Info](get-application-info.md)
## [Get Application Health](get-application-health.md)
## [Get Application Health Using Policy](get-application-health-using-policy.md)
## [Report Application Health](report-application-health.md)
## [Start Application Upgrade](start-application-upgrade.md)
## [Get Application Upgrade](get-application-upgrade.md)
## [Get Deployed Application Info List](get-deployed-application-info-list.md)
## [Get Deployed Application Info](get-deployed-application-info.md)
## [Get Deployed Application Health](get-deployed-application-health.md)
## [Get Deployed Application Health Using Policy](get-deployed-application-health-using-policy.md)
## [Report Deployed Application Health](report-deployed-application-health.md)

# [Service](Service.md)

## [Get Service Info List](get-service-info-list.md)
## [Get Application Name Info](get-application-name-info.md)
## [Create Service](create-service.md)
## [Create Service From Template](create-service-from-template.md)
## [Delete Service](delete-service.md)
## [Update Service](update-service.md)
## [Get Service Description](get-service-description.md)
## [Get Service Health](get-service-health.md)
## [Get Service Health Using Policy](get-service-health-using-policy.md)
## [Report Service Health](report-service-health.md)
## [Resolve Service](resolve-service.md)
## [Get Partition Info List](get-partition-info-list.md)

# [Partition](Partition.md)

## [Get Partition Info List](get-partition-info-list.md)
## [Get Partition Info](get-partition-info.md)
## [Get Service Name Info](get-service-name-info.md)
## [Get Partition Health](get-partition-health.md)
## [Get Partition Health Using Policy](get-partition-health-using-policy.md)
## [Report Partition Health](report-partition-health.md)
## [Get Partition Load Information](get-partition-load-information.md)
## [Recover Partition](recover-partition.md)
## [Recover Service Partitions](recover-service-partitions.md)
## [Recover System Partitions](recover-system-partitions.md)
## [Recover All Partitions](recover-all-partitions.md)

# [Replica](Replica.md)

## [Get Replica Info List](get-replica-info-list.md)
## [Get Replica Health](get-replica-health.md)
## [Get Replica Health Using Policy](get-replica-health-using-policy.md)
## [Report Replica Health](report-replica-health.md)
## [Get Deployed Service Replica Info List](get-deployed-service-replica-info-list.md)
## [Get Deployed Service Replica Detail Info](get-deployed-service-replica-detail-info.md)
## [Restart Replica](restart-replica.md)
## [Remove Replica](remove-replica.md)

# [Service Package](Service-Package.md)

## [Get Deployed Service Package Info List](get-deployed-service-package-info-list.md)
## [Get Deployed Service Package Info List By Name](get-deployed-service-package-info-list-by-name.md)
## [Get Deployed Service Package Health](get-deployed-service-package-health.md)
## [Get Deployed Service Package Health Using Policy](get-deployed-service-package-health-using-policy.md)
## [Report Deployed Service Package Health](report-deployed-service-package-health.md)

# [Code Package](Code-Package.md)

## [Get Deployed Code Package Info List](get-deployed-code-package-info-list.md)
## [Restart Deployed Code Package](restart-deployed-code-package.md)

# [Compose Deployment](Compose-Deployment.md)

## [Create Compose Application](create-compose-application.md)
## [Get Compose Application Status](get-compose-application-status.md)
## [Get Compose Application Status List](get-compose-application-status-list.md)
## [Remove Compose Application](remove-compose-application.md)

# [Chaos](Chaos.md)

## [Start Chaos](start-chaos.md)
## [Stop Chaos](stop-chaos.md)
## [Get Chaos Report](get-chaos-report.md)

# [ImageStore](ImageStore.md)

## [Upload File](upload-file.md)
## [Get Image Store Content](get-image-store-content.md)
## [Delete Image Store Content](delete-image-store-content.md)
## [Get Image Store Root Content](get-image-store-root-content.md)
## [Copy Image Store Content](copy-image-store-content.md)

# [Infrastructure](Infrastructure.md)

## [Invoke Infrastructure Command](invoke-infrastructure-command.md)
## [Invoke Infrastructure Query](invoke-infrastructure-query.md)

