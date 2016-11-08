---
title: "Get the health of a service"
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
ms.assetid: 04213a76-dc1d-4059-8e22-60b791fae3dd
caps.latest.revision: 21
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
# Get the health of a service
Gets the health reports of a Service Fabric service  
  
## Request  
 See [Service](service.md) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI is used to get the health of a service:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetHealth?api-version={api-version}`|  
|GET|The following URI is used to get the health of a service:<br /><br /> `<URI>/Services/{service-name}/$/GetHealth?api-version={api-version}`|  
|GET|The following URI is used to get the health of a service with filters for events and partitions:<br /><br /> `<URI>/Services/{service-name}/$/GetHealth? EventsHealthStateFilter={ EventsHealthStateFilter}& PartitionsHealthStateFilter={ PartitionsHealthStateFilter}&api-version={api-version}`|  
  
-   Use {EventsHealthStateFilter} (optional) to filter the collection of HealthEvent objects reported on the service  based on health state. The value can be obtained from members or bitwise operations on members of [HealthStateFilter](https://msdn.microsoft.com/en-us/library/azure/system.fabric.health.healthstatefilter.aspx). Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {PartitionsHealthStateFilter} (optional) to filter the collection of PartitionHealthState objects children of the service. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only partitions that match the filter will be returned. All partitions will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "HealthEvents": [  
        {  
            "SourceId": "System.FM",  
            "Property": "State",  
            "HealthState": 1,  
            "TimeToLiveInMilliSeconds": "922337203685477",  
            "Description": "Service has been created.",  
            "SequenceNumber": "3",  
            "RemoveWhenExpired": false,  
            "SourceUtcTimestamp": "130742924296332054",  
            "LastModifiedUtcTimestamp": "130742924304144928",  
            "IsExpired": false,  
            "LastOkTransitionAt": "130742924304144928",  
            "LastWarningTransitionAt": "0",  
            "LastErrorTransitionAt": "0"  
        }  
    ],  
    "AggregatedHealthState": 1,  
    "UnhealthyEvaluations": [],  
    "Name": "fabric:\\/WordCount\\/WordCount.Service",  
    "PartitionHealthStates": [  
        {  
            "PartitionId": "dd612667-22dc-4168-bc0d-24e1eee03845",  
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
|SourceUtcTimestamp|The date and time when the health report was sent by the source.|  
|LastModifiedUtcTimestamp|The date and time when the health report was received by the health store.|  
|IsExpired|Indicates whether the health event has expired.|  
|LastOkTransitionAt|If the current HealthState is Ok, returns the time at which the health report was first reported with Ok. For periodic reporting, many reports with the same state may have been generated. If the current HealthState is Error or Warning, returns the time at which the health state was last in Ok, before transitioning to a different state. If the HealthState has never been Ok, the value will be System.DateTime.FromFileTimeUtc(0).|  
|LastWarningTransitionAt|If the current HealthState is Warning, returns the time at which the health report was first reported with Warning. For periodic reporting, many reports with the same state may have been generated. If the current HealthState is Ok or Error, returns the time at which the health state was last in Warning, before transitioning to a different state. If the HealthState has never been Warning, the value will be System.DateTime.FromFileTimeUtc(0).|  
|LastErrorTransitionAt|If the current HealthState is Error, returns the time at which the health report was first reported with Error. For periodic reporting, many reports with the same state may have been generated. If the current HealthState is Ok or Warning, returns the time at which the health state was last in Error, before transitioning to a different state. If the HealthState has never been Error, the value will be System.DateTime.FromFileTimeUtc(0).|  
|AggregatedHealthState|The aggregated health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|UnhealthyEvaluations|The unhealthy evaluations that show why the current aggregated health state was returned by Health Manager.|  
|Description|The description of the health evaluation, which represents a summary of the evaluation process.|  
|Kind|The health evaluation kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that the health evaluation is invalid. The value is zero.<br />-   Event - Indicates that the health evaluation is for a health event. The value is 1.<br />-   Replicas - Indicates that the health evaluation is for the replicas of a partition. The value is 2.<br />-   Partitions - Indicates that the health evaluation is for the partitions of a service. The value is 3.<br />-   DeployedServicePackages - Indicates that the health evaluation is for the deployed service packages of a deployed application. The value is 4.<br />-   DeployedApplications - Indicates that the health evaluation is for the deployed applications of an application. The value is 5.<br />-   Services - Indicates that the health evaluation is for services of an application. The value is 6.<br />-   Nodes - Indicates that the health evaluation is for the cluster nodes. The value is 7.<br />-   Applications - Indicates that the health evaluation is for the cluster applications. The value is 8.<br />-   SystemApplication - Indicates that the health evaluation is for the system application. The value is 9.<br />-   UpgradeDomainDeployedApplications - Indicates that the health evaluation is for the deployed applications of an application in an upgrade domain. The value is 10.<br />-   UpgradeDomainNodes - Indicates that the health evaluation is for the cluster nodes in an upgrade domain. The value is 11.<br />-   Node - Indicates that the health evaluation is for a node. The value is 12.<br />-   Replica - Indicates that the health evaluation is for a replica. The value is 13.<br />-   Partition - Indicates that the health evaluation is for a partition. The value is 14.<br />-   Service - Indicates that the health evaluation is for a service. The value is 15.<br />-   DeployedServicePackage - Indicates that the health evaluation is for a deployed service package. The value is 16.<br />-   DeployedApplication - Indicates that the health evaluation is for a deployed application. The value is 17.<br />-   Application - Indicates that the health evaluation is for an application. The value is 18.<br />-   DeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy cluster nodes. The value is 19.<br />-   UpgradeDomainDeltaNodesCheck - Indicates that the health evaluation is for the delta of unhealthy upgrade domain cluster nodes. The value is 20.<br />-   ApplicationTypeApplications – Indicates that the health evaluation is for applications of an application type. The value is 21.|  
|AggregatedHealthState|The aggregated health state of this unhealthy evaluation.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|Name|The application name.|  
|PartitionHealthStates|The partition health states as an array of JSON objects.|  
|PartitionId|The partition ID GUID as a string.|  
|AggregatedHealthState|The aggregated health state of the partition.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
  
## Examples  
 The following example displays the service health for a specific service.  
  
```  
/// <summary>  
/// Class similar to ServiceHealth. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceHealth2  
{  
    public string Name { get; set; }  
    public HealthState AggregatedHealthState { get; set; }  
    public List<HealthEvent2> HealthEvents { get; set; }  
    public List<HealthEvaluation> UnhealthyEvaluations { get; set; }  
    public List<PartitionHealthState2> PartitionHealthStates { get; set; }  
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
  
    public HealthEvent2() { }  
}  
  
