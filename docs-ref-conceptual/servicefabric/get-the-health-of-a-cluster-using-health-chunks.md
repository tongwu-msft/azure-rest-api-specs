---
title: "Get the health of a cluster using health chunks"
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
ms.assetid: 683c4861-f86d-4539-83b2-a566537b9577
caps.latest.revision: 4
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
# Get the health of a cluster using health chunks
Gets the health of a Service Fabric cluster using health chunks.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI gets the cluster health chunk: \<URI>$/GetClusterHealthChunk?api-version={api-version}|  
  
### Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md)  
  
```  
{  
    "HealthState": 1,  
    "NodeHealthStateChunks":  
    {  
        "TotalCount": 0,  
        "Items":  
        [  
        ]  
    },  
    "ApplicationHealthStateChunks":  
    {  
        "TotalCount": 0,  
        "Items":  
        [  
        ]  
    }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|HealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|NodeHealthStateChunks|The node health state chunk list as an object that contains an array of node health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of node health state chunks that respect query input filters.|  
|Items|The node health state chunks as JSON list.|  
|NodeName|The node name.|  
|HealthState|The node aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ApplicationHealthStateChunks|The application health state chunk list as an object that contains an array of application health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of application health state chunks that respect query input filters.|  
|Items|The application health state chunks as JSON list.|  
|ApplicationName|The application name.|  
|ApplicationTypeName|The application type.|  
|HealthState|The application aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ServiceHealthStateChunks|The service health state chunk list as an object that contains an array of service health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of service health state chunks that respect query input filters.|  
|Items|The service health state chunks as JSON list.|  
|ServiceName|The service name.|  
|HealthState|The service aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|PartitionHealthStateChunks|The partition health state chunk list as an object that contains an array of partition health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of partition health state chunks that respect query input filters.|  
|Items|The partition health state chunks as JSON list.|  
|PartitionId|Guid that represents the partition id.|  
|HealthState|The partition aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ReplicaHealthStateChunks|The replica health state chunk list as an object that contains an array of replica health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of replica health state chunks that respect query input filters.|  
|Items|The replica health state chunks as JSON list.|  
|ReplicaOrInstanceId|The stateful service replica id or stateless service instance id.|  
|HealthState|The replica or instance aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|DeployedApplicationHealthStateChunks|The deployed application health state chunk list as an object that contains an array of deployed application health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of deployed application health state chunks that respect query input filters.|  
|Items|The deployed application health state chunks as JSON list.|  
|NodeName|The node where the application is deployed.|  
|HealthState|The deployed application aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|DeployedServicePackageHealthStateChunks|The deployed service package health state chunk list as an object that contains an array of deployed service package health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of deployed service package health state chunks that respect query input filters.|  
|Items|The deployed service package health state chunks as JSON list.|  
|ServiceManifestName|The service manifest name of the deployed service package.|  
|HealthState|The deployed service package aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|Element name|Description|  
|HealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|NodeHealthStateChunks|The node health state chunk list as an object that contains an array of node health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of node health state chunks that respect query input filters.|  
|Items|The node health state chunks as JSON list.|  
|ApplicationHealthStateChunks|The application health state chunk list as an object that contains an array of application health state chunks as JSON objects and the total count.|  
|TotalCount|The total number of application health state chunks that respect query input filters.|  
|Items|The application health state chunks as JSON list.|