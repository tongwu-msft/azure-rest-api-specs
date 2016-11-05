---
title: "Get the progress of an application upgrade1"
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
ms.assetid: a1855c6d-5750-4f22-8ad8-adbb00b99684
caps.latest.revision: 3
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
# Get the progress of an application upgrade
Gets the progress of the Service Fabric application upgrade process.  
  
## Request  
 See [Application type](../ServiceFabricREST/application-type.md) for headers and parameters that are used by all requests related to code packages.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-name}/$/GetUpgradeProgress?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
{  
    "Name": "fabric:\\/WordCount",  
    "TypeName": "WordCount",  
    "TargetApplicationTypeVersion": "1.1.0.0",  
    "UpgradeDomains": [  
        {  
            "Name": "UD1",  
            "State": 3  
        },  
        {  
            "Name": "UD2",  
            "State": 3  
        },  
        {  
            "Name": "UD3",  
            "State": 3  
        },  
        {  
            "Name": "UD4",  
            "State": 3  
        },  
        {  
            "Name": "UD5",  
            "State": 3  
        }  
    ],  
    "UpgradeState": 5,  
    "NextUpgradeDomain": "",  
    "RollingUpgradeMode": 1,  
    "UpgradeDescription": {  
        "Name": "fabric:\\/WordCount",  
        "TargetApplicationTypeVersion": "1.1.0.0",  
        "Parameters": [],  
        "UpgradeKind": 1,  
        "RollingUpgradeMode": 1,  
        "UpgradeReplicaSetCheckTimeoutInSeconds": 5,  
        "ForceRestart": true,  
        "MonitoringPolicy": {  
            "FailureAction": 1,  
            "HealthCheckWaitDurationInMilliseconds": "5000",  
            "HealthCheckStableDurationInMilliseconds": "10000",  
            "HealthCheckRetryTimeoutInMilliseconds": "20000",  
            "UpgradeTimeoutInMilliseconds": "60000",  
            "UpgradeDomainTimeoutInMilliseconds": "30000"  
        }  
    },  
    "UpgradeDurationInMilliseconds": "96180",  
    "UpgradeDomainDurationInMilliseconds": "0",  
    "UnhealthyEvaluations": [],  
    "CurrentUpgradeDomainProgress": {  
        "DomainName": "",  
        "NodeUpgradeProgressList": []  
    },  
    "StartTimestampUtc": "130742203096737514",  
    "FailureTimestampUtc": "0",  
    "FailureReason": 0,  
    "UpgradeDomainProgressAtFailure": {  
        "DomainName": "",  
        "NodeUpgradeProgressList": []  
    }  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The application name.|  
|TypeName|The application type name.|  
|TargetApplicationTypeVersion|The target application type version.|  
|UpgradeDomains|The upgrade domain status as an array of JSON objects|  
|Name|The name of the upgrade domain.|  
|State|The state of the upgrade domain.   Possible values are:<br /><br /> -   •    Invalid - Indicates that the upgrade is pending and has not started. The value is 1.<br />-   •    InProgress - Indicates that the upgrade is in progress. The value is 2.<br />-   • Completed - Indicates that the upgrade is completed. The value is 3.|  
|UpgradeState|The upgrade state.  Possible values are:<br /><br /> -   Invalid - Indicates the type is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   RollingBackInProgress - Indicates that the upgrade is in the process of rolling back. This indicates that upgrade to the target version has failed. Note that this state can also be observed temporarily if the upgrade is interrupted to start a new upgrade. The value is 1.<br />-   RollingForwardPending - Indicates that the upgrade to the target application type version is pending user input. The MoveNextApplicationUpgradeDomainAsync is used to move the upgrade forward. The value is 3.<br />-   RollingForwardInProgress - Indicates that the upgrade to the target application type version is in progress. The value is 4.<br />-   RollingForwardCompleted - Indicates that the upgrade to the target application type version is completed. The value is 5.|  
|NextUpgradeDomain|The name of the next upgrade domain.|  
|RollingUpgradeMode|The rolling uprade mode.  Possible values are:<br /><br /> -   Invalid - Indicates the rolling upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   UnmonitoredAuto - Specifies that the upgrade should be unmonitored automatic. The value is 1.<br />-   UnmonitoredManual - Specifies that the upgrade should be unmonitored manual. The value is 2.<br />-   Monitored - Specifies that the upgrade should be monitored automatic. The value is 3.|  
|UpgradeDescription|The current description being used by the current upgrade. The contents of this object is same as the one passed in to initiate or update the Application Upgrade.|  
|UpgradeDurationInMilliseconds|The estimated duration of the overall upgrade.|  
|UpgradeDomainDurationInMilliseconds|The estimated duration of the current pending upgrade domain.|  
|UnhealthyEvaluations|An array of failed health evaluation details (if any) while performing health checks during upgrade. Only applicable to monitored upgrades.|  
|Description|The description of the health evaluation, which represents a summary of the evaluation process.|  
|Kind|The health evaluation kind. Possible value are:<br /><br /> -   Invalid - Indicates that the health evaluation is invalid. The value is zero.<br />-   Event - Indicates that the health evaluation is for a health event. The value is 1.<br />-   Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.<br />-   Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.<br />-   DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.<br />-   DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.<br />-   Services - Indicates that the health evaluation is for services of an application. The value is 6.<br />-   Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.<br />-   Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.<br />-   SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.<br />-   UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.<br />-   UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.<br />-   Node - Indicates that the health evaluation is for a node. The value is 12.<br />-   Replica - Indicates that the health evaluation is for a replica. The value is 13.<br />-   Partition - Indicates that the health evaluation is for a partition. The value is 14.<br />-   Service - Indicates that the health evaluation is for a service. The value is 15.<br />-   DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.<br />-   DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.<br />-   Application - Indicates that the health evaluation is for an application. The value is 18.<br />-   DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.<br />-   UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.<br />-   ApplicationTypeApplications – Indicates that the health evaluation is for applications of an application type. The value is 21.|  
|AggregatedHealthState|The aggregated health state of this unhealthy evaluation. Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|CurrentUpgradeDomainProgress|An array of objects describing the state of the current upgrade domain. Contains information about any replica set or seed node safety check violations that may be blocking upgrade progress.|  
|DomainName|The domain name.|  
|NodeUpgradeProgressList|The node progress list.|  
|NodeName|The node name.|  
|UpgradePhase|The upgrade phase. Possible values are:<br /><br /> -   Invalid - Indicates that the node upgrade phase is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   PreUpgradeSafetyCheck - Indicates that upgrade has not started on the node and Service Fabric is performing pre-upgrade safety checks. The value is 1.<br />-   Upgrading - Indicates that the node is in the process of getting upgraded. The value is 2.<br />-   PostUpgradeSafetyCheck - Indicates that upgrade is complete on the node and Service Fabric is performing post-upgrade safety checks. The value is 3.|  
|PendingSafetyChecks|The pending safety checks.|  
|Kind|The type of the safety check. Possible values are:<br /><br /> -   Invalid - Indicates that the upgrade safety check kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   EnsureSeedNodeQuorum - Indicates that if we bring down the node then this will result in global seed node quorum loss. The value is 1.<br />-   EnsurePartitionQuorum - Indicates that there is some partition for which if we bring down the replica on the node, it will result in quorum loss for that partition. The value is 2.<br />-   WaitForPrimaryPlacement - Indicates that there is some replica on the node that was moved out of this node due to upgrade. Service Fabric is now waiting for the primary to be moved back to this node. The value is 3.<br />-   WaitForPrimarySwap - Indicates that Service Fabric is waiting for a primary replica to be moved out of the node before starting upgrade on that node. The value is 4.<br />-   WaitForReconfiguration - Indicates that there is some replica on the node that is involved in a reconfiguration. Service Fabric is waiting for the reconfiguration to be complete before staring upgrade on that node. The value is 5.<br />-   WaitForInbuildReplica - Indicates that there is either a replica on the node that is going through copy, or there is a primary replica on the node that is copying data to some other replica. In both cases, bringing down the replica on the node due to upgrade will abort the copy. The value is 6.<br />-   EnsureAvailability - Indicates that there is either a stateless service partition on the node having exactly one instance, or there is a primary replica on the node for which the partition is quorum loss. In both cases, bringing down the replicas due to upgrade will result in loss of availability. The value is 7.|  
|StartTimestampUtc|The start time of the upgrade.|  
|FailureTimestampUtc|The failure time of the upgrade.|  
|FailureReason|The failure reason. Possible values are:<br /><br /> -   None - Indicates there was no upgrade failure. The value is zero.<br />-   Interrupted - Indicates the upgrade was interrupted. The value is 1.<br />-   HealthCheck - Indicates the upgrade failed because of a failed health check. The value is 2.<br />-   UpgradeDomainTimeout - Indicates the upgrade domain timed out. The value is 3.<br />-   OverallUpgradeTimeout - Indicates there was an overall timeout. The value is 4.|  
|UpgradeDomainProgressAtFailure|The detailed upgrade progress for application in the current upgrade domain at the point of failure.|  
|DomainName|The domain name.|  
|NodeUpgradeProgressList|The node progress list.|  
|NodeName|The node name.|  
|UpgradePhase|The upgrade phase. Possible values are:<br /><br /> -   • Invalid - Indicates that the node upgrade phase is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   •   PreUpgradeSafetyCheck - Indicates that upgrade is complete on the node and Service Fabric is performing post-upgrade safety checks. The value is 1.<br />-   •    Upgrading - Indicates that upgrade has not started on the node and Service Fabric is performing pre-upgrade safety checks. The value is 2.<br />-   • PostUpgradeSafetyCheck - Indicates that the node is in the process of getting upgraded. The value is 3.|  
|PendingSafetyChecks|The pending safety checks.|  
|Kind|The type of the safety check. Possible values are:<br /><br /> -   Invalid - Indicates that the upgrade safety check kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   EnsureSeedNodeQuorum - Indicates that if we bring down the node then this will result in global seed node quorum loss. The value is 1.<br />-   EnsurePartitionQuorum - Indicates that there is some partition for which if we bring down the replica on the node, it will result in quorum loss for that partition. The value is 2.<br />-   WaitForPrimaryPlacement - Indicates that there is some replica on the node that was moved out of this node due to upgrade. Service Fabric is now waiting for the primary to be moved back to this node. The value is 3.<br />-   WaitForPrimarySwap - Indicates that Service Fabric is waiting for a primary replica to be moved out of the node before starting upgrade on that node. The value is 4.<br />-   WaitForReconfiguration - Indicates that there is some replica on the node that is involved in a reconfiguration. Service Fabric is waiting for the reconfiguration to be complete before staring upgrade on that node. The value is 5.<br />-   WaitForInbuildReplica - Indicates that there is either a replica on the node that is going through copy, or there is a primary replica on the node that is copying data to some other replica. In both cases, bringing down the replica on the node due to upgrade will abort the copy. The value is 6.<br />-   EnsureAvailability - Indicates that there is either a stateless service partition on the node having exactly one instance, or there is a primary replica on the node for which the partition is quorum loss. In both cases, bringing down the replicas due to upgrade will result in loss of availability. The value is 7.|  
  
### Examples  
 The following example displays the application upgrade progress.  
  
```  
//// <summary>  
/// Class similar to ApplicationUpgradeProgress. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ApplicationUpgradeProgress2  
{  
    public string Name { get; set; }  
    public string TypeName { get; set; }  
    public string TargetApplicationTypeVersion { get; set; }  
    public List<UpgradeDomainStatus2> UpgradeDomains { get; set; }  
    public ApplicationUpgradeState UpgradeState { get; set; }  
    public string NextUpgradeDomain { get; set; }  
    public RollingUpgradeMode RollingUpgradeMode { get; set; }  
    public ApplicationUpgradeDescription2 UpgradeDescription { get; set; }  
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
/// Class similar to UpgradeDomainStatus. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class UpgradeDomainStatus2  
{  
    public string Name { get; set; }  
    public UpgradeDomainState State { get; set; }  
}  
  
/// <summary>  
/// Class similar to ApplicationUpgradeDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ApplicationUpgradeDescription2  
{  
    public string Name { get; set; }  
    public string TargetApplicationTypeVersion { get; set; }  
    public List<Parameter2> Parameters { get; set; }  
    public UpgradeKind UpgradeKind { get; set; }  
    public RollingUpgradeMode RollingUpgradeMode { get; set; }  
    public long UpgradeReplicaSetCheckTimeoutInSeconds { get; set; }  
    public bool ForceRestart { get; set; }  
    public RollingUpgradeMonitoringPolicy2 MonitoringPolicy { get; set; }  
}  
  
/// <summary>  
/// Class similar to Parameter. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Parameter2  
{  
    public string Name { get; set; }  
    public string Value { get; set; }  
}  
  
/// <summary>  
/// Class similar to RollingUpgradeMonitoringPolicy. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class RollingUpgradeMonitoringPolicy2  
{  
    public UpgradeFailureAction FailureAction { get; set; }  
    public string HealthCheckWaitDurationInMilliseconds { get; set; }  
    public string HealthCheckStableDurationInMilliseconds { get; set; }  
    public string HealthCheckRetryTimeoutInMilliseconds { get; set; }  
    public string UpgradeTimeoutInMilliseconds { get; set; }  
    public string UpgradeDomainTimeoutInMilliseconds { get; set; }  
}  
  
/// <summary>  
/// Class similar to UpgradeDomainProgress. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class UpgradeDomainProgress2  
{  
    public string DomainName { get; set; }  
    public List<NodeUpgradeProgress2> NodeUpgradeProgressList { get; set; }  
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
/// Gets the upgrade progress of an application.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetApplicationUpgradeProgress(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/{0}/$/GetUpgradeProgress?api-version={1}",  
        "WordCount",    // Application Name  
        "1.0"));        // api-version  
  
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
        Console.WriteLine("Error getting the application list:");  
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
    ApplicationUpgradeProgress2 applicationUpgradeProgress = jss.Deserialize<ApplicationUpgradeProgress2>(responseString);  
  
    Console.WriteLine("Application Upgrade Progress:");  
    Console.WriteLine("  Name: " + applicationUpgradeProgress.Name);  
    Console.WriteLine("  TypeName: " + applicationUpgradeProgress.TypeName);  
    Console.WriteLine("  TargetApplicationTypeVersion: " + applicationUpgradeProgress.TargetApplicationTypeVersion);  
    Console.WriteLine("  UpgradeState: " + applicationUpgradeProgress.UpgradeState);  
    Console.WriteLine("  NextUpgradeDomain: " + applicationUpgradeProgress.NextUpgradeDomain);  
    Console.WriteLine("  RollingUpgradeMode: " + applicationUpgradeProgress.RollingUpgradeMode);  
    Console.WriteLine("  UpgradeDurationInMilliseconds: " + applicationUpgradeProgress.UpgradeDurationInMilliseconds);  
    Console.WriteLine("  UpgradeDomainDurationInMilliseconds: " + applicationUpgradeProgress.UpgradeDomainDurationInMilliseconds);  
    Console.WriteLine("  StartTimestampUtc: " + applicationUpgradeProgress.StartTimestampUtc);  
    Console.WriteLine("  FailureTimestampUtc: " + applicationUpgradeProgress.FailureTimestampUtc);  
    Console.WriteLine("  FailureReason: " + applicationUpgradeProgress.FailureReason);  
  
    Console.WriteLine("  UpgradeDomains:");  
    foreach (UpgradeDomainStatus2 upgradeDomain in applicationUpgradeProgress.UpgradeDomains)  
    {  
        Console.WriteLine("    UpgradeDomain:");  
        Console.WriteLine("      Name: " + upgradeDomain.Name);  
        Console.WriteLine("      State: " + upgradeDomain.State);  
    }  
  
    Console.WriteLine("  UpgradeDescription:");  
    if (applicationUpgradeProgress.UpgradeDescription != null)  
    {  
        Console.WriteLine("    Name: " + applicationUpgradeProgress.UpgradeDescription.Name);  
        Console.WriteLine("    TargetApplicationTypeVersion: " + applicationUpgradeProgress.UpgradeDescription.TargetApplicationTypeVersion);  
        Console.WriteLine("    UpgradeKind: " + applicationUpgradeProgress.UpgradeDescription.UpgradeKind);  
        Console.WriteLine("    RollingUpgradeMode: " + applicationUpgradeProgress.UpgradeDescription.RollingUpgradeMode);  
        Console.WriteLine("    UpgradeReplicaSetCheckTimeoutInSeconds: " + applicationUpgradeProgress.UpgradeDescription.UpgradeReplicaSetCheckTimeoutInSeconds);  
        Console.WriteLine("    ForceRestart: " + applicationUpgradeProgress.UpgradeDescription.ForceRestart);  
  
        Console.WriteLine("    MonitoringPolicy:");  
        Console.WriteLine("      FailureAction: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.FailureAction);  
        Console.WriteLine("      HealthCheckWaitDurationInMilliseconds: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.HealthCheckWaitDurationInMilliseconds);  
        Console.WriteLine("      HealthCheckStableDurationInMilliseconds: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.HealthCheckStableDurationInMilliseconds);  
        Console.WriteLine("      HealthCheckRetryTimeoutInMilliseconds: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.HealthCheckRetryTimeoutInMilliseconds);  
        Console.WriteLine("      UpgradeTimeoutInMilliseconds: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.UpgradeTimeoutInMilliseconds);  
        Console.WriteLine("      UpgradeDomainTimeoutInMilliseconds: " + applicationUpgradeProgress.UpgradeDescription.MonitoringPolicy.UpgradeDomainTimeoutInMilliseconds);  
  
        Console.WriteLine("    Parameters:");  
        foreach (Parameter2 parameter in applicationUpgradeProgress.UpgradeDescription.Parameters)  
        {  
            Console.WriteLine("      Parameter:");  
            Console.WriteLine("        Name: " + parameter.Name);  
            Console.WriteLine("        Value: " + parameter.Value);  
        }  
    }  
  
    Console.WriteLine("  UnhealthyEvaluations:");  
    foreach (HealthEvaluation healthEvaluation in applicationUpgradeProgress.UnhealthyEvaluations)  
    {  
        Console.WriteLine("    UnhealthyEvaluation:");  
        Console.WriteLine("      Description: " + healthEvaluation.Description);  
        Console.WriteLine("      Kind: " + healthEvaluation.Kind);  
        Console.WriteLine("      AggregatedHealthState: " + healthEvaluation.AggregatedHealthState);  
    }  
  
    Console.WriteLine("  CurrentUpgradeDomainProgress:");  
    Console.WriteLine("    DomainName: " + applicationUpgradeProgress.CurrentUpgradeDomainProgress.DomainName);  
  
    Console.WriteLine("    NodeUpgradeProgressList:");  
    foreach (NodeUpgradeProgress2 nodeUpgradeProgress in applicationUpgradeProgress.CurrentUpgradeDomainProgress.NodeUpgradeProgressList)  
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
    Console.WriteLine("    DomainName: " + applicationUpgradeProgress.UpgradeDomainProgressAtFailure.DomainName);  
  
    Console.WriteLine("    NodeUpgradeProgressList:");  
    foreach (NodeUpgradeProgress2 nodeUpgradeProgress in applicationUpgradeProgress.UpgradeDomainProgressAtFailure.NodeUpgradeProgressList)  
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
  
Application Upgrade Progress:  
  Name: fabric:/WordCount  
  TypeName: WordCount  
  TargetApplicationTypeVersion: 1.1.0.0  
  UpgradeState: RollingForwardCompleted  
  NextUpgradeDomain:  
  RollingUpgradeMode: UnmonitoredAuto  
  UpgradeDurationInMilliseconds: 96180  
  UpgradeDomainDurationInMilliseconds: 0  
  StartTimestampUtc: 130742203096737514  
  FailureTimestampUtc: 0  
  FailureReason: None  
  UpgradeDomains:  
    UpgradeDomain:  
      Name: UD1  
      State: Completed  
    UpgradeDomain:  
      Name: UD2  
      State: Completed  
    UpgradeDomain:  
      Name: UD3  
      State: Completed  
    UpgradeDomain:  
      Name: UD4  
      State: Completed  
    UpgradeDomain:  
      Name: UD5  
      State: Completed  
  UpgradeDescription:  
    Name: fabric:/WordCount  
    TargetApplicationTypeVersion: 1.1.0.0  
    UpgradeKind: Rolling  
    RollingUpgradeMode: UnmonitoredAuto  
    UpgradeReplicaSetCheckTimeoutInSeconds: 5  
    ForceRestart: True  
    MonitoringPolicy:  
      FailureAction: Rollback  
      HealthCheckWaitDurationInMilliseconds: 5000  
      HealthCheckStableDurationInMilliseconds: 10000  
      HealthCheckRetryTimeoutInMilliseconds: 20000  
      UpgradeTimeoutInMilliseconds: 60000  
      UpgradeDomainTimeoutInMilliseconds: 30000  
    Parameters:  
  UnhealthyEvaluations:  
  CurrentUpgradeDomainProgress:  
    DomainName:  
    NodeUpgradeProgressList:  
  UpgradeDomainProgressAtFailure:  
    DomainName:  
    NodeUpgradeProgressList:  
*/  
  
```