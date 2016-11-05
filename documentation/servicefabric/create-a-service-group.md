---
title: "Create a service group"
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
ms.assetid: 7181542f-eba3-4d2a-a1b5-87ebad489b3b
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
# Create a service group
Creates the specified service group.  
  
## Request  
 See [Common parameters and headers](../ServiceFabricREST/service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServices/$/CreateServiceGroup?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
```  
{  
    "ServiceKind": 1,  
    "ApplicationName": "fabric:/WordCount",  
    "ServiceName": "fabric:/WordCount/WordCount.Service",  
    "ServiceTypeName": "WordCount.Service",  
    "InitializationData": [],  
    "PartitionDescription": {  
        "PartitionScheme": 2,  
        "Count": 1,  
        "LowKey": "1",  
        "HighKey": "26"  
    },  
    "TargetReplicaSetSize": 5,  
    "MinReplicaSetSize": 2,  
    "HasPersistedState": true,  
    "PlacementConstraints": "",  
    "CorrelationScheme": [],  
    "ServiceLoadMetrics": [],  
    “ServiceGroupMemberDescription":[{  
        "ServiceName":"fabric:/WordCount/WordCount.Service#a",  
        "ServiceTypeName":"CalcServiceType",  
        "InitializationData":[],  
        "ServiceLoadMetrics":[]  
    }]  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ServiceKind|Yes|Number|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|ApplicationName|Yes|String|The application name.|  
|ServiceName|Yes|String|The service name.|  
|ServiceTypeName|Yes|String|The service type name.|  
|InitializationData|Yes|Array|The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.|  
|PartitionDescription|Yes|Object|The partition description as an object.|  
|PartitionScheme|Yes|Number|The partition scheme.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the node status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Singleton - Indicates a singleton partition scheme. The value is 1.<br />-   UniformInt64Range - Indicates a uniform Int64 range partition scheme. The value is 2.<br />-   Named - Indicates a named partition scheme. The value is 3.|  
|Count|Yes|Number|The partition count.|  
|LowKey|Yes|String|The low key.|  
|HighKey|Yes|String|The high key.|  
|TargetReplicaSetSize|Yes for stateful service|Number|The target replica set size as a number.|  
|MinReplicaSetSize|Yes for stateful service|Number|The minimum replica set size as a number.|  
|HasPersistedState|Yes|Boolean|Whether this service has persisted state as true &#124; false.|  
|InstanceCount|Yes for stateless service|Number|The instance count.|  
|PlacementConstraints|No|String|The placement constraints as a string. Placement constraints are boolean expressions on node properties and allow for restricting a service to particular nodes based on the service requirements. For example, to place a service on nodes where NodeType is blue specify the following: "NodeColor == blue)".|  
|CorrelationScheme|No|Array of objects|The correlation scheme as an array of JSON objects.|  
|ServiceName|Yes|String|The service name as a URI.|  
|ServiceCorrelationScheme|Yes|Number|The service correlation scheme as a number. The service correlation scheme values can be 0 for invalid, 1 for affinity, 2 for aligned affinity, and 3 for non-aligned affinity.|  
|ReplicaRestartWaitDurationSeconds|No|Number|The replica restart wait duration as the number of seconds.|  
|ServiceLoadMetrics|No|Array of objects|The service load metrics as an array of objects.|  
|Name|Yes|String|The name of the metric.If the service chooses to report load during runtime, the load metric name should match the name that is specified in Name exactly.Note that metric names are case sensitive.|  
|ServiceLoadMetricWeight|No|Number|The service load metric relative weight, compared to other metrics configured for this service, as a number. A value of 0 is Zero (disables resource balancing for this metric), 1 is Low, 2 is Medium, and 3 is High.During runtime, if two metrics end up in conflict, the Cluster Resource Manager prefers the metric with the higher weight.|  
|PrimaryDefaultLoad|No|Number|The default amount of load, as a number, that this service creates for this metric when it is a Primary replica.|  
|SecondaryDefaultLoad|No|Number|The default amount of load, as a number, that this service creates for this metric when it is a Secondary replica.|  
  
## Response  
 A successful operation will return 202 Accepted. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
## Examples  
 The following example creates a service.  
  
```  
/// <summary>  
/// Class designed for use with JavaScriptSerializer.  
/// </summary>  
public class NewService  
{  
    public ServiceKind ServiceKind { get; set; }  
    public string ApplicationName { get; set; }  
    public string ServiceName { get; set; }  
    public string ServiceTypeName { get; set; }  
    public byte[] InitializationData { get; set; }  
    public PartitionDescription2 PartitionDescription { get; set; }  
    public long TargetReplicaSetSize { get; set; }  
    public long MinReplicaSetSize { get; set; }  
    public bool HasPersistedState { get; set; }  
    public string PlacementConstraints { get; set; }  
    public List<ServiceCorrelationDescription> CorrelationScheme { get; set; }  
    public List<LoadMetric2> ServiceLoadMetrics { get; set; }  
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
/// Creates a service.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool CreateService(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/{0}/$/GetServices/$/CreateServiceGroup?api-version={1}",  
        "WordCount",    // Application Name  
        "1.0"));        // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.ContentType = "text/json";  
    request.Method = "POST";  
  
    NewService serviceGroup = new NewServiceGroup();  
    serviceGroup.ServiceKind = ServiceKind.Stateful;  
    serviceGroup.ApplicationName = "fabric:/WordCount";  
    serviceGroup.ServiceName = "fabric:/WordCount/WordCount.Service.Copy";  
    serviceGroup.ServiceTypeName = "WordCount.Service";  
    serviceGroup.InitializationData = Encoding.UTF8.GetBytes(String.Empty);  
    serviceGroup.PartitionDescription = new PartitionDescription2();  
    serviceGroup.PartitionDescription.PartitionScheme = PartitionScheme.UniformInt64Range;  
    serviceGroup.PartitionDescription.Count = 1;  
    serviceGroup.PartitionDescription.LowKey = "1";  
    serviceGroup.PartitionDescription.HighKey = "26";  
    serviceGroup.TargetReplicaSetSize = 5;  
    serviceGroup.MinReplicaSetSize = 2;  
    serviceGroup.HasPersistedState = true;  
    serviceGroup.PlacementConstraints = "";  
    serviceGroup.CorrelationScheme = new List<ServiceCorrelationDescription>();  
    serviceGroup.ServiceLoadMetrics = new List<LoadMetric2>();  
    serviceGroup.ServiceGroupMemberDescription = new List<ServiceGroupMemberDescription>();  
    serviceGroup.ServiceGroupMemberDescription.Add(new ServiceGroupMemberDescription());  
    serviceGroup.ServiceGroupMemberDescription[0].ServiceName = “fabric:/WordCount/WordCount.Service.Copy#a”;  
    serviceGroup.ServiceGroupMemberDescription[0].ServiceTypeName = "WordCount.Service";  
    serviceGroup.ServiceGroupMemberDescription[0].ServiceLoadMetrics = new List<LoadMetric2>();  
  
    // Serialize the service data.  
    JavaScriptSerializer jss = new JavaScriptSerializer();  
    string jsonString = jss.Serialize(serviceGroup);  
  
    // Create ths stream for the request body.  
    try  
    {  
        using (StreamWriter streamWriter = new StreamWriter(request.GetRequestStream()))  
        {  
            streamWriter.Write(jsonString);  
            streamWriter.Close();  
  
            // Execute the request and obtain the response.  
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
            {  
                statusCode = response.StatusCode;  
            }  
        }  
    }  
    catch (WebException e)  
    {  
        // If there is a web exception, display the error message.  
        Console.WriteLine("Error creating service:");  
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
  
    Console.WriteLine("Create Service response status = " + statusCode.ToString());  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Create Service response status = Accepted  
*/  
  
```