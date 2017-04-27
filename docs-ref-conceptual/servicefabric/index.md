---
title: "Service Fabric REST API Reference"
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
ms.assetid: 68ce493e-e3e4-435a-a730-34410545f04b
caps.latest.revision: 30
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
# Service Fabric REST API Reference
Use these APIs to manage Service Fabric clusters, applications, and services.  
  
 All task operations conform to the HTTP/1.1 protocol specification. All task operations return standard HTTP status codes and may also return additional [Status and Error Codes](status-and-error-codes1.md) in the response body. You must make sure that requests made to these resources are secure. For more information, see [Authenticating Service Fabric REST Requests](authenticating-service-fabric-rest-requests.md).  
  
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
  
 When de-serializing Service Fabric Names in a JSON request body, the following should be considered:  
  
-   " " (space) should not be converted to %20  
  
-   / should be converted to \\/  
  
 Therefore, .NET users should not convert their Service Fabric Name into a URI before deserializing it and should prefer string.  
  
 The following sample demonstrates the correct request body format for “/”:  
  
```  
POST http://localhost:19007/Applications/$/Create?api-version=1.0 HTTP/1.1  
User-Agent: Fiddler  
Host: localhost:19007  
Content-Length: 114  
Content-Type: application/json; charset=utf-8  
{"Name":"fabric:\/sample Application","TypeName":"PersistentPiEstimatorApp","TypeVersion":"1.0","ParameterList":[]}  
```  
  
-   [Service](service.md)  
  
-   [Partition](partition.md)  
  
-   [Service package](service-package.md)  
  
-   [Cluster](cluster.md)  
  
-   [Replica](replica.md)  
  
-   [Deployed application](deployed-application.md)  
  
-   [Node](node.md)  
  
-   [Code package](code-package.md)  
  
-   [Application type](application-type.md)  
  
-   [Service type](service-type.md)  
  
-   [Application](application2.md)  
  
-   [Native image store](native-image-store.md)  

-   [Image store](image-store.md)
  
## Common tasks  
 **Cluster**  
  
-   [Get a list of system services ](get-a-list-of-system-services.md)  
  
-   [Register a cluster package](register-a-cluster-package.md)  
  
 **Node**  
  
-   [Get a list of nodes](get-a-list-of-nodes.md)  
  
-   [Activate a node](activate-a-node.md)  
  
 **Deployed application**  
  
-   [Get a list of applications](get-a-list-of-applications.md)  
  
-   [Get the health of an application](get-the-health-of-an-application.md)  
  
 **Service package**  
  
-   [Get a list of services](get-a-list-of-services.md)  
  
-   [Get the health of a service](get-the-health-of-a-service.md)  
  
 **Code package**  
  
-   [Get a list of code packages](get-a-list-of-code-packages.md)  
  
 **Application type**  
  
-   [Get a list of application types](get-a-list-of-application-types.md)  
  
-   [Provision an application](provision-an-application.md)  
  
 **Service type**  
  
-   [Get a list of service types](get-a-list-of-service-types.md)  
  
 **Application**  
  
-   [Get a list of applications](get-a-list-of-applications.md)  
  
-   [Create an application](create-an-application.md)  
  
 **Service**  
  
-   [Get a list of services](get-a-list-of-services.md)  
  
-   [Create a service](create-a-service.md)  
  
 **Partition**  
  
-   [Get a list of partitions](get-a-list-of-partitions.md)  
  
-   [Get the health of a partition](get-the-health-of-a-partition.md)  
  
 **Replica**  
  
-   [Get a list of replicas](get-a-list-of-replicas.md)  
  
-   [Get the health of a replica](get-the-health-of-a-replica.md)
