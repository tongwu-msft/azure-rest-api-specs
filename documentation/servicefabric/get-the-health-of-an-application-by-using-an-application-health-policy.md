---
title: "Get the health of an application by using an application health policy"
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
ms.assetid: 47336398-458b-45e1-98cd-28322d756853
caps.latest.revision: 13
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
# Get the health of an application by using an application health policy
Gets the health of a Service Fabric application, by using the specified health policy.  
  
## Request  
 See [Application](application2.md) for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|This URI can be used to evaluate the health of an application:<br /><br /> `<URI>/Applications/{application-name}/$/GetHealth?api-version={api-version}`|  
|POST|This URI can be used to evaluate the health of an application with events, services and deployed applications filters:<br /><br /> `<URI>/Applications/{application-name}/$/GetHealth?api-version={api-version}& EventsHealthStateFilter={ EventsHealthStateFilter}& DeployedApplicationsHealthStateFilter={ DeployedApplicationsHealthStateFilter}& ServicesHealthStateFilter={ServicesHealthStateFilter}`|  
  
-   Use {EventsHealthStateFilter} (optional) to filter the collection of HealthEvent objects reported on the application based on health state. The value can be obtained from members or bitwise operations on members of [HealthStateFilter](https://msdn.microsoft.com/en-us/library/azure/system.fabric.health.healthstatefilter.aspx). Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {DeployedApplicationsHealthStateFilter} (optional) to filter the collection of HealthEvent objects reported on applications based on health state. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
```  
{  
    "ConsiderWarningAsError": true,  
    "MaxPercentUnhealthyDeployedApplications": 10,  
    "DefaultServiceTypeHealthPolicy": {  
        "MaxPercentUnhealthyServices": 10,  
        "MaxPercentUnhealthyPartitionsPerService": 5,  
        "MaxPercentUnhealthyReplicasPerPartition": 5  
    }}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ConsiderWarningAsError|Yes|Boolean|Determines whether warnings should be treated with the same severity as errors.|  
|MaxPercentUnhealthyDeployedApplications|Yes|Number|The maximum allowed percentage of unhealthy deployed applications.|  
|DefaultServiceTypeHealthPolicy|Yes|Number|The health policy used by default to evaluate the health of a service type.|  
|MaxPercentUnhealthyServices|Yes|Number|The maximum allowed percentage of unhealthy services.|  
|MaxPercentUnhealthyPartitionsPerService|Yes|Number|The maximum allowed percentage of unhealthy partitions per service.|  
|MaxPercentUnhealthyReplicasPerPartition|Yes|Number|The maximum allowed percentage of unhealthy replicas per partition.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "HealthEvents": [  
        {  
            "SourceId": "System.CM",  
            "Property": "State",  
            "HealthState": 1,  
            "TimeToLiveInMilliSeconds": "922337203685477",  
            "Description": "Application has been created.",  
            "SequenceNumber": "114",  
            "RemoveWhenExpired": false,  
            "SourceUtcTimestamp": "130742924302425954",  
            "LastModifiedUtcTimestamp": "130742924302425954",  
            "IsExpired": false,  
            "LastOkTransitionAt": "130742924302425954",  
            "LastWarningTransitionAt": "0",  
            "LastErrorTransitionAt": "0"  
        }  
    ],  
    "AggregatedHealthState": 1,  
    "UnhealthyEvaluations": [],  
    "Name": "fabric:\\/WordCount",  
    "ServiceHealthStates": [  
        {  
            "ServiceName": "fabric:\\/WordCount\\/WordCount.WebService",  
            "AggregatedHealthState": 1  
        },  
        {  
            "ServiceName": "fabric:\\/WordCount\\/WordCount.Service",  
            "AggregatedHealthState": 1  
        }  
    ],  
    "DeployedApplicationHealthStates": [  
        {  
            "ApplicationName": "fabric:\\/WordCount",  
            "NodeName": "Node.4",  
            "AggregatedHealthState": 1  
        },  
        {  
            "ApplicationName": "fabric:\\/WordCount",  
            "NodeName": "Node.2",  
            "AggregatedHealthState": 1  
        },  
        {  
            "ApplicationName": "fabric:\\/WordCount",  
            "NodeName": "Node.3",  
            "AggregatedHealthState": 1  
        },  
        {  
            "ApplicationName": "fabric:\\/WordCount",  
            "NodeName": "Node.5",  
            "AggregatedHealthState": 1  
        }  
    ]  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|HealthEvents|The health events as an array of JSON objects.|  
|SourceId|The source of the health event as a string.|  
|Property|The property as a string.|  
|HealthState|The health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|TimeToLiveInMilliSeconds|The time for this health report to be valid in milliseconds. If not specified, time to live defaults to infinite value. To explicitly set Infinite time to live, use value “922337203685477”.|  
|Description|The health state description. The maximum string length for the description is 4096 characters.|  
|SequenceNumber|The sequence number for this health report as a numeric string. If not specified, a sequence number is auto-generated by the health client.|  
|RemoveWhenExpired|`true` to remove the health report after the time to live expires; `false` to keep the health event after the time to live expires. If not specified, it defaults to false.|  
|AggregatedHealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|UnhealthyEvaluations|The unhealthy evaluations that show why the current aggregated health state was returned by Health Manager.|  
|Description|The description of the health evaluation, which represents a summary of the evaluation process.|  
|Kind|The health evaluation kind.<br /><br /> Possible value are:<br /><br /> -   Invalid - Indicates that the health evaluation is invalid. The value is zero.<br />-   Event - Indicates that the health evaluation is for a health event. The value is 1.<br />-   Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.<br />-   Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.<br />-   DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.<br />-   DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.<br />-   Services - Indicates that the health evaluation is for services of an application. The value is 6.<br />-   Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.<br />-   Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.<br />-   SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.<br />-   UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.<br />-   UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.<br />-   Node - Indicates that the health evaluation is for a node. The value is 12.<br />-   Replica - Indicates that the health evaluation is for a replica. The value is 13.<br />-   Partition - Indicates that the health evaluation is for a partition. The value is 14.<br />-   Service - Indicates that the health evaluation is for a service. The value is 15.<br />-   DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.<br />-   DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.<br />-   Application - Indicates that the health evaluation is for an application. The value is 18.<br />-   DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.<br />-   UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.<br />-   ApplicationTypeApplications – Indicates that the health evaluation is for applications of an application type. The value is 21.|  
|AggregatedHealthState|The aggregated health state of this unhealthy evaluation.Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|Name|The application name.|  
|ServiceHealthStates|The default parameter list as an array of key/value pair strings.|  
|ServiceName|The service name.|  
|AggregatedHealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|DeployedApplicationHealthStates|The deployed application health states.|  
|ApplicationName|The application name.|  
|NodeName|The node name.|  
|AggregatedHealthState|The aggregated health state of the deployed application.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|