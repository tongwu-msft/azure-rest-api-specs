---
title: "Get the progress of a cluster upgrade&#160;"
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
ms.assetid: cf7b4376-56c3-4d9c-8574-8e2a21b50cde
caps.latest.revision: 19
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
# Get the progress of a cluster upgrade&#160;
Get the upgrade progress of the Service Fabric cluster.  
  
## Request  
 See [Cluster](cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/$/GetUpgradeProgress?api-version=1.0`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "CodeVersion": "<value>",  
    "ConfigVersion": "<value>",  
    "UpgradeDomains": [],  
    "UpgradeState": value,  
    "NextUpgradeDomain": "<value>",  
    "RollingUpgradeMode": value,  
    "UpgradeDescription": value,  
    "UpgradeDurationInMilliseconds": "value",  
    "UpgradeDomainDurationInMilliseconds": "value",  
    "UnhealthyEvaluations": [],  
    "CurrentUpgradeDomainProgress": {  
        "DomainName": "<value>",  
        "NodeUpgradeProgressList": []  
    },  
    "StartTimestampUtc": "<value>",  
    "FailureTimestampUtc": "<value>",  
    "FailureReason": value,  
    "UpgradeDomainProgressAtFailure": {  
        "DomainName": "<value>",  
        "NodeUpgradeProgressList": []  
    }  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|CodeVersion|The version of the cluster package.|  
|ConfigVersion|The configuration version (specified in the cluster manifest).|  
|UpgradeState|the upgrade state. The upgrade state value is 0 for invalid, 1 for rollback in progress, 2 for rollback completed, 3 for rollforward pending, 4 for rollforward in progress, 5 for rollforward completed.|  
|UpgradeDomains|Upgrade domain status values.|  
|NextUpgradeDomain|The name of the upgrade domain that will be upgraded next.|  
|RollingUpgradeMode|The rolling upgrade mode. <br />Possible values are:<br /><br /> -   Invalid - Indicates the rolling upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   UnmonitoredAuto - Specifies that the upgrade should be unmonitored automatic. The value is 1.<br />-   UnmonitoredManual - Specifies that the upgrade should be unmonitored manual. The value is 2.<br />-   Monitored - Specifies that the upgrade should be monitored automatic. The value is 3.|  
|UpgradeDurationInMilliseconds|The estimated elapsed time spent processing the current overall upgrade.|  
|UpgradeDomainDurationInMilliseconds|The estimated elapsed time spent processing the current upgrade domain.|  
|UnhealthyEvaluations|The health evaluations describe the health data used by health manager to evaluate cluster health. Only populated when the cluster’s aggregated health state is Error. When the upgrade rolls back because of a health evaluation, it provides a snapshot view of the health at the time the health check was performed.|  
|Description|The description of the health evaluation, which represents a summary of the evaluation process.|  
|Kind|The health evaluation kind. <br />Possible value are:<br /><br /> -   Invalid - Indicates that the health evaluation is invalid. The value is zero.<br />-   Event - Indicates that the health evaluation is for a health event. The value is 1.<br />-   Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.<br />-   Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.<br />-   DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.<br />-   DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.<br />-   Services - Indicates that the health evaluation is for services of an application. The value is 6.<br />-   Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.<br />-   Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.<br />-   SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.<br />-   UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.<br />-   UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.<br />-   Node - Indicates that the health evaluation is for a node. The value is 12.<br />-   Replica - Indicates that the health evaluation is for a replica. The value is 13.<br />-   Partition - Indicates that the health evaluation is for a partition. The value is 14.<br />-   Service - Indicates that the health evaluation is for a service. The value is 15.<br />-   DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.<br />-   DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.<br />-   Application - Indicates that the health evaluation is for an application. The value is 18.<br />-   DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.<br />-   UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.<br />-   ApplicationTypeApplications – Indicates that the health evaluation is for applications of an application type. The value is 21.|  
|AggregatedHealthState|The aggregated health state of this unhealthy evaluation. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|CurrentUpgradeDomainProgress|The detailed upgrade progress for nodes in the current upgrade domain.|  
|StartTimestampUtc|The start time of the upgrade.|  
|FailureTimestampUtc|The failure time of the upgrade.|  
|NodeUpgradeProgressList|The node progress list.|  
|NodeName|The node name.|  
|UpgradePhase|The upgrade phase. <br />Possible values are:<br /><br /> -   Invalid - Indicates that the node upgrade phase is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   PreUpgradeSafetyCheck - Indicates that upgrade has not started on the node and Service Fabric is performing pre-upgrade safety checks. The value is 1.<br />-   Upgrading -Indicates that the node is in the process of getting upgraded.  The value is 2.<br />-   PostUpgradeSafetyCheck - Indicates that upgrade is complete on the node and Service Fabric is performing post-upgrade safety checks. The value is 3.|  
|PendingSafetyChecks|The pending safety checks.|  
|Kind|The type of the safety check. <br />Possible values are:<br /><br /> -   Invalid - Indicates that the upgrade safety check kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   EnsureSeedNodeQuorum - Indicates that if we bring down the node then this will result in global seed node quorum loss. The value is 1.<br />-   EnsurePartitionQuorum - Indicates that there is some partition for which if we bring down the replica on the node, it will result in quorum loss for that partition. The value is 2.<br />-   WaitForPrimaryPlacement - Indicates that there is some replica on the node that was moved out of this node due to upgrade. Service Fabric is now waiting for the primary to be moved back to this node. The value is 3.<br />-   WaitForPrimarySwap - Indicates that Service Fabric is waiting for a primary replica to be moved out of the node before starting upgrade on that node. The value is 4.<br />-   WaitForReconfiguration - Indicates that there is some replica on the node that is involved in a reconfiguration. Service Fabric is waiting for the reconfiguration to be complete before staring upgrade on that node. The value is 5.<br />-   WaitForInbuildReplica - Indicates that there is either a replica on the node that is going through copy, or there is a primary replica on the node that is copying data to some other replica. In both cases, bringing down the replica on the node due to upgrade will abort the copy. The value is 6.<br />-   EnsureAvailability - Indicates that there is either a stateless service partition on the node having exactly one instance, or there is a primary replica on the node for which the partition is quorum loss. In both cases, bringing down the replicas due to upgrade will result in loss of availability. The value is 7.|  
|FailureReason|The failure reason. <br />Possible value are:<br /><br /> -   None - Indicates there was no upgrade failure. The value is zero.<br />-   Interrupted- Indicates the upgrade was interrupted by another upgrade request or a rollback request. The value is 1.<br />-   HealthCheck - Indicates the upgrade failed because of a failed health check. The value is 2.<br />-   UpgradeDomainTimeout - Indicates the upgrade domain timed out. The value is 3.<br />-   OverallUpgradeTimeout - Indicates there was an overall upgrade timeout. The value is 4.|  
|UpgradeDomainProgressAtFailure|The detailed upgrade progress for nodes in the current upgrade domain at the point of failure.|  
|DomainName|The domain name.|  
|NodeUpgradeProgressList|The node progress list.|  
|NodeName|The node name.|  
|UpgradePhase|The upgrade phase. <br />Possible values are:<br /><br /> -   Invalid - Indicates that the node upgrade phase is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   PreUpgradeSafetyCheck - Indicates that upgrade has not started on the node and Service Fabric is performing pre-upgrade safety checks. The value is 1.<br />-   Upgrading - Indicates that the node is in the process of getting upgraded. The value is 2.<br />-   PostUpgradeSafetyCheck - Indicates that upgrade is complete on the node and Service Fabric is performing post-upgrade safety checks. The value is 3.|  
|PendingSafetyChecks|The pending safety checks.|  
|Kind|The type of the safety check. <br />Possible values are:<br /><br /> -   Invalid - Indicates that the upgrade safety check kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   EnsureSeedNodeQuorum - Indicates that if we bring down the node then this will result in global seed node quorum loss. The value is 1.<br />-   EnsurePartitionQuorum - Indicates that there is some partition for which if we bring down the replica on the node, it will result in quorum loss for that partition. The value is 2.<br />-   WaitForPrimaryPlacement - Indicates that there is some replica on the node that was moved out of this node due to upgrade. Service Fabric is now waiting for the primary to be moved back to this node. The value is 3.<br />-   WaitForPrimarySwap - Indicates that Service Fabric is waiting for a primary replica to be moved out of the node before starting upgrade on that node. The value is 4.<br />-   WaitForReconfiguration - Indicates that there is some replica on the node that is involved in a reconfiguration. Service Fabric is waiting for the reconfiguration to be complete before staring upgrade on that node. The value is 5.<br />-   WaitForInbuildReplica - Indicates that there is either a replica on the node that is going through copy, or there is a primary replica on the node that is copying data to some other replica. In both cases, bringing down the replica on the node due to upgrade will abort the copy. The value is 6.<br />-   EnsureAvailability - Indicates that there is either a stateless service partition on the node having exactly one instance, or there is a primary replica on the node for which the partition is quorum loss. In both cases, bringing down the replicas due to upgrade will result in loss of availability. The value is 7.|  
  
## UpgradeDescription  
  
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
    "ApplicationHealthPolicyMap”: { }  
}  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|ConfigVersion|At least one of ConfigVersion or CodeVersion should be provided.|String|1.0|The configuration version (specified in the cluster manifest).|  
|CodeVersion|At least one of ConfigVersion or CodeVersion should be provided.|String|1.0|The version of the cluster package.|  
|UpgradeKind|Yes|Number|1.0|The kind of upgrade. <br />Possible values are:<br /><br /> -   Invalid - Indicates the upgrade kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Rolling - Indicates that this is a rolling upgrade. The value is 1.|  
|RollingUpgradeMode|Yes|Number|1.0|The type of rolling upgrade when upgrading a cluster. <br />Possible values are:<br /><br /> -   Invalid - Indicates the rolling upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   UnmonitoredAuto - Specifies that the upgrade should be unmonitored automatic. The value is 1.<br />-   UnmonitoredManual - Specifies that the upgrade should be unmonitored manual. The value is 2.<br />-   Monitored - Specifies that the upgrade should be monitored automatic. The value is 3.|  
|UpgradeReplicaSetCheckTimeoutInSeconds|No|Number||The maximum amount of time the system will block on replica set safety checks before continuing to process the upgrade regardless.|  
|ForceRestart|No|Boolean|1.0|The value is true to force a restart of each node during the upgrade process even for configuration upgrades; false to not force a restart of any nodes unless needed.|  
|EnableDeltaHealthEvaluation|No|Boolean|1.0|When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.|  
|MonitoringPolicy|No|Object|1.0|A monitoring policy object to describe the monitoring to perform on the upgrade process.|  
|ClusterUpgradeHealthPolicy|No|Object|1.0|Contains parameters for use when delta health evaluation is enabled.|  
|ApplicationHealthPolicyMap|No|Object|1.0|Contains custom application health policies for specified applications.|  
  
## MonitoringPolicy  
  
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
|FailureAction|No|Number|1.0|The actions for Service Fabric to take if the upgrade fails. <br />Possible values are:<br /><br /> -   Invalid - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Rollback  - Indicates that a rollback of the upgrade will be performed by Service Fabric if the upgrade fails. The value is 1.<br />-   Manual - Indicates that a manual repair will need to be performed by the administrator if the upgrade fails. Service Fabric will not proceed to the next upgrade domain automatically. The value is 2.|  
|HealthCheckWaitDurationInMilliseconds|No|String|1.0|A health check wait duration as measured in milliseconds.|  
|HealthCheckStableDurationInMilliseconds|No|String|1.0|A health check stable duration as measured in milliseconds.|  
|HealthCheckRetryTimeoutInMilliseconds|No|String|1.0|A health check retry timeout as measured in milliseconds.|  
|UpgradeTimeoutInMilliseconds|No|String|1.0|An upgrade timeout as measured in milliseconds.|  
|UpgradeDomainTimeoutInMilliseconds|No|String|1.0|An upgrade domain timeout in milliseconds.|  
  
## ClusterHealthPolicy  
  
```  
{  
    "ConsiderWarningAsError": false|true,  
    "MaxPercentUnhealthyNodes": <value>,  
    "MaxPercentUnhealthyApplications": <value>,  
    "ApplicationTypeHealthPolicyMap": [{"Key":"<value>","Value":<value>}]}  
}  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|ConsiderWarningAsError|No|Boolean|1.0|Value of true to treat warnings as errors; false to not treat warnings as errors.|  
|MaxPercentUnhealthyNodes|No|Number|1.0|The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10.|  
|MaxPercentUnhealthyApplications|No|Number|1.0|The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10.|  
|ApplicationTypeHealthPolicyMap|No|Object|2.0|Specifies the map that defines the maximum percentage of unhealthy applications that are allowed per application type. Application types in this map are evaluated using specific percentages rather than the global MaxPercentUnhealthyApplications percentage. For example, if some applications of a type are critical, the cluster administrator can add an entry to the map for that application type and assign it a value of 0% (that is, do not tolerate any failures). All other applications can be evaluated with MaxPercentUnhealthyApplications set to 20% to tolerate some failures out of the thousands of application instances.The application type health policy map is used only if the cluster manifest enables application type health evaluation using the configuration entry for HealthManager/EnableApplicationTypeHealthEvaluation.|  
  
