---
title: "Unprovision an application"
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
ms.assetid: 807b770c-7667-468d-a0a0-f3de789177f6
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
# Unprovision an application
Unprovisions a Service Fabric application.  
  
## Request  
 See [Application type](application-type.md) for headers and parameters that are used by all requests related to application types.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/ApplicationTypes/{application-type-name}/$/Unprovision?api-version={api-version}`|  
  
```  
{  
    "ApplicationTypeVersion":"1.0.0.0"  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ApplicationTypeVersion|Yes|String|The application type version.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
### Examples  
 The following example unprovisions the 1.0.0.0 version of the WordCount application.  
  
```  
/// <summary>  
/// Unprovisions an application.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool UnprovisionAnApplication(Uri clusterUri)  
{  
    // The version of the application to unprovision.  
    string versionToUnprovision = "1.0.0.0";  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/ApplicationTypes/{0}/$/Unprovision?api-version={1}",  
        "WordCount",     // Application Type Name  
        "1.0"));            // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "POST";  
    request.ContentType = "application/json; charset=utf-8";  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the byte array that will become the request body.  
    string requestBody = "{\"ApplicationTypeVersion\":\"" + versionToUnprovision + "\"}";  
    byte[] requestBodyBytes = Encoding.UTF8.GetBytes(requestBody);  
    request.ContentLength = requestBodyBytes.Length;  
  
    // Create the request body.  
    try  
    {  
        using (Stream requestStream = request.GetRequestStream())  
        {  
            requestStream.Write(requestBodyBytes, 0, requestBodyBytes.Length);  
            requestStream.Close();  
  
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
        Console.WriteLine("Error unprovisioning the application:");  
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
  
    Console.WriteLine("Unprovision an Application response status = " + statusCode.ToString());  
    return true;  
}  
  
/*  
This code produces output similar to the following:  
  
Unprovision an Application response status = OK  
*/  
  
```