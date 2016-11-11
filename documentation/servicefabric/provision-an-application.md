---
title: "Provision an application"
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
ms.assetid: b0115780-e86a-40f7-ab09-a512e8a9e4d6
caps.latest.revision: 14
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
# Provision an application
Provisions a Service Fabric application.  
  
## Request  
 See [Application type](application-type.md) for headers and parameters that are used by all requests related to application types.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/ApplicationTypes/$/Provision?api-version={api-version}`|  
  
```  
{  
    "ApplicationTypeBuildPath": "value"  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ApplicationTypeBuildPath|Yes|String|The application type build path.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
### Examples  
 The following example provisions the application WordCount from the ImageStore.  
  
```  
/// <summary>  
/// Provisions an application to the image store.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool ProvisionAnApplication(Uri clusterUri)  
{  
    // The path to the application type.  
    string applicationTypeBuildPath = "WordCount";  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/ApplicationTypes/$/Provision?api-version={0}",  
        "1.0"));    // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "POST";  
    request.ContentType = "application/json; charset=utf-8";  
  
    // Create the byte array that will become the request body.  
    string requestBody = "{\"ApplicationTypeBuildPath\":\"" + applicationTypeBuildPath + "\"}";  
    byte[] requestBodyBytes = Encoding.UTF8.GetBytes(requestBody);  
    request.ContentLength = requestBodyBytes.Length;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
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
        Console.WriteLine("Error provisioning the application:");  
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
  
    Console.WriteLine("Provision an Application response status = " + statusCode.ToString());  
    return true;  
}  
  
/*  
This code produces output similar to the following:  
  
Provision an Application response status = OK  
*/  
  
```