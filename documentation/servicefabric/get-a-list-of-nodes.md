---
title: "Get a list of nodes"
ms.custom: ""
ms.date: "2016-12-14"
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
ms.assetid: 1ac7e1a6-eab8-437c-88a5-83558589f0ca
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
# Get a list of nodes
Gets the list of nodes in the Service Fabric cluster.  
  
## Request  
 See [Node](node.md) for headers and parameters that are used by all requests related to nodes.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|This URI can be used the get the list of nodes:<br /><br /> `<URI>/Nodes?api-version={api-version}`|  
|GET|This URI can be used to get the list of nodes with node status filter:<br /><br /> `<URI>/Nodes?api-version={api-version}&NodeStatusFilter={nodestatusfilter}`|  
|GET|This URI can be used the get the list of nodes with continuation token:<br /><br /> `<URI>/Nodes?api-version={api-version}&ContinuationToken={continuation-token}`|  
|GET|This URI can be used the get a node:<br /><br /> `<URI>/Nodes/{node-name}?api-version={api-version}`|  
  
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous get service list call when the results do not fit one message. Can be used to get next page of results.|  
|NodeStatusFilter|No|String that represents node status filter. Possible values are:<br /><br /> -   default (retrieves list of all nodes except with status unknown or removed)<br />-   all (retrieves list of all nodes)<br />-   up (retrieves list of nodes with status up)<br />-   down (retrieves list of nodes with status down)<br />-   enabling (retrieves list of nodes with status enabling)<br />-   disabling (retrieves list of nodes with status disabling)<br />-   unknown (retrieves list of nodes with status unknown)<br />-   removed (retrieves list of nodes with status removed)|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{“Items”:  
[[  
    {  
        "Name": "Node.4",  
        "IpAddressOrFQDN": "localhost",  
        "Type": "NodeType4",  
        "CodeVersion": "4.0.90.9490",  
        "ConfigVersion": "1.0",  
        "NodeStatus": 1,  
        "NodeUpTimeInSeconds": "7770",  
        “NodeDownTimeInSeconds":"0",
        "HealthState": 1,  
        "IsSeedNode": false,  
        "UpgradeDomain": "UD4",  
        "FaultDomain": "fd:\\/FD04",  
        "Id": {  
            "Id": "182043d0294b3f36e954e0397268b770"  
        },  
        "InstanceId": "130741255660417472",  
        "NodeDeactivationInfo": {  
            "NodeDeactivationIntent": 0,  
            "NodeDeactivationStatus": 0,  
            "NodeDeactivationTask": []  
        }  
    },  
    {  
        "Name": "Node.2",  
        "IpAddressOrFQDN": "localhost",  
        "Type": "NodeType2",  
        "CodeVersion": "4.0.90.9490",  
        "ConfigVersion": "1.0",  
        "NodeStatus": 1,  
        "NodeUpTimeInSeconds": "7770",  
        “NodeDownTimeInSeconds":"0",
        "HealthState": 1,  
        "IsSeedNode": true,  
        "UpgradeDomain": "UD2",  
        "FaultDomain": "fd:\\/FD02",  
        "Id": {  
            "Id": "1840a58b116c5f9c7a0b1837194c4205"  
        },  
        "InstanceId": "130741255660437483",  
        "NodeDeactivationInfo": {  
            "NodeDeactivationIntent": 0,  
            "NodeDeactivationStatus": 0,  
            "NodeDeactivationTask": []  
        }  
    },  
    {  
        "Name": "Node.1",  
        "IpAddressOrFQDN": "localhost",  
        "Type": "NodeType1",  
        "CodeVersion": "4.0.90.9490",  
        "ConfigVersion": "1.0",  
        "NodeStatus": 1,  
        "NodeUpTimeInSeconds": "7770",  
        “NodeDownTimeInSeconds":"0",
        "HealthState": 1,  
        "IsSeedNode": true,  
        "UpgradeDomain": "UD1",  
        "FaultDomain": "fd:\\/FD01",  
        "Id": {  
            "Id": "1880ec88a3187766a6da323399721f53"  
        },  
        "InstanceId": "130741255660407463",  
        "NodeDeactivationInfo": {  
            "NodeDeactivationIntent": 0,  
            "NodeDeactivationStatus": 0,  
            "NodeDeactivationTask": []  
        }  
    },  
    {  
        "Name": "Node.5",  
        "IpAddressOrFQDN": "localhost",  
        "Type": "NodeType5",  
        "CodeVersion": "4.0.90.9490",  
        "ConfigVersion": "1.0",  
        "NodeStatus": 1,  
        "NodeUpTimeInSeconds": "7770",  
        “NodeDownTimeInSeconds":"0",
        "HealthState": 1,  
        "IsSeedNode": false,  
        "UpgradeDomain": "UD5",  
        "FaultDomain": "fd:\\/FD05",  
        "Id": {  
            "Id": "18a05673ad5b226e2826584627c00a22"  
        },  
        "InstanceId": "130741255664615018",  
        "NodeDeactivationInfo": {  
            "NodeDeactivationIntent": 0,  
            "NodeDeactivationStatus": 0,  
            "NodeDeactivationTask": []  
        }  
    },  
    {  
        "Name": "Node.3",  
        "IpAddressOrFQDN": "localhost",  
        "Type": "NodeType3",  
        "CodeVersion": "4.0.90.9490",  
        "ConfigVersion": "1.0",  
        "NodeStatus": 1,  
        "NodeUpTimeInSeconds": "7770",  
        “NodeDownTimeInSeconds":"0",
        "HealthState": 1,  
        "IsSeedNode": true,  
        "UpgradeDomain": "UD3",  
        "FaultDomain": "fd:\\/FD03",  
        "Id": {  
            "Id": "18c04a60c5c8e287f4f4337ba8642205"  
        },  
        "InstanceId": "130741255660437483",  
        "NodeDeactivationInfo": {  
            "NodeDeactivationIntent": 0,  
            "NodeDeactivationStatus": 0,  
            "NodeDeactivationTask": []  
        }  
    }  
]}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The name of the node.|  
|IpAddressOrFQDN|The IP address or fully qualified domain name of the node.|  
|Type|The node type as a string.|  
|CodeVersion|The code version.|  
|ConfigVersion|The configuration version.|  
|NodeStatus|The status of the node.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Up - Indicates the node is up. The value is 1.<br />-   Down - Indicates the node is down. The value is 2.<br />-   Enabling - Indicates the node is enabling. The value is 3.<br />-   Disabling - Indicates the node is disabling. The value is 4.<br />-   Disabled - Indicates the node is disabled. The value is 5.<br />-   Unknown - Indicates the node is unknown. The value is 6.<br />-   Removed - Indicates the node is removed. The value is 7.|  
|NodeUpTimeInSeconds|Time in seconds since the node has been in NodeStatus Up. Value zero indicates node is not in NodeStatus up.|  
|NodeDownTimeInSeconds|Time in seconds since the node has been in NodeStatus Down. Value zero indicates node is not NodeStatus Down.|
|HealthState|The health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|IsSeedNode|Value is `true` if this node is the seed node; `false` if this node is not the seed node|  
|UpgradeDomain|The upgrade domain as a string.|  
|FaultDomain|The fault domain.|  
|Id|The JSON object that contains the node ID.|  
|Id|The node ID.|  
|InstanceId|The node instance ID.|  
|NodeDeactivationInfo|Node deactivation information as a JSON object.|  
|NodeDeactivationStatus|The node deactivation status.<br /><br /> Possible values are:<br /><br /> -   None - No status is associated with the task. The value is zero.<br />-   SafetyCheckInProgress - Safety checks are in progress for the task. The value is 1.<br />-   SafetyCheckComplete - All the safety checks have been completed for the task. The value is 2.<br />-   Completed - The task is completed. The value is 3.|  
|NodeDeactivationTasks|The node deactivation tasks.|  
|NodeDeactivationIntent|The node deactivation intent.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node deactivation intent is invalid. All Service Fabric enumerations have the invalid type. The value is zero. This value is not used.<br />-   Pause - Indicates that the node should be paused. The value is 1.<br />-   Restart - Indicates that the intent is for the node to be restarted after a short period of time. Service Fabric does not restart the node - this action is done outside of Service Fabric. . The value is 2.<br />-   RemoveData - Indicates that the intent is to reimage the node. Service Fabric does not reimage the node - this action is done outside of Service Fabric. The value is 3.<br />-  RemoveNode – Indicates that the node is being decommissioned and is not expected to return. Service Fabric does not decommission the node - this action is done outside of Service Fabric. The value is 4.|  
|NodeDeactivationTaskId|The node deactivation task ID.|  
|Id|The unique ID of the node deactivation task.|  
|NodeDeactivationTaskType|The type of the node deactivation task.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node deactivation task type is invalid. All Service Fabric enumerations have the invalid type. The value is zero. This value is not used.<br />-   Infrastructure - Specifies the task created by the Azure MR. The value is 1.<br />-   Repair - Specifies the task that was created by the Repair Manager service. The value is 2.<br />-   Client - Specifies that the task was created by calling the public API. The value is 3.|  
|ContinuationToken|String that represents a continuation token. Returned when the results do not fit one message. Can be used to get next page of results by specifying ContinuationToken with this value in next call.|  
  
## Examples  
 The following example displays the list of nodes onto the console.  
  
```  
/// <summary>  
/// Class with members that correspond to the JSON name/value pairs returned from the Get Nodes REST API call.  
/// </summary>  
public class NodeInformation  
{  
    public string CodeVersion { get; set; }  
    public string ConfigVersion { get; set; }  
    public string FaultDomain { get; set; }  
    public HealthState HealthState { get; set; }  
    public IdObject Id { get; set; }   
    public string InstanceId { get; set; }  
    public string IpAddressOrFQDN { get; set; }  
    public bool IsSeedNode { get; set; }  
    public string Name { get; set; }  
    public NodeDeactivationResult2 NodeDeactivationInfo { get; set; }  
    public NodeStatus NodeStatus { get; set; }  
    public string NodeUpTimeInSeconds { get; set; }  
    public string NodeDownTimeInSeconds { get; set; }
    public string Type { get; set; }  
    public string UpgradeDomain { get; set; }  
}  
  
/// <summary>  
/// Class to access the Node Id.   
/// The JSON string describes the Node Id as ' "Id" : { "Id" : "18c04a60c5c8e287f4f4337ba8642205" }, '.  
/// </summary>  
public class IdObject {   
    public string Id { get; set; }   
}  
  
/// <summary>  
/// Class similar to NodeDeactivationResult. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class NodeDeactivationResult2  
{  
    public NodeDeactivationIntent NodeDeactivationIntent { get; set; }  
    public NodeDeactivationStatus NodeDeactivationStatus { get; set; }  
    public List<NodeDeactivationTask2> NodeDeactivationTask { get; set; }  
}  
  
/// <summary>  
/// Class similar to NodeDeactivationTaskId2. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class NodeDeactivationTask2  
{  
    public NodeDeactivationIntent NodeDeactivationIntent { get; set; }  
    public NodeDeactivationTaskId2 NodeDeactivationTaskId { get; set; }  
}  
  
/// <summary>  
/// Class similar to NodeDeactivationTaskId2. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class NodeDeactivationTaskId2  
{  
    public string Id { get; set; }  
    public NodeDeactivationTaskType NodeDeactivationTaskType { get; set; }  
}  
  
/// <summary>  
/// Displays information on each node in the specified cluster.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetNodes(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Nodes?api-version={0}",  
        "1.0"));    // api-version  
  
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
        Console.WriteLine("Error getting nodes:");  
        Console.WriteLine(e.Message);  
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
    List<NodeInformation> nodeInformationList = jss.Deserialize<List<NodeInformation>>(responseString);  
  
    // Display the node information for each node.  
    Console.WriteLine("Node Information:");  
    foreach (NodeInformation nodeInformation in nodeInformationList)  
    {  
        Console.WriteLine("  Node:");  
        Console.WriteLine("    Name: " + nodeInformation.Name);  
        Console.WriteLine("    Type: " + nodeInformation.Type);  
        Console.WriteLine("    Id: " + nodeInformation.Id.Id);  
        Console.WriteLine("    InstanceId: " + nodeInformation.InstanceId);  
        Console.WriteLine("    ConfigVersion: " + nodeInformation.ConfigVersion);  
        Console.WriteLine("    CodeVersion: " + nodeInformation.CodeVersion);  
        Console.WriteLine("    NodeStatus: " + nodeInformation.NodeStatus);  
        Console.WriteLine("    NodeUpTimeInSeconds: " + nodeInformation.NodeUpTimeInSeconds);  
        Console.WriteLine("    NodeDownTimeInSeconds: " + nodeInformation.NodeDownTimeInSeconds);
        Console.WriteLine("    HealthState: " + nodeInformation.HealthState);  
        Console.WriteLine("    IsSeedNode: " + nodeInformation.IsSeedNode);  
        Console.WriteLine("    FaultDomain: " + nodeInformation.FaultDomain);  
        Console.WriteLine("    UpgradeDomain: " + nodeInformation.UpgradeDomain);  
        Console.WriteLine("    IpAddressOrFQDN: " + nodeInformation.IpAddressOrFQDN);  
        Console.WriteLine("    NodeDeactivationInfo:");  
        Console.WriteLine("      NodeDeactivationIntent: " + nodeInformation.NodeDeactivationInfo.NodeDeactivationIntent);  
        Console.WriteLine("      NodeDeactivationStatus: " + nodeInformation.NodeDeactivationInfo.NodeDeactivationStatus);  
  
        Console.WriteLine("      NodeDeactivationTasks:");  
        foreach (NodeDeactivationTask2 task in nodeInformation.NodeDeactivationInfo.NodeDeactivationTask)  
        {  
            Console.WriteLine("        NodeDeactivationTask:");  
            Console.WriteLine("          NodeDeactivationIntent: " + task.NodeDeactivationIntent);  
            Console.WriteLine("          NodeDeactivationTaskId:");  
            Console.WriteLine("            Id: " + task.NodeDeactivationTaskId.Id);  
            Console.WriteLine("            NodeDeactivationTaskType: " + task.NodeDeactivationTaskId.NodeDeactivationTaskType);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Node Information:  
  Node:  
    Name: Node.4  
    Type: NodeType4  
    Id: 182043d0294b3f36e954e0397268b770  
    InstanceId: 130741255660417472  
    ConfigVersion: 1.0  
    CodeVersion: 4.0.90.9490  
    NodeStatus: Up  
    NodeUpTimeInSeconds: 7770  
    NodeDownTimeInSeconds: 0
    HealthState: Ok  
    IsSeedNode: False  
    FaultDomain: fd:/FD04  
    UpgradeDomain: UD4  
    IpAddressOrFQDN: localhost  
    NodeDeactivationInfo:  
      NodeDeactivationIntent: Invalid  
      NodeDeactivationStatus: None  
      NodeDeactivationTasks:  
  Node:  
    Name: Node.2  
    Type: NodeType2  
    Id: 1840a58b116c5f9c7a0b1837194c4205  
    InstanceId: 130741255660437483  
    ConfigVersion: 1.0  
    CodeVersion: 4.0.90.9490  
    NodeStatus: Up  
    NodeUpTimeInSeconds: 7770  
    NodeDownTimeInSeconds: 0
    HealthState: Ok  
    IsSeedNode: True  
    FaultDomain: fd:/FD02  
    UpgradeDomain: UD2  
    IpAddressOrFQDN: localhost  
    NodeDeactivationInfo:  
      NodeDeactivationIntent: Invalid  
      NodeDeactivationStatus: None  
      NodeDeactivationTasks:  
  Node:  
    Name: Node.1  
    Type: NodeType1  
    Id: 1880ec88a3187766a6da323399721f53  
    InstanceId: 130741255660407463  
    ConfigVersion: 1.0  
    CodeVersion: 4.0.90.9490  
    NodeStatus: Up  
    NodeUpTimeInSeconds: 7770  
    NodeDownTimeInSeconds: 0
    HealthState: Ok  
    IsSeedNode: True  
    FaultDomain: fd:/FD01  
    UpgradeDomain: UD1  
    IpAddressOrFQDN: localhost  
    NodeDeactivationInfo:  
      NodeDeactivationIntent: Invalid  
      NodeDeactivationStatus: None  
      NodeDeactivationTasks:  
  Node:  
    Name: Node.5  
    Type: NodeType5  
    Id: 18a05673ad5b226e2826584627c00a22  
    InstanceId: 130741255664615018  
    ConfigVersion: 1.0  
    CodeVersion: 4.0.90.9490  
    NodeStatus: Up  
    NodeUpTimeInSeconds: 7770  
    NodeDownTimeInSeconds: 0
    HealthState: Ok  
    IsSeedNode: False  
    FaultDomain: fd:/FD05  
    UpgradeDomain: UD5  
    IpAddressOrFQDN: localhost  
    NodeDeactivationInfo:  
      NodeDeactivationIntent: Invalid  
      NodeDeactivationStatus: None  
      NodeDeactivationTasks:  
  Node:  
    Name: Node.3  
    Type: NodeType3  
    Id: 18c04a60c5c8e287f4f4337ba8642205  
    InstanceId: 130741255660437483  
    ConfigVersion: 1.0  
    CodeVersion: 4.0.90.9490  
    NodeStatus: Up  
    NodeUpTimeInSeconds: 7770  
    NodeDownTimeInSeconds: 0
    HealthState: Ok  
    IsSeedNode: True  
    FaultDomain: fd:/FD03  
    UpgradeDomain: UD3  
    IpAddressOrFQDN: localhost  
    NodeDeactivationInfo:  
      NodeDeactivationIntent: Invalid  
      NodeDeactivationStatus: None  
      NodeDeactivationTasks:  
*/  
```