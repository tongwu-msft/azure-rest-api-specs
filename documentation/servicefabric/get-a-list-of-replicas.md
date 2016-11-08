---
title: "Get a list of replicas"
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
ms.assetid: 07285b27-701a-43d5-ae52-b64f03a39963
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
# Get a list of replicas
Gets the list of replicas for the specified Service Fabric partition.  
  
## Request  
 See [Common parameters and headers](replica.md#bk_common) for parameters and headers that are used by all requests related to replicas.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI gets the list of replicas:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions/{partition-id}/$/GetReplicas?api-version={api-version}`|  
|GET|The following URI gets the specified replica:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions/{partition-id}/$/GetReplicas/{replica-id}?api-version={api-version}`|  
|GET|The following URI gets the list of replicas:<br /><br /> `<URI>/Services/{service-name}/$/GetPartitions/{partition-Id}/$/GetReplicas?api-version={api-version}`|  
|GET|The following URI gets the specified replica:<br /><br /> `<URI>/Services/{service-name}/$/GetPartitions/{partition-Id}/$/GetReplicas/{replica-id}?api-version={api-version}`|  
|GET|The following URI gets the list of replicas:<br /><br /> `<URI>/Partitions/{partition-id}/$/GetReplicas?api-version={api-version}`|  
|GET|The following URI gets the specified replica:<br /><br /> `<URI>/Partitions/{partition-id}/$/GetReplicas/{replica-id}?api-version={api-version}`|  
|GET|The following URI gets the list of replicas with continuation token:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions/{partition-id}/$/GetReplicas?api-version={api-version}&ContinuationToken={continuation-token}`|  
|GET|The following URI gets the list of replicas with continuation token:<br /><br /> `<URI>/Services/{service-name}/$/GetPartitions/{partition-Id}/$/GetReplicas/{replica-id}?api-version={api-version}&ContinuationToken={continuation-token}`|  
|GET|The following URI gets the list of replicas with continuation token:<br /><br /> `<URI>/Partitions/{partition-id}/$/GetReplicas?api-version=2.0&ContinuationToken={continuation-token}`|  
  
### URI Parameters  
  
|URI Parameters|Required|Description|  
|--------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous get service list call when the results do not fit one message. Can be used to get next page of results.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{“Items”:  
[  
    {  
        "ServiceKind": 2,  
        "ReplicaId": "130742924307582431",  
        "ReplicaRole": 2,  
        "ReplicaStatus": 3,  
        "HealthState": 1,  
        "Address": "http:\\/\\/localhost:32002\\/dd612667-22dc-4168-bc0d-24e1eee03845\\/130742924307582431\\/32d2acbc-c434-4e60-8064-0c8ab0ad8dff",  
        "NodeName": "Node.3",  
        "LastInBuildDurationInSeconds": "8"  
    },  
    {  
        "ServiceKind": 2,  
        "ReplicaId": "130742924402696298",  
        "ReplicaRole": 4,  
        "ReplicaStatus": 3,  
        "HealthState": 1,  
        "Address": "",  
        "NodeName": "Node.2",  
        "LastInBuildDurationInSeconds": "5"  
    },  
    {  
        "ServiceKind": 2,  
        "ReplicaId": "130742924402696299",  
        "ReplicaRole": 4,  
        "ReplicaStatus": 3,  
        "HealthState": 1,  
        "Address": "",  
        "NodeName": "Node.5",  
        "LastInBuildDurationInSeconds": "5"  
    }  
],  
“ContinuationToken”=”130742924402696299”  
}  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceKind|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|ReplicaId|The replica ID.|  
|ReplicaRole|The replica role.<br /><br /> Possible values are:<br /><br /> -   Indicates the initial role that a replica is created in. The value is zero.<br />-   None - Specifies that the replica has no responsibility in regard to the replica set. The value is 1.<br />-   Primary - Refers to the replica in the set on which all read and write operations are complete in order to enforce strong consistency semantics. Read operations are handled directly by the Primary replica, while write operations must be acknowledged by a quorum of the replicas in the replica set. There can only be one Primary replica in a replica set at a time. The value is 2.<br />-   IdleSecondary - Refers to a replica in the set that receives a state transfer from the Primary replica to prepare for becoming an active Secondary replica. There can be multiple Idle Secondary replicas in a replica set at a time. Idle Secondary replicas do not count as a part of a write quorum. The value is 3.<br />-   ActiveSecondary - Refers to a replica in the set that receives state updates from the Primary replica, applies them, and sends acknowledgements back. Secondary replicas must participate in the write quorum for a replica set. There can be multiple active Secondary replicas in a replica set at a time. The number of active Secondary replicas is configurable that the reliability subsystem should maintain. The value is 4.|  
|ReplicaStatus|The replica status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   InBuild - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.<br />-   Standby - The replica is in standby. The value is 2.<br />-   Ready - The replica is ready. The value is 3.<br />-   Down - The replica is down. The value is 4.<br />-   Dropped - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.|  
|HealthState|The replica health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|Address|The replica address.|  
|NodeName|The node name.|  
|LastInBuildDurationInSeconds|The last in build duration in seconds.|  
|ContinuationToken|String that represents a continuation token. Returned when the results do not fit one message. Can be used to get next page of results by specifying ContinuationToken with this value in next call.|  
  
## Examples  
 The following example displays the list of replicas for the specified partition.  
  
```  
/// <summary>  
/// Class similar to Partition. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Partition2  
{  
    public ServiceKind ServiceKind { get; set; }  
    public ServicePartitionInformation2 PartitionInformation { get; set; }  
    public ServicePartitionStatus PartitionStatus { get; set; }  
    public HealthState HealthState { get; set; }  
    public long MinReplicaSetSize { get; set; }  
    public long TargetReplicaSetSize { get; set; }  
    public Epoch2 CurrentConfigurationEpoch { get; set; }  
    public long InstanceCount { get; set; }  
}  
  
/// <summary>  
/// Class similar to ServicePartitionInformation. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServicePartitionInformation2  
{  
    public ServicePartitionKind ServicePartitionKind { get; set; }  
    public Guid Id { get; set; }  
}  
  
/// <summary>  
/// Class similar to Epoch. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Epoch2  
{  
    public string ConfigurationVersion { get; set; }  
    public string DataLossVersion { get; set; }  
}  
  
/// <summary>  
/// Class similar to Replica. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Replica2  
{  
    public string ReplicaId { get; set; }  
    public ReplicaRole ReplicaRole { get; set; }  
    public ReplicaStatus ReplicaStatus { get; set; }  
    public ServiceKind ServiceKind { get; set; }  
    public HealthState HealthState { get; set; }  
    public string NodeName { get; set; }  
    public string Address { get; set; }  
    public string LastInBuildDurationInSeconds { get; set; }  
}  
  
/// <summary>  
/// Gets the list of replicas for a given application, service, and partition.  
/// </summary>  
/// <remarks>  
/// Gets the list of partitions for WordCount/WordCount.Service, then gets the list of replicas  
/// for the first partition.  
/// </remarks>  
/// <param name="clusterUri">The URI of the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetListOfReplicas(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    //  
    // Get Partitions.  
    //  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetPartitions?api-version={2}",  
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
        Console.WriteLine("Error getting partitions:");  
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
    List<Partition2> partitions = jss.Deserialize<List<Partition2>>(responseString);  
  
    if (partitions == null || partitions.Count == 0)  
    {  
        Console.WriteLine("Error: Zero partitions found for the application.");  
        return false;  
    }  
  
    //  
    // Get Partition Health.  
    //  
  
    // Create the request and add URL parameters.  
    requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetPartitions/{2}/$/GetReplicas?api-version={3}",  
        "WordCount",                            // Application Name  
        "WordCount.Service",                    // Service Name  
        partitions[0].PartitionInformation.Id,  // Partition ID  
        "1.0"));                                // api-version  
  
    request = (HttpWebRequest)WebRequest.Create(requestUri);  
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
        Console.WriteLine("Error getting list of replicas:");  
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
    List<Replica2> replicas = jss.Deserialize<List<Replica2>>(responseString);  
  
    Console.WriteLine("List of replicas:");  
    foreach (Replica2 replica in replicas)  
    {  
        Console.WriteLine("  Replica:");  
        Console.WriteLine("    ReplicaId: " + replica.ReplicaId);  
        Console.WriteLine("    ReplicaRole: " + replica.ReplicaRole);  
        Console.WriteLine("    ReplicaStatus: " + replica.ReplicaStatus);  
        Console.WriteLine("    ServiceKind: " + replica.ServiceKind);  
        Console.WriteLine("    HealthState: " + replica.HealthState);  
        Console.WriteLine("    NodeName: " + replica.NodeName);  
        Console.WriteLine("    Address: " + replica.Address);  
        Console.WriteLine("    LastInBuildDurationInSeconds: " + replica.LastInBuildDurationInSeconds);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of replicas:  
    Replica:  
    ReplicaId: 130742924307582431  
    ReplicaRole: Primary  
    ReplicaStatus: 3  
    ServiceKind: Stateful  
    HealthState: Ok  
    NodeName: Node.3  
    Address: http://localhost:32002/dd612667-22dc-4168-bc0d-24e1eee03845/1307429  
24307582431/32d2acbc-c434-4e60-8064-0c8ab0ad8dff  
    LastInBuildDurationInSeconds: 8  
    Replica:  
    ReplicaId: 130742924402696298  
    ReplicaRole: ActiveSecondary  
    ReplicaStatus: 3  
    ServiceKind: Stateful  
    HealthState: Ok  
    NodeName: Node.2  
    Address:  
    LastInBuildDurationInSeconds: 5  
    Replica:  
    ReplicaId: 130742924402696299  
    ReplicaRole: ActiveSecondary  
    ReplicaStatus: 3  
    ServiceKind: Stateful  
    HealthState: Ok  
    NodeName: Node.5  
    Address:  
    LastInBuildDurationInSeconds: 5  
*/  
  
```