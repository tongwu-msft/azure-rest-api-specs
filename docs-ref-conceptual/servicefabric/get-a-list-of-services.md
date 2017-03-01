---
title: "Get a list of services"
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
ms.assetid: 305c800a-5482-40f3-bad3-7088b4360096
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
# Get a list of services
Gets the services of an application.  
  
## Request  
 See [Common parameters and headers](service.md#bk_common) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI is used to get a list of all services:<br /><br /> `<URI>/Applications/{application-name}/$/GetServices?api-version={api-version}`|  
|GET|The following URI is used to get a list of services that match a filter:`<URI>/Applications/{application-name}/$/GetServices/{service-name}?api-version={api-version}`|  
|GET|The following URI is used to get a list of services that match a filter:<br /><br /> `<URI>/Services/{service-name>?api-version={api-version}`|  
|GET|The following URI is used to get a list of services that match a filter starting at the passed in continuation token:<br /><br /> `<URI>/Services?ContinuationToken={continuation-token}&api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous get service list call when the results do not fit one message. Can be used to get next page of results.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
"Items":  
[  
    {  
        "Id": "WordCount\\/WordCount.Service",  
        "ServiceKind": 2,  
        "Name": "fabric:\\/WordCount\\/WordCount.Service",  
        "TypeName": "WordCount.Service",  
        "ManifestVersion": "1.0",  
        "HasPersistedState": true,  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    },  
    {  
        "Id": "WordCount\\/WordCount.WebService",  
        "ServiceKind": 1,  
        "Name": "fabric:\\/WordCount\\/WordCount.WebService",  
        "TypeName": "WordCount.WebService",  
        "ManifestVersion": "1.0",  
        "HealthState": 1,  
        "ServiceStatus": 1,  
        "IsServiceGroup": false  
    }  
],  
"ContinuationToken": "fabric:\\/WordCount\\/WordCount.WebService"  
}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|The service ID.|  
|ServiceKind|The service kind.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the service kind is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Stateless - Does not use Service Fabric to make its state highly available or reliable. The value is 1.<br />-   Stateful - Uses Service Fabric to make its state or part of its state highly available and reliable. The value is 2.|  
|Name|The service name.|  
|TypeName|The service type name.|  
|ManifestVersion|The manifest version.|  
|HasPersistedState|Value of `true` if the service is indicating that this service has persisted state, `false` if otherwise. This is valid only if the ServiceKind is Stateful.|  
|HealthState|The health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Error - Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ServiceStatus|The service status.<br /><br /> Possible values are:<br /><br /> -   Unknown - Indicates the service status is unknown. The value is zero.<br />-   Active - Indicates the service status is active. The value is 1.<br />-   Upgrading - Indicates the service is upgrading. The value is 2.<br />-   Deleting - Indicates the service is being deleted. The value is 3.<br />-   Creating - Indicates the service is being created. The value is 4.<br />-   Failed - Indicates creation or deletion was terminated due to persistent failures. Another create/delete request can be accepted. The value is 5.|  
|IsServiceGroup|Value of `true` if this service is in a service group, `false` if otherwise.|  
  
## Examples  
 The following example displays the services for a specific application.  
  
```  
/// <summary>  
/// Class similar to Service. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Service2  
{  
    public string id { get; set; }  
    public ServiceKind ServiceKind { get; set; }  
    public string Name { get; set; }  
    public string TypeName { get; set; }  
    public string ManifestVersion { get; set; }  
    public HealthState HealthState { get; set; }  
    public ServiceStatus ServiceStatus { get; set; }  
    public bool IsServiceGroup { get; set; }  
    public bool HasPersistedState { get; set; }  
}  
  
/// <summary>  
/// Gets the list services for a specific application.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServices(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServices?api-version={1}",  
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
        Console.WriteLine("Error getting services:");  
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
    List<Service2> services = jss.Deserialize<List<Service2>>(responseString);  
  
    // Display the services  
    Console.WriteLine("Services:");  
    foreach (Service2 service in services)  
    {  
        Console.WriteLine("  Service:");  
        Console.WriteLine("    Id: " + service.id);  
        Console.WriteLine("    Name: " + service.Name);  
        Console.WriteLine("    TypeName: " + service.TypeName);  
        Console.WriteLine("    ServiceKind: " + service.ServiceKind);  
        Console.WriteLine("    ManifestVersion: " + service.ManifestVersion);  
        Console.WriteLine("    HealthState: " + service.HealthState);  
        Console.WriteLine("    ServiceStatus: " + service.ServiceStatus);  
        Console.WriteLine("    IsServiceGroup: " + service.IsServiceGroup);  
  
        if (service.ServiceKind == ServiceKind.Stateful)  
        {  
            Console.WriteLine("    HasPersistedState: " + service.HasPersistedState);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Services:  
  Service:  
    Id: WordCount/WordCount.Service  
    Name: fabric:/WordCount/WordCount.Service  
    TypeName: WordCount.Service  
    ServiceKind: Stateful  
    ManifestVersion: 1.0  
    HealthState: Ok  
    ServiceStatus: Active  
    IsServiceGroup: False  
    HasPersistedState: True  
  Service:  
    Id: WordCount/WordCount.WebService  
    Name: fabric:/WordCount/WordCount.WebService  
    TypeName: WordCount.WebService  
    ServiceKind: Stateless  
    ManifestVersion: 1.0  
    HealthState: Ok  
    ServiceStatus: Active  
    IsServiceGroup: False  
*/  
  
```