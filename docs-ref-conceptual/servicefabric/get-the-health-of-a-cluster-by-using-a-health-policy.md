---
title: "Get the health of a cluster by using a health policy"
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
ms.assetid: ea2dad07-be08-4d06-9cec-5a46ae83f9bd
caps.latest.revision: 10
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
# Get the health of a cluster by using a health policy
Gets the health of a Service Fabric cluster.  
  
## Request  
 See [Common parameters and headers](cluster.md#bk_common) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|The following URI evaluates the cluster health:<br />`<URI>/$/GetClusterHealth?api-version=2.0`|  
|POST|The following URI evaluates the cluster health with events filter: <br />`<URI>$/GetClusterHealth?api-version=2.0&EventsHealthStateFilter={EventsHealthStateFilter}`|  
|POST|The following URI evaluates the cluster health and applies filters for events, nodes and applications: <br />`<URI>$/GetClusterHealth?api-version=2.0& NodesHealthStateFilter={ NodesHealthStateFilter}&ApplicationsHealthStateFilter={ApplicationsHealthStateFilter}& EventsHealthStateFilter={EventsHealthStateFilter}`|  
  
-   Use {EventsHealthStateFilter} (optional) to filter the collection of HealthEvent objects reported on the cluster based on health state. The value can be obtained from members or bitwise operations on members of [HealthStateFilter](https://msdn.microsoft.com/en-us/library/azure/system.fabric.health.healthstatefilter.aspx). Only events that match the filter will be returned. All events will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {NodesHealthStateFilter} (optional) to filter the collection of NodeHealthState objects. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only nodes that match the filter will be returned. All nodes will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   Use {ApplicationsHealthStateFilter} (optional) to filter the collection of ApplicationHealthState objects. The value can be obtained from members or bitwise operations on members of HealthStateFilter. Only applications that match the filter will be returned. All applications will be used to evaluate the aggregated health state. If not specified, all entries will be returned. Possible values are:  
  
    -   Default - Default value. Matches any HealthState. The value is zero.  
  
    -   None - Filter that doesn’t match any HealthState value. Used in order to return no results on a given collection of states. The value is 1.  
  
    -   Ok - Filter that matches input with HealthState value Ok. The value is 2.  
  
    -   Warning - Filter that matches input with HealthState value Warning. The value is 4.  
  
    -   Error - Filter that matches input with HealthState value Error. The value is 8.  
  
    -   All - Filter that matches input with any HealthState value. The value is 65535.  
  
-   ClusterHealthPolicy which describes the health policy used to evaluate the cluster and nodes. If not present, the health evaluation uses the health policy from cluster manifest or the default health policy. ClusterHealthPolicy fields:  
  
    ```  
    {  
            "ConsiderWarningAsError": false|true,  
            "MaxPercentUnhealthyNodes": <value>,  
            "MaxPercentUnhealthyApplications": <value>  
            "ApplicationTypeHealthPolicyMap":[{"Key":"<value>","Value":<value>}]  
    }  
  
    ```  
  
|Element Name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ConsiderWarningAsError|Yes|Boolean|Determines whether warnings should be treated with the same severity as errors. Value of `true` to treat warnings as errors; `false` to not treat warnings as errors.|  
|MaxPercentUnhealthyNodes|Yes|Number|The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10.|  
|MaxPercentUnhealthyApplications|Yes|Number|The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10.|  
|ApplicationTypeHealthPolicyMap|Yes||Specifies the map that defines the maximum percentage of unhealthy applications that are allowed per application type. Application types in this map are evaluated using specific percentages rather than the global *MaxPercentUnhealthyApplications* percentage.  For example, if some applications of a type are critical, the cluster administrator can add an entry to the map for that application type and assign it a value of 0% (that is, do not tolerate any failures). All other applications can be evaluated with *MaxPercentUnhealthyApplications* set to 20% to tolerate some failures out of the thousands of application instances. The application type health policy map is used only if the cluster manifest enables application type health evaluation using the configuration entry for **HealthManager/EnableApplicationTypeHealthEvaluation**.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
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
|HealthState|The health state. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|TimeToLiveInMilliSeconds|The time for this health report to be valid in milliseconds. If not specified, time to live defaults to infinite value. To explicitly set Infinite time to live, use value “922337203685477”.|  
|Description|The health state description. The maximum string length for the description is 4096 characters.|  
|SequenceNumber|The sequence number for this health report as a numeric string. If not specified, a sequence number is auto-generated by the health client.|  
|RemoveWhenExpired|`true` to remove the health report after the time to live expires; `false` to keep the health event after the time to live expires. If not specified, it defaults to false.|  
|AggregatedHealthState|The aggregated health state. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|UnhealthyEvaluations|The description of the health evaluation, which represents a summary of the evaluation process.|  
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
static void GetClusterHealth(Uri clusterUri)  
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
    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
    {  
        using (StreamReader streamReader = new StreamReader(response.GetResponseStream(), true))  
        {  
            // Capture the response string.  
            responseString = streamReader.ReadToEnd();  
        }  
    }  
  
    // Dynamically create a JSON object to access the JSON data.  
    JavaScriptSerializer jss = new JavaScriptSerializer();  
    var clusterHealth = jss.Deserialize<dynamic>(responseString);  
  
    Console.WriteLine("Cluster Health:");  
    Console.WriteLine("  Aggregated Health State: " + clusterHealth["AggregatedHealthState"]);  
  
    // Display the node health states.  
    Console.WriteLine("  Node Health States:");  
    foreach (var nodeHealthState in clusterHealth["NodeHealthStates"])  
    {  
        Console.WriteLine("    Name: " + nodeHealthState["Name"]);  
        Console.WriteLine("      ID: " + nodeHealthState["Id"]["Id"]);  
        Console.WriteLine("      Aggregated Health State: " + nodeHealthState["AggregatedHealthState"]);  
    }  
  
    // Display the application health states.  
    Console.WriteLine("  Application Health States:");  
    foreach (var applicationHealthState in clusterHealth["ApplicationHealthStates"])  
    {  
        Console.WriteLine("    Name: " + applicationHealthState["Name"]);  
        Console.WriteLine("      Aggregated Health State: " + applicationHealthState["AggregatedHealthState"]);  
    }  
  
    // Display the health events.  
    Console.WriteLine("  Health Events:");  
    foreach (var healthEvents in clusterHealth["HealthEvents"])  
    {  
        Console.WriteLine("    Health Event:");  
        foreach (var healthEvent in healthEvents)  
        {  
            Console.WriteLine("      " + healthEvent.Key + ": " + healthEvent.Value);  
        }  
    }  
}  
  
/*  
This code produces output similar to the following:  
  
Cluster Health:  
    Aggregated Health State: 2  
    Node Health States:  
    Name: Node4  
        ID: b5bd41bc26a079f4df3791b2b5d42e5  
        Aggregated Health State: 1  
    Name: Node1  
        ID: 10152272d1e44a94356a41d96dc9b466  
        Aggregated Health State: 1  
    Name: Node2  
        ID: 15091e9851978afe10f2f3ab37c1d2f0  
        Aggregated Health State: 1  
    Name: Node5  
        ID: 6e48b9c722325a66f805e2890bb7dd30  
        Aggregated Health State: 1  
    Name: Node3  
        ID: 880f1f5072c2c4805e9cb15ec710d083  
        Aggregated Health State: 1  
    Application Health States:  
    Name: fabric:/System  
        Aggregated Health State: 2  
    Name: fabric:/myapp/calculator  
        Aggregated Health State: 1  
    Health Events:  
*/  
```