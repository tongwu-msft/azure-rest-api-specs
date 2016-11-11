---
title: "Delete a service group"
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
ms.assetid: eee504c2-02df-4ae7-982f-00d4841b34b4
caps.latest.revision: 5
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
# Delete a service group
Deletes a Service Fabric service group.  
  
## Request  
 See [Service](service.md) for headers and parameters that are used by all requests related to services.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/GetServiceGroups/{service-name}/$/DeleteServiceGroup?api-version={api-version}`|  
|POST|`<URI>/ServiceGroups/{service-name}/$/Delete?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|application-name|Yes|Application to which the service belongs to|  
|service-name|Yes|Service name|  
|api-version|Yes|The API Version, which is "1.0”.|  
  
## Repsonse  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example deletes a service.  
  
```  
/// <summary>  
/// Deletes a service.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool DeleteService(Uri clusterUri)  
{  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/Applications/{0}/$/GetServiceGroups/{1}/$/DeleteServiceGroup?api-version={2}",  
        "WordCount",                    // Application Name  
        "WordCount/WordCount.Service",  // Service Name  
        "1.0"));                        // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "POST";  
    request.ContentLength = 0;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Execute the request and obtain the response.  
    try  
    {  
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
        {  
            statusCode = response.StatusCode;  
        }  
    }  
    catch (WebException e)  
    {  
        // If there is a web exception, display the error message.  
        Console.WriteLine("Error deleting service:");  
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
  
    Console.WriteLine("Delete Service response status = " + statusCode.ToString());  
  
    return true;  
}  
  
/*  
This code produces output similar to the following:  
  
Delete Service response status = OK  
*/  
  
```