## ClusterUpgradeHealthPolicy  
  
```  
{  
    "MaxPercentDeltaUnhealthyNodes": <value>,  
    "MaxPercentUpgradeDomainDeltaUnhealthyNodes": <value>  
}  
```  
  
|Element name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|MaxPercentDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of overall unhealthy nodes during upgrade when delta evaluation is enabled.|  
|MaxPercentUpgradeDomainDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of unhealthy nodes per upgrade domain during upgrade when delta evaluation is enabled.|  
  
## ApplicationHealthPolicyMap  
  
```  
{  
    "ApplicationHealthPolicyMap":  
    [{  
        "Key": “<value>”,  
        "Value": <value>  
    }]  
}  
```  
  
-   "Key" represents the name used to identify the application.  
  
-   "Value" represents the application health policy for specified application. The ApplicationHealthyPolicy fields are:  
  
```  
{  
    "ConsiderWarningAsError": false|true,  
    "MaxPercentUnhealthyDeployedApplications": <value>,  
    "DefaultServiceTypeHealthPolicy": {  
        "MaxPercentUnhealthyServices": <value>,  
        "MaxPercentUnhealthyPartitionsPerService": <value>,  
        "MaxPercentUnhealthyReplicasPerPartition": <value>  
    },  
    "ServiceTypeHealthPolicyMap": [  
        {  
            "Key": "<value>",  
            "Value": {  
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
  
## Examples  
 The following example displays the cluster upgrade progress.  
  
```  
/// <summary>  
/// Class similar to FabricUpgradeProgress. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class FabricUpgradeProgress2  
{  
    public string CodeVersion { get; set; }  
    public string ConfigVersion { get; set; }  
    public List<UpgradeDomainStatus> UpgradeDomains { get; set; }  
    public FabricUpgradeState UpgradeState { get; set; }  
    public string NextUpgradeDomain { get; set; }  
    public RollingUpgradeMode RollingUpgradeMode { get; set; }  
    public string UpgradeDurationInMilliseconds { get; set; }  
    public string UpgradeDomainDurationInMilliseconds { get; set; }  
    public List<HealthEvaluation> UnhealthyEvaluations { get; set; }  
    public UpgradeDomainProgress2 CurrentUpgradeDomainProgress { get; set; }  
    public string StartTimestampUtc { get; set; }  
    public string FailureTimestampUtc { get; set; }  
    public UpgradeFailureReason FailureReason { get; set; }  
    public UpgradeDomainProgress2 UpgradeDomainProgressAtFailure { get; set; }  
}  
  
