---
title: "Get a list of system services&#160;"
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
ms.assetid: e6b7df97-6886-4fe9-bb25-e8543f75167d
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
# Get a list of system services&#160;
Gets the Service Fabric system services.  
  
## Request  
 See [Common parameters and headers](../ServiceFabricREST/cluster.md#bk_common) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI gets the Service Fabric system services: <br />`<URI>/Applications/System/$/GetServices?api-version={api-version}`|  
|GET|The following URI gets the Service Fabric system services with continuation token:<br />`<URI>/Applications/System/$/GetServices?api-version={api-version}&ContinuationToken={continuation-token}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous get service list call when the results do not fit one message. Can be used to get next page of results.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md)  
  
```  
  
      {  
"Items":[  
    {  
        "Id": "System\\/FailoverManagerService",  
        "ServiceKind": 2,  
        "Name": "fabric:\\/System\\/FailoverManagerService",  
        "TypeName": "FMServiceType",  
        "ManifestVersion": "4.0.90.9490",  
        "HasPersistedState": true,  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    },  
    {  
        "Id": "System\\/ClusterManagerService",  
        "ServiceKind": 2,  
        "Name": "fabric:\\/System\\/ClusterManagerService",  
        "TypeName": "ClusterManagerServiceType",  
        "ManifestVersion": "4.0.90.9490",  
        "HasPersistedState": true,  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    },  
    {  
        "Id": "System\\/ImageStoreService",  
        "ServiceKind": 2,  
        "Name": "fabric:\\/System\\/ImageStoreService",  
        "TypeName": "FileStoreServiceType",  
        "ManifestVersion": "4.0.90.9490",  
        "HasPersistedState": true,  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    },  
    {  
        "Id": "System\\/NamingService",  
        "ServiceKind": 2,  
        "Name": "fabric:\\/System\\/NamingService",  
        "TypeName": "NamingStoreService",  
        "ManifestVersion": "4.0.90.9490",  
        "HasPersistedState": true,  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    }  
],  
"ContinuationToken":"fabric:\\/System\\/NamingService"  
}  
  
```  
  
|Element Name|Description|  
|------------------|-----------------|  
|Id|The contents of the cluster manifest file.|  
|ServiceKind|The service kind.Possible values are: <br />Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|Name|The system name.|  
|TypeName|The type name.|  
|ManifestVersion|The manifest version.|  
|HasPersistedState|Value of `true` if the service has a persisted state; `false` if the service does not have a persisted state.|  
|HealthState|The health state. <br />Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Error - Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ServiceStatus|(Obsolete) The status of the service.|  
|IsServiceGroup|(Obsolete) Value of `true` if this service is part of a service group; `false` if this service is not part of a service group.|  
|ContinuationToken|String that represents a continuation token. Returned when the results do not fit one message. Can be used to get next page of results by specifying ContinuationToken with this value in next call.|  
  
### Example  
 The following example displays the system services onto the console.  
  
```c#  
/// <summary>  
/// Class similar to SystemService. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class SystemService2  
{  
    public string Name { get; set; }  
    public string TypeName { get; set; }  
    public string Id { get; set; }  
    public ServiceKind ServiceKind { get; set; }  
    public ServicePartitionStatus ServiceStatus { get; set; }  
    public bool HasPersistedState { get; set; }  
    public HealthState HealthState { get; set; }  
    public bool IsServiceGroup { get; set; }  
    public string ManifestVersion { get; set; }  
}  
  
/// <summary>  
/// Displays the list of System Services.  
/// </summary>  
/// <param name="clusterUri">The URI of the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetSystemServices(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/System/$/GetServices?api-version={0}",  
        "1.0")); // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "GET";  
  
    // Make the request and get the response.  
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
        Console.WriteLine("Error getting the list of system services:");  
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
    List<SystemService2> systemServices = jss.Deserialize<List<SystemService2>>(responseString);  
  
    // Display the list of System Services.  
    Console.WriteLine("SystemServices:");  
    foreach (SystemService2 systemService in systemServices)  
    {  
        Console.WriteLine("  SystemService:");  
        Console.WriteLine("    Name: " + systemService.Name);  
        Console.WriteLine("    TypeName: " + systemService.TypeName);  
        Console.WriteLine("    Id: " + systemService.Id);  
        Console.WriteLine("    ServiceKind: " + systemService.ServiceKind);  
        Console.WriteLine("    ServiceStatus: " + systemService.ServiceStatus);  
        Console.WriteLine("    HasPersistedState: " + systemService.HasPersistedState);  
        Console.WriteLine("    HealthState: " + systemService.HealthState);  
        Console.WriteLine("    IsServiceGroup: " + systemService.IsServiceGroup);  
        Console.WriteLine("    ManifestVersion: " + systemService.ManifestVersion);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
SystemServices:  
  SystemService:  
    Name: fabric:/System/FailoverManagerService  
    TypeName: FMServiceType  
    Id: System/FailoverManagerService  
    ServiceKind: Stateful  
    ServiceStatus: Ready  
    HasPersistedState: True  
    HealthState: Ok  
    IsServiceGroup: False  
    ManifestVersion: 4.0.90.9490  
  SystemService:  
    Name: fabric:/System/ClusterManagerService  
    TypeName: ClusterManagerServiceType  
    Id: System/ClusterManagerService  
    ServiceKind: Stateful  
    ServiceStatus: Ready  
    HasPersistedState: True  
    HealthState: Ok  
    IsServiceGroup: False  
    ManifestVersion: 4.0.90.9490  
  SystemService:  
    Name: fabric:/System/ImageStoreService  
    TypeName: FileStoreServiceType  
    Id: System/ImageStoreService  
    ServiceKind: Stateful  
    ServiceStatus: Ready  
    HasPersistedState: True  
    HealthState: Ok  
    IsServiceGroup: False  
    ManifestVersion: 4.0.90.9490  
  SystemService:  
    Name: fabric:/System/NamingService  
    TypeName: NamingStoreService  
    Id: System/NamingService  
    ServiceKind: Stateful  
    ServiceStatus: Ready  
    HasPersistedState: True  
    HealthState: Ok  
    IsServiceGroup: False  
    ManifestVersion: 4.0.90.9490  
*/  
  
```