---
title: "Get the members of a service group"
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
ms.assetid: f3ef9b54-5659-4fed-ab0f-842e28898067
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
# Get the members of a service group
Gets the members of the specified service group.  
  
## Request  
 See [Common parameters and headers](service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Applications/{application-name}/$/GetServices/{service-name}/$/GetServiceGroupMembers?api-version={api-version}`|  
  
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
    "ServiceName": "fabric:\\/WordCount\\/WordCount.Service",  
    "ServiceTypeName": "WordCount.Service",  
    “InitializationData”: [],  
    "ServiceLoadMetrics": []  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|ServiceName|The service name.|  
|ServiceTypeName|The service type name.|  
|InitializationData|The initialization data as an array of bytes. Initialization data is passed to service instances or replicas when they are created.|  
|ServiceLoadMetrics|The service load metrics as an array of objects.|  
  
## Examples  
 The following example displays the specified service.  
  
```  
/// <summary>  
/// Class similar to ServiceGroupDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ServiceGroupMember  
{  
    public string ServiceName { get; set; }  
    public string ServiceTypeName { get; set; }  
    public List<byte> InitializationData { get; set; }  
    public List<LoadMetric2> ServiceLoadMetrics { get; set; }  
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
public static bool GetServiceGroupMembers(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices/{1}/$/GetServiceGroupMembers?api-version={2}",  
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
    ServiceGroupMember serviceGroupMember = jss.Deserialize<ServiceGroupMembers>(responseString);  
  
    // Display service group members  
    Console.WriteLine("Service Group Description:");  
    Console.WriteLine("  ServiceName: " + serviceDescription.ServiceName);  
    Console.WriteLine("  ServiceTypeName: " + serviceDescription.ServiceTypeName);  
    Console.WriteLine("  InitializationData: " +   
        (serviceDescription.InitializationData.Count > 0 ? "Contains initialization data." : "Does not contain initialization data."));  
    Console.WriteLine("  ServiceLoadMetrics:");  
    foreach (LoadMetric2 serviceLoadMetric in serviceDescription.ServiceLoadMetrics)  
    {  
        Console.WriteLine("    ServiceLoadMetric:");  
        Console.WriteLine("      Name: " + serviceLoadMetric.Name);  
        Console.WriteLine("      Weight: " + serviceLoadMetric.Weight);  
        Console.WriteLine("      PrimaryDefaultLoad: " + serviceLoadMetric.PrimaryDefaultLoad);  
        Console.WriteLine("      SecondaryDefaultLoad: " + serviceLoadMetric.SecondaryDefaultLoad);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Service Group Description:  
  ServiceName: fabric:/WordCount/WordCount.Service  
  ServiceTypeName: WordCount.Service  
  InitializationData: Does not contain initialization data.  
  ServiceLoadMetrics:  
*/  
  
```