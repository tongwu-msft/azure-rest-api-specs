---
title: "Get the description of a service"
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
ms.assetid: 10f90f1d-debc-4f9b-9a2e-001f94eac056
caps.latest.revision: 23
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
# Get the description of a service
Gets the description of the specified service.  
  
## Request  
 See [Common parameters and headers](service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetDescription?api-version={api-version}`|  
|GET|`<URI>/Services/{service-name}/$/GetDescription?api-version={api-version}`|  
  
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
|InstanceCount|If ServiceKind is Stateless, this gives the number of instances of the stateful service replicas|  
|TargetReplicaSetSize|If ServiceKind is Stateful, The target replica set size as a number.|  
|MinReplicaSetSize|If ServiceKind is Stateful, The minimum replica set size as a number.|  
|HasPersistedState|If ServiceKind is stateful,Whether this service has persisted state as true &#124; false.|  
|PlacementConstraints|The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".|  
|CorrelationScheme|The correlation scheme as an array of ServiceCorrelationDescription objects.|  
|ServiceLoadMetrics|The service load metrics as an array of ServiceLoadMetricDescription objects.|  
|ServicePlacementPolicies|The service placement policies as an array of ServicePlacementPolicyDescription objects.|  
|Flags|If the ServiceKind is stateful, this is a bitmask that corresponds to the Stateful Service Failover Settings.<br /><br /> `None` – The value is 0<br /><br /> `ReplicaRestartWaitDuration` – The value is 1<br /><br /> `QuorumLossWaitDuration` – The value is 2<br /><br /> `StandByReplicaKeepDuration` – The value is 4|  
|ReplicaRestartWaitDurationSeconds|Gives the replica restart wait duration as the number of seconds. This parameter indicates that the Replica restart wait duration was set to a non default value during service creation. This is how long Service Fabric waits after a persistent replica goes down before building a new one. For in-memory only services, Service Fabric ignores this value and creates new replicas immediately.|  
|QuorumLossWaitDurationSeconds|Gives the quorum loss wait duration as the number of seconds. This parameter indicates that the Quorum loss wait duration was set to a non default value during service creation. Default is infinity.<br /><br /> This is the amount of time Service Fabric waits after the service goes into Quorum Loss (loss of a majority of replicas) before declaring potential dataloss. This should always be a manual/human decision. Usually, it should not need changing.|  
|StandByReplicaKeepDurationSeconds|Gives the standby replica keep duration as the number of seconds. This parameter indicates that the Standby replica keep duration was set to a non default value during service creation.<br /><br /> If a persistent replica goes down and then comes back, but Service Fabric already has enough replicas in the cluster, Service Fabric keeps the replica around for the specified StandByReplicaKeepDurationSeconds. If something fails before this time expires, the replica may be picked and promoted, rather than building a new one from scratch. If that hasn’t happened when this time expires, the standby replica is dropped.|  
|DefaultMoveCost|The default cost for a move. Higher costs make it less likely that the Cluster Resource Manager will move the replica when trying to balance the cluster.|  
|IsDefaultMoveCostSpecified|Value of `true` if the default move cost is specified; `false` if the default move cost is not specified.|  
  
### PartitionDescription  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|PartitionScheme|Yes|Number|The partition scheme of this service. Possible values are:<br /><br /> -   `Invalid` - Indicates the partition kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   `Singleton` - Indicates that the partition is based on string names, and is a SingletonPartitionSchemeDescription object, The value is 1.<br />-   `Int64Range` - Indicates that the partition is based on Int64 key ranges, and is a UniformInt64RangePartitionSchemeDescription object. The value is 2.<br />-   `Named` - Indicates that the partition is based on string names, and is a NamedPartitionSchemeDescription object. The value is 3|  
|Count|Yes for `Int64Range` and `Named` partition schemes|Number|Number of partitions|  
|Names|Yes for `Named` partition scheme|Array of String|Array of size specified by the ‘Count’ parameter, for the names of the partitions|  
|LowKey|Yes for `Int64Range` partition scheme|String|String indicating the lower bound of the partition key range that should be split between the partition ‘Count’|  
|HightKey|Yes for `Int64Range` partition scheme|String|String indicating the upper bound of the partition key range that should be split between the partition ‘Count’|  
  
### ServiceCorrelationDescription  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|Name|Yes|String|The name of the metric.If the service chooses to report load during runtime, the load metric name should match the name that is specified in Name exactly.Note that metric names are case sensitive.|  
|ServiceLoadMetricWeight|No|Number|The service load metric relative weight, compared to other metrics configured for this service, as a number. A value of 0 is Zero (disables resource balancing for this metric), 1 is Low, 2 is Medium, and 3 is High.During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.|  
|PrimaryDefaultLoad|No|Number|The default amount of load, as a number, that this service creates for this metric when it is a Primary replica.|  
|SecondaryDefaultLoad|No|Number|The default amount of load, as a number, that this service creates for this metric when it is a Secondary replica.|  
  
### ServicePlacementPolicyDescription  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|Type|||The service placement policy type.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that the type of the policy specified was unknown or invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   InvalidDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementInvalidDomainPolicyDescription, which indicates that a particular fault or upgrade domain cannot be used for placement of this service. The value is 1.<br />-   RequireDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementRequireDomainDistributionPolicyDescription indicating that the replicas of the service must be placed in a specific domain. The value is 2.<br />-   PreferPrimaryDomain - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementPreferPrimaryDomainPolicyDescription, which indicates that if possible the Primary replica for the partitions of the service should be located in a particular domain as an optimization.<br />-   RequireDomainDistribution - Indicates that the ServicePlacementPolicyDescription is a ServicePlacementRequireDomainDistributionPolicyDescription, indicating that the system will disallow placement of any two replicas from the same partition in the same domain at any time.|  
  
## Examples  
 The following example displays the specified service.  
  
```  
/// <summary>  
/// Class similar to ServiceDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceDescription2  
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
/// Gets the service description.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServiceDescription(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetDescription?api-version={2}",  
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
    Console.WriteLine("Service Description:");  
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
  
Service Description:  
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