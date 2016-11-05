---
title: "Get the health of a cluster"
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
ms.assetid: a7af0fe3-34f2-4ffa-a92b-47fb696298b4
caps.latest.revision: 16
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
# Get the health of a cluster
Gets the health of a Service Fabric cluster.  
  
## Request  
 See [Cluster](../ServiceFabricREST/cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI gets the cluster health:<br />`<URI>$/GetClusterHealth?api-version={api-version}`|  
|GET|The following URI gets the cluster health with events filter:<br />`<URI>$/GetClusterHealth?api-version=2.0&EventsHealthStateFilter={EventsHealthStateFilter}`|  
|GET|The following URI gets the cluster health with filters for nodes, applications and events: <br />`<URI>$/GetClusterHealth?api-version=2.0& NodesHealthStateFilter={NodesHealthStateFilter}&ApplicationsHealthStateFilter={ ApplicationsHealthStateFilter }& EventsHealthStateFilter={EventsHealthStateFilter}`|  
  
-   Use {EventsHealthStateFilter} (optional) to filter the collection of HealthEvent objects reported on the cluster based on health state. The value can be obtained from members or bitwise operations on members of [HealthStateFilter](https://msdn.microsoft.com/en-us/library/azure/system.fabric.health.healthstatefilter.aspx). Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {NodesHealthStateFilter} (optional) to filter the collection of NodeHealthState objects children of the cluster. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only nodes that match the filter will be returned. All nodes will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {ApplicationsHealthStateFilter} (optional) to filter the collection of ApplicationHealthState objects children of the cluster. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only application that match the filter will be returned. All applications will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
{  
    "HealthEvents": [],  
    "AggregatedHealthState": 1,  
    "UnhealthyEvaluations": [],  
    "NodeHealthStates": [  
        {  
            "Name": "Node.4",  
            "Id": {  
                "Id": "182043d0294b3f36e954e0397268b770"  
            },  
            "AggregatedHealthState": 1  
        },  
        {  
            "Name": "Node.2",  
            "Id": {  
                "Id": "1840a58b116c5f9c7a0b1837194c4205"  
            },  
            "AggregatedHealthState": 1  
        },  
        {  
            "Name": "Node.1",  
            "Id": {  
                "Id": "1880ec88a3187766a6da323399721f53"  
            },  
            "AggregatedHealthState": 1  
        },  
        {  
            "Name": "Node.5",  
            "Id": {  
                "Id": "18a05673ad5b226e2826584627c00a22"  
            },  
            "AggregatedHealthState": 1  
        },  
        {  
            "Name": "Node.3",  
            "Id": {  
                "Id": "18c04a60c5c8e287f4f4337ba8642205"  
            },  
            "AggregatedHealthState": 1  
        }  
    ],  
    "ApplicationHealthStates": [  
        {  
            "Name": "fabric:\\/System",  
            "AggregatedHealthState": 1  
        },  
        {  
            "Name": "fabric:\\/WordCount",  
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
|HealthState|The health state. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|TimeToLiveInMilliSeconds|The time for this health report to be valid in milliseconds. If not specified, time to live defaults to infinite value. To explicitly set Infinite time to live, use value “922337203685477”.|  
|Description|The health state description. The maximum string length for the description is 4096 characters.|  
|SequenceNumber|The sequence number for this health report as a numeric string. If not specified, a sequence number is auto-generated by the health client.|  
|RemoveWhenExpired|`true` to remove the health report after the time to live expires; `false` to keep the health event after the time to live expires. If not specified, it defaults to false.|  
|AggregatedHealthState|The aggregated health state. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|UnhealthyEvaluations|The unhealthy evaluations that show why the current aggregated health state was returned by Health Manager.|  
|Description|The description of the health evaluation, which represents a summary of the evaluation process.|  
|Kind|The health evaluation kind. <br />Possible value are:<br /><br /> -   Invalid - Indicates that the health evaluation is invalid. The value is zero.<br />-   Event - Indicates that the health evaluation is for a health event. The value is 1.<br />-   Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.<br />-   Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.<br />-   DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.<br />-   DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.<br />-   Services - Indicates that the health evaluation is for services of an application. The value is 6.<br />-   Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.<br />-   Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.<br />-   SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.<br />-   UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.<br />-   UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.<br />-   Node - Indicates that the health evaluation is for a node. The value is 12.<br />-   Replica - Indicates that the health evaluation is for a replica. The value is 13.<br />-   Partition - Indicates that the health evaluation is for a partition. The value is 14.<br />-   Service - Indicates that the health evaluation is for a service. The value is 15.<br />-   DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.<br />-   DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.<br />-   Application - Indicates that the health evaluation is for an application. The value is 18.<br />-   DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.<br />-   UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.<br />-   ApplicationTypeApplications – Indicates that the health evaluation is for applications of an application type. The value is 21.|  
|AggregatedHealthState|The aggregated health state of this unhealthy evaluation. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|NodeHealthStates|The node health states as an array of JSON objects.|  
|Name|The name of the node.|  
|Id|The JSON object that contains the node ID.|  
|Id|The node ID.|  
|AggregatedHealthState|The aggregated health state of this node. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ApplicationHealthStates|The application health states as an array of JSON objects.|  
|Name|The name of the node.|  
|AggregatedHealthState|The aggregated health state of an application. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
  
## Examples  
 The following example displays cluster health information onto the console.  
  
```  
/// <summary>  
/// Class similar to ClusterHealth. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ClusterHealth2  
{  
    public HealthState AggregatedHealthState { get; set; }  
    public List<HealthEvent2> HealthEvents { get; set; }  
    public List<HealthEvaluation> UnhealthyEvaluations { get; set; }  
    public List<ApplicationHealthState2> ApplicationHealthStates { get; set; }  
    public List<NodeHealthState2> NodeHealthStates { get; set; }  
}  
  
/// <summary>  
/// Class similar to HealthEvent. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class HealthEvent2  
{  
    public string SourceId { get; set; }  
    public string Property { get; set; }  
    public HealthState HealthState { get; set; }  
    public string TimeToLiveInMilliSeconds { get; set; }  
    public string Description { get; set; }  
    public string SequenceNumber { get; set; }  
    public bool RemoveWhenExpired { get; set; }  
    public string SourceUtcTimestamp { get; set; }  
    public string LastModifiedUtcTimestamp { get; set; }  
    public bool IsExpired { get; set; }  
    public string LastOkTransitionAt { get; set; }  
    public string LastWarningTransitionAt { get; set; }  
    public string LastErrorTransitionAt { get; set; }  
}  
  
/// <summary>  
/// Class similar to ApplicationHealthState. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ApplicationHealthState2  
{  
    public string Name { get; set; }  
    public HealthState AggregatedHealthState { get; set; }  
}  
  
/// <summary>  
/// Class similar to NodeHealthState. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class NodeHealthState2  
{  
    public string Name { get; set; }  
    public IdObject Id { get; set; }  
    public HealthState AggregatedHealthState { get; set; }  
}  
  
/// <summary>  
/// Class. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class IdObject  
{  
    public string Id { get; set; }  
}  
  
/// <summary>  
/// Gets the cluster health.  
/// </summary>  
/// <param name="clusterUri">The URI of the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetClusterHealth(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/$/GetClusterHealth?api-version={0}",  
        "1.0")); // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "POST";  
    request.ContentLength = 0;  
  
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
        Console.WriteLine("Error getting the cluster health:");  
        if (e.InnerException != null)  
            Console.WriteLine(e.InnerException.Message);  
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
    ClusterHealth2 clusterHealth = jss.Deserialize<ClusterHealth2>(responseString);  
  
    // Display the cluster health.  
    Console.WriteLine("Cluster Health:");  
    Console.WriteLine("  Aggregated Health State: " + clusterHealth.AggregatedHealthState);  
  
    Console.WriteLine("  HealthEvents:");  
    foreach (HealthEvent2 healthEvent in clusterHealth.HealthEvents)  
    {  
        Console.WriteLine("  HealthEvent:");  
        Console.WriteLine("    Description: " + healthEvent.Description);  
        Console.WriteLine("    HealthState: " + healthEvent.HealthState);  
        Console.WriteLine("    SourceId: " + healthEvent.SourceId);  
        Console.WriteLine("    Property: " + healthEvent.Property);  
        Console.WriteLine("    IsExpired: " + healthEvent.IsExpired);  
        Console.WriteLine("    RemoveWhenExpired: " + healthEvent.RemoveWhenExpired);  
        Console.WriteLine("    SequenceNumber: " + healthEvent.SequenceNumber);  
        Console.WriteLine("    SourceUtcTimestamp: " + healthEvent.SourceUtcTimestamp);  
        Console.WriteLine("    TimeToLiveInMilliSeconds: " + healthEvent.TimeToLiveInMilliSeconds);  
        Console.WriteLine("    LastModifiedUtcTimestamp: " + healthEvent.LastModifiedUtcTimestamp);  
        Console.WriteLine("    LastOkTransitionAt: " + healthEvent.LastOkTransitionAt);  
        Console.WriteLine("    LastWarningTransitionAt: " + healthEvent.LastWarningTransitionAt);  
        Console.WriteLine("    LastErrorTransitionAt: " + healthEvent.LastErrorTransitionAt);  
    }  
  
    Console.WriteLine("  UnhealthyEvaluations:");  
    foreach (HealthEvaluation healthEvaluation in clusterHealth.UnhealthyEvaluations)  
    {  
        Console.WriteLine("    UnhealthyEvaluation:");  
        Console.WriteLine("      Description: " + healthEvaluation.Description);  
        Console.WriteLine("      Kind: " + healthEvaluation.Kind);  
        Console.WriteLine("      AggregatedHealthState: " + healthEvaluation.AggregatedHealthState);  
    }  
  
    Console.WriteLine("  ApplicationHealthStates:");  
    foreach (ApplicationHealthState2 applicationHealthState in clusterHealth.ApplicationHealthStates)  
    {  
        Console.WriteLine("    ApplicationHealthState:");  
        Console.WriteLine("      Name: " + applicationHealthState.Name);  
        Console.WriteLine("      AggregatedHealthState: " + applicationHealthState.AggregatedHealthState);  
    }  
  
    Console.WriteLine("  NodeHealthStates:");  
    foreach (NodeHealthState2 nodeHealthState in clusterHealth.NodeHealthStates)  
    {  
        Console.WriteLine("    NodeHealthState:");  
        Console.WriteLine("      Name: " + nodeHealthState.Name);  
        Console.WriteLine("      Id: " + nodeHealthState.Id.Id);  
        Console.WriteLine("      AggregatedHealthState: " + nodeHealthState.AggregatedHealthState);  
    }  
  
    return true;  
}  
  
/*  
This code produces output similar to the following:  
  
Cluster Health:  
  Aggregated Health State: Ok  
  HealthEvents:  
  UnhealthyEvaluations:  
  ApplicationHealthStates:  
    ApplicationHealthState:  
      Name: fabric:/System  
      AggregatedHealthState: Ok  
    ApplicationHealthState:  
      Name: fabric:/WordCount  
      AggregatedHealthState: Ok  
  NodeHealthStates:  
    NodeHealthState:  
      Name: Node.4  
      Id: 182043d0294b3f36e954e0397268b770  
      AggregatedHealthState: Ok  
    NodeHealthState:  
      Name: Node.2  
      Id: 1840a58b116c5f9c7a0b1837194c4205  
      AggregatedHealthState: Ok  
    NodeHealthState:  
      Name: Node.1  
      Id: 1880ec88a3187766a6da323399721f53  
      AggregatedHealthState: Ok  
    NodeHealthState:  
      Name: Node.5  
      Id: 18a05673ad5b226e2826584627c00a22  
      AggregatedHealthState: Ok  
    NodeHealthState:  
      Name: Node.3  
      Id: 18c04a60c5c8e287f4f4337ba8642205  
      AggregatedHealthState: Ok  
*/  
```