/// <summary>  
/// Class similar to UpgradeDomainProgress. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class UpgradeDomainProgress2  
{  
    public List<NodeUpgradeProgress2> NodeUpgradeProgressList { get; set; }  
    public string DomainName { get; set; }  
}  
/// <summary>  
/// Class similar to NodeUpgradeProgress. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class NodeUpgradeProgress2  
{  
    public string NodeName { get; set; }  
    public NodeUpgradePhase UpgradePhase { get; set; }  
    public List<UpgradeSafetyCheck> PendingSafetyChecks { get; set; }  
}  
  
/// <summary>  
/// Gets the cluster upgrade progress details.  
/// </summary>  
/// <param name="clusterUri">The URI of the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetClusterUpgradeProgress(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/$/GetUpgradeProgress?api-version={0}",  
    Uri.EscapeDataString("1.0"))); // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "GET";  
  
    // Execute the request and obtain the response.  
    try  
    {  
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
        {  
            using (StreamReader streamReader = new StreamReader(response.GetResponseStream(), true))  
            {  
                // Capture the response string.  
                responseString = streamReader.ReadToEnd();  
            }  
        }  
    }  
    catch (WebException e)  
    {  
        // If there is a web exception, display the error message.  
        Console.WriteLine("Error getting the cluster upgrade progress:");  
        Console.WriteLine(e.Message);  
        if (e.InnerException != null)  
            Console.WriteLine(e.InnerException.Message);  
        return false;  
    }  
    catch (Exception e)  
    {  
        // If there is another kind of exception, throw it.  
        throw (e);  
    }  
  
    // Deserialize the response string.  
    JavaScriptSerializer jss = new JavaScriptSerializer();  
    FabricUpgradeProgress2 fabricUpgradeProgress = jss.Deserialize<FabricUpgradeProgress2>(responseString);  
  
    Console.WriteLine("Cluster Upgrade Progess:");  
    Console.WriteLine("  CodeVersion: " + fabricUpgradeProgress.CodeVersion);  
    Console.WriteLine("  ConfigVersion: " + fabricUpgradeProgress.ConfigVersion);  
  
    Console.WriteLine("  UpgradeState: " + fabricUpgradeProgress.UpgradeState);  
    Console.WriteLine("  NextUpgradeDomain: " + fabricUpgradeProgress.NextUpgradeDomain);  
    Console.WriteLine("  RollingUpgradeMode: " + fabricUpgradeProgress.RollingUpgradeMode);  
    Console.WriteLine("  UpgradeDurationInMilliseconds: " + fabricUpgradeProgress.UpgradeDurationInMilliseconds);  
    Console.WriteLine("  UpgradeDomainDurationInMilliseconds: " + fabricUpgradeProgress.UpgradeDomainDurationInMilliseconds);  
    Console.WriteLine("  StartTimestampUtc: " + fabricUpgradeProgress.StartTimestampUtc);  
    Console.WriteLine("  FailureTimestampUtc: " + fabricUpgradeProgress.FailureTimestampUtc);  
    Console.WriteLine("  FailureReason: " + fabricUpgradeProgress.FailureReason);  
  
    Console.WriteLine("  UpgradeDomains:");  
    foreach (UpgradeDomainStatus upgradeDomain in fabricUpgradeProgress.UpgradeDomains)  
    {  
        Console.WriteLine("    UpgradeDomain:");  
        Console.WriteLine("      Name: " + upgradeDomain.Name);  
        Console.WriteLine("      State: " + upgradeDomain.State);  
    }  
  
    Console.WriteLine("  UnhealthyEvaluations:");  
    foreach (HealthEvaluation healthEvaluation in fabricUpgradeProgress.UnhealthyEvaluations)  
    {  
        Console.WriteLine("    UnhealthyEvaluation:");  
        Console.WriteLine("      Description: " + healthEvaluation.Description);  
        Console.WriteLine("      Kind: " + healthEvaluation.Kind);  
        Console.WriteLine("      AggregatedHealthState: " + healthEvaluation.AggregatedHealthState);  
    }  
  
    Console.WriteLine("  CurrentUpgradeDomainProgress:");  
    Console.WriteLine("    DomainName: " + fabricUpgradeProgress.CurrentUpgradeDomainProgress.DomainName);  
  
    Console.WriteLine("    NodeUpgradeProgressList:");  
    foreach (NodeUpgradeProgress2 nodeUpgradeProgress in fabricUpgradeProgress.CurrentUpgradeDomainProgress.NodeUpgradeProgressList)  
    {  
        Console.WriteLine("      NodeName: " + nodeUpgradeProgress.NodeName);  
        Console.WriteLine("      UpgradePhase: " + nodeUpgradeProgress.UpgradePhase);  
        Console.WriteLine("      PendingSafetyChecks:");  
  
        foreach (UpgradeSafetyCheck upgradeSafetyCheck in nodeUpgradeProgress.PendingSafetyChecks)  
        {  
            Console.WriteLine("        Kind: " + upgradeSafetyCheck.Kind);  
        }  
    }  
  
    Console.WriteLine("  UpgradeDomainProgressAtFailure:");  
    Console.WriteLine("    DomainName: " + fabricUpgradeProgress.UpgradeDomainProgressAtFailure.DomainName);  
  
    Console.WriteLine("    NodeUpgradeProgressList:");  
    foreach (NodeUpgradeProgress2 nodeUpgradeProgress in fabricUpgradeProgress.UpgradeDomainProgressAtFailure.NodeUpgradeProgressList)  
    {  
        Console.WriteLine("      NodeName: " + nodeUpgradeProgress.NodeName);  
        Console.WriteLine("      UpgradePhase: " + nodeUpgradeProgress.UpgradePhase);  
        Console.WriteLine("      PendingSafetyChecks:");  
  
        foreach (UpgradeSafetyCheck upgradeSafetyCheck in nodeUpgradeProgress.PendingSafetyChecks)  
        {  
            Console.WriteLine("        Kind: " + upgradeSafetyCheck.Kind);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Cluster Upgrade Progess:  
  CodeVersion: 0.0.0.0  
  ConfigVersion:  
  UpgradeState: RollingForwardCompleted  
  NextUpgradeDomain:  
  RollingUpgradeMode: Invalid  
  UpgradeDurationInMilliseconds: 0  
  UpgradeDomainDurationInMilliseconds: 0  
  StartTimestampUtc: 0  
  FailureTimestampUtc: 0  
  FailureReason: None  
  UpgradeDomains:  
  UnhealthyEvaluations:  
  CurrentUpgradeDomainProgress:  
    DomainName:  
    NodeUpgradeProgressList:  
  UpgradeDomainProgressAtFailure:  
    DomainName:  
    NodeUpgradeProgressList:  
*/  
```