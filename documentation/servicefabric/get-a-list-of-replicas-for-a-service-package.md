---
title: "Get a list of replicas for a service package"
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
ms.assetid: 0d8035de-4374-4084-ab6e-7571ba0381c0
caps.latest.revision: 11
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
# Get a list of replicas for a service package
Gets the Service Fabric replicas of the specified node, application, and service package name.  
  
## Request  
 See [Common parameters and headers](../ServiceFabricREST/replica.md#bk_common) for headers and parameters that are used by all requests related to replicas.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/nodes/{node-name}/$/getapplications/{application-name}/$/getreplicas?api-version=1.0&PartitionId={partition-id}&ServicePackageName={service-package-name}&api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
  
[  
    {  
        "ServiceKind": 2,  
        "ServiceName": "fabric:\\/WordCount\\/WordCount.Service",  
        "ServiceTypeName": "WordCount.Service",  
        "ServiceManifestVersion": "",  
        "ServiceManifestName": "WordCount.Service",  
        "CodePackageName": "Code",  
        "PartitionId": "23e3101b-d33c-44db-94b9-1689407ec1cc",  
        "ReplicaId": "130741286282693495",  
        "ReplicaRole": 4,  
        "ReplicaStatus": 3,  
        "Address": ""  
    }  
]  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceKind|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|ReplicaId|The replica ID.|  
|ReplicaRole|The replica role.<br /><br /> Possible values are:<br /><br /> -   Indicates the initial role that a replica is created in. The value is zero.<br />-   None - Specifies that the replica has no responsibility in regard to the replica set. The value is 1<br />-   Primary - Refers to the replica in the set on which all read and write operations are complete in order to enforce strong consistency semantics. Read operations are handled directly by the Primary replica, while write operations must be acknowledged by a quorum of the replicas in the replica set. There can only be one Primary replica in a replica set at a time. The value is 2.<br />-   IdleSecondary - Refers to a replica in the set that receives a state transfer from the Primary replica to prepare for becoming an active Secondary replica. There can be multiple Idle Secondary replicas in a replica set at a time. Idle Secondary replicas do not count as a part of a write quorum. The value is 3.<br />-   ActiveSecondary - Refers to a replica in the set that receives state updates from the Primary replica, applies them, and sends acknowledgements back. Secondary replicas must participate in the write quorum for a replica set. There can be multiple active Secondary replicas in a replica set at a time. The number of active Secondary replicas is configurable that the reliability subsystem should maintain. The value is 4.|  
|ReplicaStatus|The replica status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the replica status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   InBuild - The replica is being built. This means that a primary replica is seeding this replica. The value is 1.<br />-   Standby - The replica is in standby. The value is 2.<br />-   Ready - The replica is ready. The value is 3.<br />-   Down - The replica is down. The value is 4.<br />-   Dropped - Replica is dropped. This means that the replica has been removed from the replica set. If it is persisted, its state has been deleted. The value is 5.|  
|PartitionId|The partition ID.|  
|ServiceName|The service name.|  
|Address|The service address.|  
|The service address.|The code package name.|  
|ServiceManifestName|The service manifest name.|  
|ServiceManifestVersion|The service manifest version.|  
|ServiceTypeName|The service manifest type name.|  
  
## Examples  
 The following example displays the replicas of a service package.  
  
```  
  
/// <summary>  
/// Class similar to DeployedStatefulServiceReplica. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class DeployedStatefulServiceReplica2  
{  
    public ServiceKind ServiceKind;  
    public string ServiceName;  
    public string ServiceTypeName;  
    public string ServiceManifestName;  
    public string CodePackageName;  
    public Guid Partitionid;  
    public string ReplicaId;  
    public ReplicaRole ReplicaRole;  
    public ServiceReplicaStatus ReplicaStatus;  
    public string Address;  
}  
  
/// <summary>  
/// Gets the list of replicas of a specific application on a specific node.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetReplicasOfServicePackageName(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Nodes/{0}/$/GetApplications/{1}/$/GetReplicas?api-version={2}",  
        "Node.1",       // Name of node  
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
        Console.WriteLine("Error getting the list of replicas:");  
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
    List<DeployedStatefulServiceReplica2> replicas = jss.Deserialize<List<DeployedStatefulServiceReplica2>>(responseString);  
  
    Console.WriteLine("List of Replicas:");  
    foreach (DeployedStatefulServiceReplica2 replica in replicas)  
    {  
        Console.WriteLine("  Replica:");  
        Console.WriteLine("    ServiceKind: " + replica.ServiceKind);  
        Console.WriteLine("    ServiceName: " + replica.ServiceName);  
        Console.WriteLine("    ServiceTypeName: " + replica.ServiceTypeName);  
        Console.WriteLine("    ServiceManifestName: " + replica.ServiceManifestName);  
        Console.WriteLine("    CodePackageName: " + replica.CodePackageName);  
        Console.WriteLine("    Partitionid: " + replica.Partitionid);  
        Console.WriteLine("    ReplicaId: " + replica.ReplicaId);  
        Console.WriteLine("    ReplicaRole: " + replica.ReplicaRole);  
        Console.WriteLine("    ReplicaStatus: " + replica.ReplicaStatus);  
        Console.WriteLine("    Address: " + replica.Address);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of Replicas:  
  Replica:  
    ServiceKind: Stateful  
    ServiceName: fabric:/WordCount/WordCount.Service  
    ServiceTypeName: WordCount.Service  
    ServiceManifestName: WordCount.Service  
    CodePackageName: Code  
    Partitionid: 23e3101b-d33c-44db-94b9-1689407ec1cc  
    ReplicaId: 130741286282693495  
    ReplicaRole: ActiveSecondary  
    ReplicaStatus: Ready  
    Address:  
*/  
  
```