/// <summary>  
/// Class similar to PartitionHealthState. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class PartitionHealthState2  
{  
    public Guid PartitionId { get; set; }  
    public HealthState AggregatedHealthState { get; set; }  
}  
  
/// <summary>  
/// Gets the health of a service.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServiceHealth(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetHealth?api-version={2}",  
        "WordCount",                    // Application Name  
        "WordCount/WordCount.Service",  // Service Name  
        "1.0"));                        // api-version  
  
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
        Console.WriteLine("Error getting service health:");  
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
    ServiceHealth2 serviceHealth = jss.Deserialize<ServiceHealth2>(responseString);  
  
    Console.WriteLine("Service Health:");  
    Console.WriteLine("  Name: " + serviceHealth.Name);  
    Console.WriteLine("  Aggregated Health State: " + serviceHealth.AggregatedHealthState);  
  
    Console.WriteLine("  HealthEvents:");  
    foreach (HealthEvent2 healthEvent in serviceHealth.HealthEvents)  
    {  
        Console.WriteLine("    HealthEvent:");  
        Console.WriteLine("      Description: " + healthEvent.Description);  
        Console.WriteLine("      HealthState: " + healthEvent.HealthState);  
        Console.WriteLine("      SourceId: " + healthEvent.SourceId);  
        Console.WriteLine("      Property: " + healthEvent.Property);  
        Console.WriteLine("      IsExpired: " + healthEvent.IsExpired);  
        Console.WriteLine("      RemoveWhenExpired: " + healthEvent.RemoveWhenExpired);  
        Console.WriteLine("      SequenceNumber: " + healthEvent.SequenceNumber);  
        Console.WriteLine("      SourceUtcTimestamp: " + healthEvent.SourceUtcTimestamp);  
        Console.WriteLine("      TimeToLiveInMilliSeconds: " + healthEvent.TimeToLiveInMilliSeconds);  
        Console.WriteLine("      LastModifiedUtcTimestamp: " + healthEvent.LastModifiedUtcTimestamp);  
        Console.WriteLine("      LastOkTransitionAt: " + healthEvent.LastOkTransitionAt);  
        Console.WriteLine("      LastWarningTransitionAt: " + healthEvent.LastWarningTransitionAt);  
        Console.WriteLine("      LastErrorTransitionAt: " + healthEvent.LastErrorTransitionAt);  
    }  
  
    Console.WriteLine("  UnhealthyEvaluations:");  
    foreach (HealthEvaluation healthEvaluation in serviceHealth.UnhealthyEvaluations)  
    {  
        Console.WriteLine("    UnhealthyEvaluation:");  
        Console.WriteLine("      Description: " + healthEvaluation.Description);  
        Console.WriteLine("      Kind: " + healthEvaluation.Kind);  
        Console.WriteLine("      AggregatedHealthState: " + healthEvaluation.AggregatedHealthState);  
    }  
  
    Console.WriteLine("  PartitionHealthStates:");  
    foreach (PartitionHealthState2 parititonHealthState in serviceHealth.PartitionHealthStates)  
    {  
        Console.WriteLine("    PartitionHealthState:");  
        Console.WriteLine("      PartitionId: " + parititonHealthState.PartitionId);  
        Console.WriteLine("      AggregatedHealthState: " + parititonHealthState.AggregatedHealthState);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Service Health:  
  Name: fabric:/WordCount/WordCount.Service  
  Aggregated Health State: Ok  
  HealthEvents:  
    HealthEvent:  
      Description: Service has been created.  
      HealthState: Ok  
      SourceId: System.FM  
      Property: State  
      IsExpired: False  
      RemoveWhenExpired: False  
      SequenceNumber: 3  
      SourceUtcTimestamp: 130742924296332054  
      TimeToLiveInMilliSeconds: 922337203685477  
      LastModifiedUtcTimestamp: 130742924304144928  
      LastOkTransitionAt: 130742924304144928  
      LastWarningTransitionAt: 0  
      LastErrorTransitionAt: 0  
  UnhealthyEvaluations:  
  PartitionHealthStates:  
    PartitionHealthState:  
      PartitionId: dd612667-22dc-4168-bc0d-24e1eee03845  
      AggregatedHealthState: Ok  
*/  
```