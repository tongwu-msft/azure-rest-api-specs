---
title: "Get the description of a service group"
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
ms.assetid: d9334b7f-0691-416c-8175-9d5775d45e94
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
# Get the description of a service group
Gets the description of the specified service group.  
  
## Request  
 See [Common parameters and headers](service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetServiceGroupDescription?api-version={api-version}`|  
|GET|`<URI>/Services/{service-name}/$/GetServiceGroupDescription?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|application-name|Yes|Application to which the service belongs to|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "ServiceKind": 2,  
    "ApplicationName": "fabric:\\/WordCount",  
    "ServiceName": "fabric:\\/WordCount\\/WordCount.Service",  
    "ServiceTypeName": "WordCount.Service",  
    "InitializationData": [],  
    "PartitionDescription": {  
        "PartitionScheme": 2,  
        "Count": 1,  
        "LowKey": "1",  
        "HighKey": "26"  
    },  
    "TargetReplicaSetSize": 3,  
    "MinReplicaSetSize": 2,  
    "HasPersistedState": true,  
    "PlacementConstraints": "",  
    "CorrelationScheme": [],  
    "ServiceLoadMetrics": [],  
    "ServicePlacementPolicies": [],  
    "Flags": 0,  
    "DefaultMoveCost": 1,  
    "IsDefaultMoveCostSpecified": false  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceKind|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|ApplicationName|The application name.|  
|ServiceName|The service name.|  
|ServiceTypeName|The service type name.|  
|InitializationData|The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.|  
|PartitionDescription|The partition description as an object.|  
|PartitionScheme|The partition scheme.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Singleton - Indicates a singleton partition scheme. The value is 1.<br />-   UniformInt64Range - Indicates a uniform Int64 range partition scheme. The value is 2.<br />-   Named - Indicates a named partition scheme. The value is 3.|  
|Count|The partition count.|  
|LowKey|The low key.|  
|HighKey|The high key.|  
|InstanceCount|If ServiceKind is Stateless, this gives the number of instances of the stateful service replicas|  
|TargetReplicaSetSize|The target replica set size as a number.|  
|MinReplicaSetSize|The minimum replica set size as a number.|  
|HasPersistedState|Whether this service has persisted state as true &#124; false.|  
|PlacementConstraints|The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".|  
|CorrelationScheme|The correlation scheme as an array of JSON objects.|  
|ServiceName|The service name as a URI.|  
|ServiceCorrelationScheme|The service correlation scheme as a number. The service correlation scheme values can be 0 for invalid, 1 for affinity, 2 for aligned affinity, and 3 for non-aligned affinity.|  
|ReplicaRestartWaitDurationSeconds|The replica restart wait duration as the number of seconds.|  
|ServiceLoadMetrics|The service load metrics as an array of objects.|  
|Name|The name of the metric.<br /><br /> If the service chooses to report load during runtime, the load metric name should match the name that is specified in Name exactly.<br /><br /> Note that metric names are case sensitive.|  
|ServiceLoadMetricWeight|The service load metric relative weight, compared to other metrics configured for this service, as a number. A value of 0 is Zero (disables resource balancing for this metric), 1 is Low, 2 is Medium, and 3 is High.<br /><br /> During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.|  
|PrimaryDefaultLoad|The default amount of load, as a number, that this service creates for this metric when it is a Primary replica.|  
|SecondaryDefaultLoad|The default amount of load, as a number, that this service creates for this metric when it is a Secondary replica.|  
|ServicePlacementPolicies|The service placement policies as an array of objects.|  
|Type|The service placement policy type.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that the type of the policy specified was unknown or invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   InvalidDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementInvalidDomainPolicyDescription, which indicates that a particular fault or upgrade domain cannot be used for placement of this service. The value is 1.<br />-   RequireDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementRequireDomainDistributionPolicyDescription indicating that the replicas of the service must be placed in a specific domain. The value is 2.<br />-   PreferPrimaryDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementPreferPrimaryDomainPolicyDescription, which indicates that if possible the Primary replica for the partitions of the service should be located in a particular domain as an optimization.<br />-   RequireDomainDistribution - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementRequireDomainDistributionPolicyDescription, indicating that the system will disallow placement of any two replicas from the same partition in the same domain at any time.|  
|Flags|Corresponds to the StatefulServiceFailoverSettings enum.|  
|DefaultMoveCost|The default cost for a move.|  
|IsDefaultMoveCostSpecified|Value of `true` if the default move cost is specified; `false` if the default move cost is not specified.|  
  
## Examples  
 The following example displays the specified service.  
  
```  
/// <summary>  
/// Class similar to ServiceGroupDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceGroupDescription2  
{  
    public string ApplicationName { get; set; }  
    public string ServiceName { get; set; }  
    public string ServiceTypeName { get; set; }  
    public ServiceKind ServiceKind { get; set; }  
    public bool HasPersistedState { get; set; }  
    public long MinReplicaSetSize { get; set; }  
    public long TargetReplicaSetSize { get; set; }  
    public string PlacementConstraints { get; set; }  
    public long QuorumLossWaitDurationSeconds { get; set; }  
    public long ReplicaRestartWaitDurationSeconds { get; set; }  
    public long StandByReplicaKeepDurationSeconds { get; set; }  
    public bool IsDefaultMoveCostSpecified { get; set; }  
    public long DefaultMoveCost { get; set; }  
    public int Flags { get; set; }  
    public List<byte> InitializationData { get; set; }  
    public PartitionDescription2 PartitionDescription { get; set; }  
    public List<ServiceCorrelationDescription> CorrelationScheme { get; set; }  
    public List<LoadMetric2> ServiceLoadMetrics { get; set; }  
    public List<ServicePlacementPolicyDescription> ServicePlacementPolicies { get; set; }  
}  
  
/// <summary>  
/// Class similar to PartitionDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class PartitionDescription2  
{  
    public PartitionScheme PartitionScheme { get; set; }  
    public long Count { get; set; }  
    public string LowKey { get; set; }  
    public string HighKey { get; set; }  
}  
  
/// <summary>  
/// Class similar to LoadMetric. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class LoadMetric2  
{  
    public string Name { get; set; }  
    public long Weight { get; set; }  
    public long PrimaryDefaultLoad { get; set; }  
    public long SecondaryDefaultLoad { get; set; }  
}  
  
/// <summary>  
/// Gets the service group description.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServiceGroupDescription(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetServiceGroupDescription?api-version={2}",  
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
        Console.WriteLine("Error getting service description:");  
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
    ServiceDescription2 serviceDescription = jss.Deserialize<ServiceDescription2>(responseString);  
  
    // Display service description  
    Console.WriteLine("Service Group Description:");  
    Console.WriteLine("  ApplicationName: " + serviceDescription.ApplicationName);  
    Console.WriteLine("  ServiceName: " + serviceDescription.ServiceName);  
    Console.WriteLine("  ServiceTypeName: " + serviceDescription.ServiceTypeName);  
    Console.WriteLine("  ServiceKind: " + serviceDescription.ServiceKind);  
    Console.WriteLine("  HasPersistedState: " + serviceDescription.HasPersistedState);  
    Console.WriteLine("  MinReplicaSetSize: " + serviceDescription.MinReplicaSetSize);  
    Console.WriteLine("  TargetReplicaSetSize: " + serviceDescription.TargetReplicaSetSize);  
    Console.WriteLine("  PlacementConstraints: " + serviceDescription.PlacementConstraints);  
    Console.WriteLine("  QuorumLossWaitDurationSeconds: " + serviceDescription.QuorumLossWaitDurationSeconds);  
    Console.WriteLine("  ReplicaRestartWaitDurationSeconds: " + serviceDescription.ReplicaRestartWaitDurationSeconds);  
    Console.WriteLine("  StandByReplicaKeepDurationSeconds: " + serviceDescription.StandByReplicaKeepDurationSeconds);  
    Console.WriteLine("  IsDefaultMoveCostSpecified: " + serviceDescription.IsDefaultMoveCostSpecified);  
    Console.WriteLine("  DefaultMoveCost: " + serviceDescription.DefaultMoveCost);  
    Console.WriteLine("  Flags: " + serviceDescription.Flags);  
    Console.WriteLine("  InitializationData: " +   
        (serviceDescription.InitializationData.Count > 0 ? "Contains initialization data." : "Does not contain initialization data."));  
  
    Console.WriteLine("  PartitionDescription:");  
    Console.WriteLine("    PartitionScheme: " + serviceDescription.PartitionDescription.PartitionScheme);  
    Console.WriteLine("    Count: " + serviceDescription.PartitionDescription.Count);  
    Console.WriteLine("    HighKey: " + serviceDescription.PartitionDescription.HighKey);  
    Console.WriteLine("    LowKey: " + serviceDescription.PartitionDescription.LowKey);  
  
    Console.WriteLine("  CorrelationScheme:");  
    foreach (ServiceCorrelationDescription correlationDescription in serviceDescription.CorrelationScheme)  
    {  
        Console.WriteLine("    CorrelationDescription:");  
        Console.WriteLine("      ServiceName: " + correlationDescription.ServiceName);  
        Console.WriteLine("      Scheme: " + correlationDescription.Scheme);  
    }  
  
    Console.WriteLine("  ServiceLoadMetrics:");  
    foreach (LoadMetric2 serviceLoadMetric in serviceDescription.ServiceLoadMetrics)  
    {  
        Console.WriteLine("    ServiceLoadMetric:");  
        Console.WriteLine("      Name: " + serviceLoadMetric.Name);  
        Console.WriteLine("      Weight: " + serviceLoadMetric.Weight);  
        Console.WriteLine("      PrimaryDefaultLoad: " + serviceLoadMetric.PrimaryDefaultLoad);  
        Console.WriteLine("      SecondaryDefaultLoad: " + serviceLoadMetric.SecondaryDefaultLoad);  
    }  
  
    Console.WriteLine("  ServicePlacementPolicies:");  
    foreach (ServicePlacementPolicyDescription servicePlacementPolicy in serviceDescription.ServicePlacementPolicies)  
    {  
        Console.WriteLine("    ServicePlacementPolicy:");  
        Console.WriteLine("      Type: " + servicePlacementPolicy.Type);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Service Group Description:  
  ApplicationName: fabric:/WordCount  
  ServiceName: fabric:/WordCount/WordCount.Service  
  ServiceTypeName: WordCount.Service  
  ServiceKind: Stateful  
  HasPersistedState: True  
  MinReplicaSetSize: 2  
  TargetReplicaSetSize: 3  
  PlacementConstraints:  
  QuorumLossWaitDurationSeconds: 0  
  ReplicaRestartWaitDurationSeconds: 0  
  StandByReplicaKeepDurationSeconds: 0  
  IsDefaultMoveCostSpecified: False  
  DefaultMoveCost: 1  
  Flags: 0  
  InitializationData: Does not contain initialization data.  
  PartitionDescription:  
    PartitionScheme: UniformInt64Range  
    Count: 1  
    HighKey: 26  
    LowKey: 1  
  CorrelationScheme:  
  ServiceLoadMetrics:  
  ServicePlacementPolicies:  
*/  
  
```