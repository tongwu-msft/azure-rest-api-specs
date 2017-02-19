---
title: "Get a list of partitions"
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
ms.assetid: bc1d333b-4252-4292-862e-9450b40d654c
caps.latest.revision: 20
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
# Get a list of partitions
Gets information on the specified partition, or gets information on all partitions if no partition is specified.  
  
## Request  
 See [Common parameters and headers](partition.md#bk_common) for headers and parameters that are used by all requests related to partitions.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|Get the list of partitions is a service:<br />`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetPartitions?api-version={api-version}`|  
|GET|Get the specified partition:<br />`<URI>/Services/{service-name}/$/GetPartitions/{partition-id}?api-version={api-version}`|  
|GET|Get the list of partitions based on the continuation token:<br />`<URI>/Services/{service-name}/$/GetPartitions?api-version={api-version}&ContinuationToken={continuation-token}`|  
  
### URI Parameters  
  
|URI Parameters|Required|Description|  
|--------------------|--------------|-----------------|  
|application-name|Yes|Application to which the service belongs to|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous GetPartitions call when the results do not fit one message. Can be used to get next page of results.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{"Items":[  
    {  
        "ServiceKind": 2,  
        "PartitionInformation": {  
            "ServicePartitionKind": 2,  
            "Id": "dd612667-22dc-4168-bc0d-24e1eee03845",  
            "LowKey": "1",  
            "HighKey": "26"  
        },  
        "TargetReplicaSetSize": 3,  
        "MinReplicaSetSize": 2,  
        "HealthState": 1,  
        "PartitionStatus": 1,  
        "CurrentConfigurationEpoch": {  
            "ConfigurationVersion": "8589934596",  
            "DataLossVersion": "130742924295550559"  
        }  
    }  
],  
"ContinuationToken": "dd612667-22dc-4168-bc0d-24e1eee03845"  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceKind|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|PartitionInformation|The service partition information object.|  
|TargetReplicaSetSize|The target replica set size as a number.|  
|MinReplicaSetSize|The minimum replica set size as a number.|  
|InstanceCount|The instance count.|  
|HealthState|The health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Error - Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|PartitionStatus|Indicates the type of partitioning scheme that is used.<br /><br /> Possible values are:<br /><br /> -   Invalid - The service partition state is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ready - The service partition state is ready. The value is 1.<br />-   NotReady - The service partition state is not ready. The value is 2.<br />-   InQuorumLoss - The service partition state is in quorum loss. The value is 3.|  
|CurrentConfigurationEpoch|The current configuration epoch.|  
|ConfigurationVersion|The current configuration number property in this epoch.|  
|DataLossVersion|The current data loss number in this epoch.|  
|ContinuationToken|String that represents a continuation token. Returned when the results do not fit one message. Can be used to get next page of results by specifying ContinuationToken with this value in next call.|  
  
### PartitionInformation  
  
|Element Name|Description|  
|------------------|-----------------|  
|ServicePartitionKind|The partition scheme of this service. Possible values are:<br /><br /> -   `Invalid` - Indicates the partition kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   `Singleton` - Indicates that the partition is based on string names, and is a SingletonPartitionInformation object, that was originally created via SingletonPartitionSchemeDescription. The value is 1.<br />-   `Int64Range` - Indicates that the partition is based on Int64 key ranges, and is an Int64RangePartitionInformation object that was originally created via UniformInt64RangePartitionSchemeDescription. The value is 2.<br />-   `Named` - Indicates that the partition is based on string names, and is a NamedPartitionInformation object, that was originally created via NamedPartitionSchemeDescription. The value is 3.|  
|Id|The partition ID as a GUID string.|  
|Name|This is returned if the ServicePartitionKind is Named.|  
|LowKey|This is returned if the ServicePartitionKind is Int64Range. This corresponds to the Low key of the partition.|  
|HighKey|This is returned if the ServicePartitionKind is Int64Range. This corresponds to the High key of the partition.|  
  
## Examples  
 The following example displays the partitions for the specified service.  
  
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
/// Gets the list of partitions for a specific application.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetPartitions(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetPartitions?api-version={2}",  
        "WordCount",                    // Application Name  
        "WordCount/WordCount.Service",  // Service Name  
        "2.0"));                        // api-version  
  
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
  
    Console.WriteLine("Partitions:");  
    foreach (Partition2 partition in partitions)  
    {  
        Console.WriteLine("  Partition:");  
        Console.WriteLine("    ServiceKind: " + partition.ServiceKind);  
        Console.WriteLine("    PartitionStatus: " + partition.PartitionStatus);  
        Console.WriteLine("    HealthState: " + partition.HealthState);  
  
        Console.WriteLine("    PartitionInformation:");  
        Console.WriteLine("      ServicePartitionKind: " + partition.PartitionInformation.ServicePartitionKind);  
        Console.WriteLine("      Id: " + partition.PartitionInformation.Id);  
  
        if (partition.ServiceKind == ServiceKind.Stateful)  
        {  
            Console.WriteLine("    MinReplicaSetSize: " + partition.MinReplicaSetSize);  
            Console.WriteLine("    TargetReplicaSetSize: " + partition.TargetReplicaSetSize);  
  
            Console.WriteLine("    CurrentConfigurationEpoch:");  
            Console.WriteLine("      ConfigurationVersion: " + partition.CurrentConfigurationEpoch.ConfigurationVersion);  
            Console.WriteLine("      DataLossVersion: " + partition.CurrentConfigurationEpoch.DataLossVersion);  
        }  
  
        if (partition.ServiceKind == ServiceKind.Stateless)  
        {  
            Console.WriteLine("    InstanceCount: " + partition.InstanceCount);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Partitions:  
  Partition:  
    ServiceKind: Stateful  
    PartitionStatus: Ready  
    HealthState: Ok  
    PartitionInformation:  
      ServicePartitionKind: Int64Range  
      Id: dd612667-22dc-4168-bc0d-24e1eee03845  
    MinReplicaSetSize: 2  
    TargetReplicaSetSize: 3  
    CurrentConfigurationEpoch:  
      ConfigurationVersion: 8589934596  
      DataLossVersion: 130742924295550559  
*/  
  
```