---
title: "Get a cluster manifest"
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
ms.assetid: 154b8327-239b-4fc4-a583-352561bcec01
caps.latest.revision: 15
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
# Get a cluster manifest
Get the Service Fabric cluster manifest.  
  
## Request  
 See [Cluster](../ServiceFabricREST/cluster.md) for headers and parameters that are used by all requests related to the cluster.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/$/GetClusterManifest?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
{  
    "Manifest": "<ClusterManifest xmlns:xsd= ...  
}  
```  
  
|Element Name|Description|  
|------------------|-----------------|  
|Manifest|The contents of the cluster manifest file.|  
  
## Examples  
  
```c#  
/// <summary>  
/// Class to contain the cluster manifest.  
/// </summary>  
public class ClusterManifest  
{  
    public string Manifest { get; set; }  
}  
  
/// <summary>  
/// Displays the cluster manifest on the console.  
/// </summary>  
/// <param name="clusterUri">The URI of the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetClusterManifest(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/$/GetClusterManifest?api-version={0}",  
        "1.0")); // api-version  
  
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
        Console.WriteLine("Error getting the cluster manifest:");  
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
    ClusterManifest clusterManifest = jss.Deserialize<ClusterManifest>(responseString);  
  
    // Display the application manifest.  
    Console.WriteLine("Cluster Manifest:");  
    Console.WriteLine(clusterManifest.Manifest);  
  
    return true;  
}  
  
```