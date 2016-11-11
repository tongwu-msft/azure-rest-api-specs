---
title: "Upgrade a cluster"
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
ms.assetid: bae02356-eebd-4dc8-be8a-a03d47673b97
caps.latest.revision: 22
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
# Upgrade a cluster
Upgrade a Service Fabric cluster.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/$/Upgrade?api-version={api-version}`|  
  
```  
{  
    "ConfigVersion": "<value>",  
    "CodeVersion": "<value>",  
    "UpgradeKind": <value>,  
    "RollingUpgradeMode": <value>,  
    "UpgradeReplicaSetCheckTimeoutInSeconds": <value>,  
    "ForceRestart": false|true,  
    "EnableDeltaHealthEvaluation": false|true,  
    "MonitoringPolicy": { },  
    "ClusterHealthPolicy": { },  
    "ClusterUpgradeHealthPolicy": { },  
    "ApplicationHealthPolicyMap": { }  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|ConfigVersion|At least one of ConfigVersion or CodeVersion should be provided|String|1.0|The configuration version (specified in the cluster manifest).|  
|CodeVersion|At least one of ConfigVersion or CodeVersion should be provided|String|1.0|The version of the cluster package.|  
|UpgradeKind|Yes|Number|1.0|The kind of upgrade. <br />Possible values are:<br /><br /> -   Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Rolling - Indicates that this is a rolling upgrade. The value is 1.|  
|RollingUpgradeMode|Yes|Number|1.0|The type of rolling upgrade when upgrading a cluster.Possible values are:<br /><br /> -   Invalid - Indicates the rolling upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   UnmonitoredAuto - Specifies that the upgrade should be unmonitored automatic. The value is 1.<br />-   UnmonitoredManual - Specifies that the upgrade should be unmonitored manual. The value is 2.<br />-   Monitored - Specifies that the upgrade should be monitored automatic. The value is 3.|  
|UpgradeReplicaSetCheckTimeoutInSeconds|No|Number||The maximum amount of time the system will block on replica set safety checks before continuing to process the upgrade regardless.|  
|ForceRestart|No|Boolean|1.0|The value is `true` to force a restart of each node during the upgrade process even for configuration upgrades; `false` to not force a restart of any nodes unless needed.|  
|EnableDeltaHealthEvaluation|No|Boolean|1.0|When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.|  
|MonitoringPolicy|No|Object|1.0|A monitoring policy object to describe the monitoring to perform on the upgrade process.|  
|ClusterUpgradeHealthPolicy|No|Object|1.0|Contains parameters for use when delta health evaluation is enabled.|  
|ApplicationHealthPolicyMap|No|Object|1.0|Contains custom application health policies for specified applications.|  
  
### MonitoringPolicy  
  
```  
{   
        "FailureAction": <value>,   
        "HealthCheckWaitDurationInMilliseconds": "<value>",   
        "HealthCheckStableDurationInMilliseconds": "<value>",   
        "HealthCheckRetryTimeoutInMilliseconds": "<value>",  
        "UpgradeTimeoutInMilliseconds": "<value>",  
        "UpgradeDomainTimeoutInMilliseconds": "<value>"  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|FailureAction|No|Number|1.0|The actions for Service Fabric to take if the upgrade fails. Possible values are:<br /><br /> -   Invalid - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Rollback - Indicates that a rollback of the upgrade will be performed by Service Fabric if the upgrade fails. The value is 1.<br />-   Manual - Indicates that a manual repair will need to be performed by the administrator if the upgrade fails. Service Fabric will not proceed to the next upgrade domain automatically. The value is 2.|  
|HealthCheckWaitDurationInMilliseconds|No|String|1.0|A health check wait duration as measured in milliseconds.|  
|HealthCheckStableDurationInMilliseconds|No|String|1.0|A health check stable duration as measured in milliseconds.|  
|HealthCheckRetryTimeoutInMilliseconds|No|String|1.0|A health check retry timeout as measured in milliseconds.|  
|UpgradeTimeoutInMilliseconds|No|String|1.0|An upgrade timeout as measured in milliseconds.|  
|UpgradeDomainTimeoutInMilliseconds|No|String|1.0|An upgrade domain timeout in milliseconds|  
  
### ClusterHealthPolicy  
  
```  
{  
        "ConsiderWarningAsError": false|true,  
        "MaxPercentUnhealthyNodes": <value>,  
        "MaxPercentUnhealthyApplications": <value>  
        "ApplicationTypeHealthPolicyMap":[{"Key":"<value>","Value":<value>}]}  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|ConsiderWarningAsError|No|Boolean|1.0|Value of `true` to treat warnings as errors; `false` to not treat warnings as errors.|  
|MaxPercentUnhealthyNodes|No|Number|1.0|The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10.|  
|MaxPercentUnhealthyApplications|No|Number|1.0|The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10.|  
|ApplicationTypeHealthPolicyMap|No|Object|2.0|Specifies the map that defines the maximum percentage of unhealthy applications that are allowed per application type. Application types in this map are evaluated using specific percentages rather than the global *MaxPercentUnhealthyApplications* percentage.  For example, if some applications of a type are critical, the cluster administrator can add an entry to the map for that application type and assign it a value of 0% (that is, do not tolerate any failures). All other applications can be evaluated with *MaxPercentUnhealthyApplications* set to 20% to tolerate some failures out of the thousands of application instances. The application type health policy map is used only if the cluster manifest enables application type health evaluation using the configuration entry for **HealthManager/EnableApplicationTypeHealthEvaluation**.|  
  
### ClusterUpgradeHealthPolicy  
  
```  
{  
	 “MaxPercentDeltaUnhealthyNodes": <value>,  
 “MaxPercentUpgradeDomainDeltaUnhealthyNodes":<value>,  
}  
  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|MaxPercentDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of overall unhealthy nodes during upgrade when delta evaluation is enabled.|  
|MaxPercentUpgradeDomainDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of unhealthy nodes per upgrade domain during upgrade when delta evaluation is enabled.|  
  
### ApplicationHealthPolicyMap  
  
```  
{  
    "ApplicationHealthPolicyMap":  
    [{  
        "Key":  “<value>”,  
        "Value": <value>  
    }]  
}  
```  
  
-   "Key” represents the Application name used to identify the application.  
  
-   "Value” represents the application health policy for specified application. The ApplicationHealthPolicy fields are:  
  
```  
{  
    "ConsiderWarningAsError": false|true,  
    "MaxPercentUnhealthyDeployedApplications": <value>,  
    "DefaultServiceTypeHealthPolicy":  
    {  
        "MaxPercentUnhealthyServices": <value>,  
        "MaxPercentUnhealthyPartitionsPerService": <value>,  
        "MaxPercentUnhealthyReplicasPerPartition": <value>  
    },  
    "ServiceTypeHealthPolicyMap":   
    [{  
        "Key":"value",  
        "Value":  
        {  
            "MaxPercentUnhealthyServices": <value>,  
            "MaxPercentUnhealthyPartitionsPerService": <value>,  
            "MaxPercentUnhealthyReplicasPerPartition": <value>  
        }  
    }]  
}  
  
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