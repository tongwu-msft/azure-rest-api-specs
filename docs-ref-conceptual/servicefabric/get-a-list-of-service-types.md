---
title: "Get a list of service types"
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
ms.assetid: 376aaeb2-d760-48a1-9d85-714c98fdc11c
caps.latest.revision: 18
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
# Get a list of service types
Gets the list of Service Fabric service types.  
  
## Request  
 See [Service type](service-type.md) for headers and parameters that are used by all requests related to service types.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/ApplicationTypes/{application-type-name}/$/GetServiceTypes?ApplicationTypeVersion={application-type-version}&api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
[  
    {  
        "ServiceTypeDescription": {  
            "IsStateful": true,  
            "ServiceTypeName": "WordCount.Service",  
            "PlacementConstraints": "",  
            "HasPersistedState": true,  
            "Extensions": [],  
            "LoadMetrics": [],  
            "ServicePlacementPolicies": []  
        },  
        "ServiceManifestVersion": "1.0",  
        "ServiceManifestName": "WordCount.Service",  
        "IsServiceGroup": false  
    },  
    {  
        "ServiceTypeDescription": {  
            "IsStateful": false,  
            "ServiceTypeName": "WordCount.WebService",  
            "PlacementConstraints": "",  
            "UseImplicitHost": false,  
            "Extensions": [],  
            "LoadMetrics": [],  
            "ServicePlacementPolicies": []  
        },  
        "ServiceManifestVersion": "1.0",  
        "ServiceManifestName": "WordCount.WebService",  
        "IsServiceGroup": false  
    }  
]  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ServiceTypeDescription|Yes|Object|The service type description as a JSON object.|  
|IsStateful|Yes|Boolean|Value of `true` when the service type is stateful; `false` when the service type is not stateful.|  
|ServiceTypeName|Yes|String|The service type name.|  
|PlacementConstraints|Yes|String|The placement constraints.|  
|HasPersistedState|No|Boolean|Value of `true` when the service type has persisted state; `false` when the service type is not persisted.|  
|UseImplicitHost|Yes|Boolean||  
|Extensions|Yes|Array|An array of extensions.|  
|LoadMetrics|Yes|Array|An array of load metrics.|  
|ServicePlacementPolicies|Yes|Array|An array of service placement policies.|  
|ServiceManifestVersion|Yes|String|The service manifest version.|  
|ServiceManifestName|Yes|String|The service manifest name.|  
|IsServiceGroup|Yes|Boolean|Boolean value which is `true` if this describes a service group.|  
  
## Examples  
 The following example displays the service type for a specific application type and application type version.  
  
```  
  
/// <summary>  
/// Class similar to ServiceType. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceType2  
{  
    public bool IsServiceGroup { get; set; }  
    public string ServiceManifestName { get; set; }  
    public string ServiceManifestVersion { get; set; }  
    public ServiceTypeDescription2 ServiceTypeDescription { get; set; }  
}  
  
/// <summary>  
/// Class similar to ServiceTypeDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceTypeDescription2  
{  
    public bool IsStateful { get; set; }  
    public string ServiceTypeName { get; set; }  
    public string PlacementConstraints { get; set; }  
    public bool HasPersistedState { get; set; }  
    public List<Extension2> Extensions { get; set; }  
    public List<LoadMetric2> LoadMetrics { get; set; }  
    public List<ServicePlacementPolicyDescription> ServicePlacementPolicies { get; set; }  
}  
  
/// <summary>  
/// Class similar to SystemService. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Extension2  
{  
    public string Key { get; set; }  
    public string Value { get; set; }  
}  
  
/// <summary>  
/// Class similar to LoadMetric. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class LoadMetric2  
{  
    public string Key { get; set; }  
    public ServiceLoadMetricDescription ServiceLoadMetricDescription { get; set; }  
}  
  
/// <summary>  
/// Gets the list of service types.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServiceTypes(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/ApplicationTypes/{0}/$/GetServiceTypes?ApplicationTypeVersion={1}&api-version={2}",  
        "WordCount",    // Application type name  
        "1.0.0.0",      // Application type version  
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
        Console.WriteLine("Error getting the list of service types:");  
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
    List<ServiceType2> serviceTypes = jss.Deserialize<List<ServiceType2>>(responseString);  
  
    // Display the service type desctiption.  
    Console.WriteLine("List of Service Types:");  
    foreach (ServiceType2 serviceType in serviceTypes)  
    {  
        Console.WriteLine("  ServiceType:");  
        Console.WriteLine("    ServiceManifestName: " + serviceType.ServiceManifestName);  
        Console.WriteLine("    ServiceManifestVersion:" + serviceType.ServiceManifestVersion);  
        Console.WriteLine("    IsServiceGroup: " + serviceType.IsServiceGroup);  
        Console.WriteLine("    ServiceManifestDescription:");  
        Console.WriteLine("      IsStateful:" + serviceType.ServiceTypeDescription.IsStateful);  
        Console.WriteLine("      ServiceTypeName: " + serviceType.ServiceTypeDescription.ServiceTypeName);  
        Console.WriteLine("      PlacementConstraints:" + serviceType.ServiceTypeDescription.PlacementConstraints);  
        Console.WriteLine("      HasPersistedState: " + serviceType.ServiceTypeDescription.HasPersistedState);  
  
        Console.WriteLine("      Extensions:");  
        foreach (Extension2 extension in serviceType.ServiceTypeDescription.Extensions)  
        {  
            Console.WriteLine("        Extension:");  
            Console.WriteLine("          Key: " + extension.Key);  
            Console.WriteLine("          Value: " + extension.Key);  
        }  
  
        Console.WriteLine("      LoadMetrics:");  
        foreach (LoadMetric2 loadMetric in serviceType.ServiceTypeDescription.LoadMetrics)  
        {  
            Console.WriteLine("        LoadMetric:");  
            Console.WriteLine("          Key: " + loadMetric.Key);  
            Console.WriteLine("          Name: " + loadMetric.ServiceLoadMetricDescription.Name);  
            Console.WriteLine("          Weight: " + loadMetric.ServiceLoadMetricDescription.Weight);  
            Console.WriteLine("          PrimaryDefaultLoad: " + loadMetric.ServiceLoadMetricDescription.PrimaryDefaultLoad);  
            Console.WriteLine("          SecondaryDefaultLoad: " + loadMetric.ServiceLoadMetricDescription.SecondaryDefaultLoad);  
        }  
  
        Console.WriteLine("      ServicePlacementPolicies:");  
        foreach (ServicePlacementPolicyDescription servicePlacementPolicy in serviceType.ServiceTypeDescription.ServicePlacementPolicies)  
        {  
            Console.WriteLine("        ServicePlacementPolicy:");  
            Console.WriteLine("          Type: " + servicePlacementPolicy.Type);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of Service Types:  
  ServiceType:  
    ServiceManifestName: WordCount.Service  
    ServiceManifestVersion:1.0  
    IsServiceGroup: False  
    ServiceManifestDescription:  
      IsStateful:True  
      ServiceTypeName: WordCount.Service  
      PlacementConstraints:  
      HasPersistedState: True  
      Extensions:  
      LoadMetrics:  
      ServicePlacementPolicies:  
  ServiceType:  
    ServiceManifestName: WordCount.WebService  
    ServiceManifestVersion:1.0  
    IsServiceGroup: False  
    ServiceManifestDescription:  
      IsStateful:False  
      ServiceTypeName: WordCount.WebService  
      PlacementConstraints:  
      HasPersistedState: False  
      Extensions:  
      LoadMetrics:  
      ServicePlacementPolicies:  
*/  
  
```