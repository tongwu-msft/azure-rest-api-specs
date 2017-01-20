---
title: "Get a list of service packages"
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
ms.assetid: fe55555b-7e35-42dd-9758-fbedec9837e8
caps.latest.revision: 13
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
# Get a list of service packages
Gets the names of the service packages for the specified deployed application.  
  
## Request  
 See [Service package](service-package.md) for headers and parameters that are used by all requests related to service packages.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Nodes/{node-name}/$/GetApplications/{application-name}/$/GetServicePackages?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
[  
    {  
        "Name": "WordCount.Service",  
        "Version": "1.0",  
        "Status": 3  
    }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The service package name.|  
|Version|The version of the service package.|  
|Status|The status of the service package.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Downloading - Indicates that the package is downloading from the ImageStore. The value is 1.<br />-   Activating - Indicates that the package is activating. The value is 2.<br />-   Active - Indicates that the package is active. The value is 3.<br />-   Upgrading - Indicates that the package is upgrading. The value is 4.<br />-   Deactivating - Indicates that the package is deactivating. The value is 5.|  
  
## Examples  
 The following example displays the service packages for a specific node and application.  
  
```  
  
/// <summary>  
/// Class similar to DeployedServicePackage. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class DeployedServicePackage2  
{  
    public string Name;  
    public string Version;  
    public DeploymentStatus Status;  
}  
  
/// <summary>  
/// Gets the list of service packages for an application on a node.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServicePackages(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Nodes/{0}/$/GetApplications/{1}/$/GetServicePackages?api-version={2}",  
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
        Console.WriteLine("Error getting the list of service packages:");  
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
    List<DeployedServicePackage2> servicePackages = jss.Deserialize<List<DeployedServicePackage2>>(responseString);  
  
    Console.WriteLine("List of Service Packages:");  
  
    foreach (DeployedServicePackage2 servicePackage in servicePackages)  
    {  
        // Display the application information  
        Console.WriteLine("  Service Package:");  
        Console.WriteLine("    Name: " + servicePackage.Name);  
        Console.WriteLine("    Version: " + servicePackage.Version);  
        Console.WriteLine("    Status: " + servicePackage.Status);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of Service Packages:  
  Service Package:  
    Name: WordCount.Service  
    Version: 1.0  
    Status: Active  
*/  
```