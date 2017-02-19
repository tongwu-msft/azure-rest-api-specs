---
title: "Create an application"
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
ms.assetid: afcb4b64-87ea-43e3-94bb-337c01a65e37
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
# Create an application
Creates a Service Fabric application.  
  
## Request  
 See [Application](application2.md) for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/$/Create?api-version={api-version}`|  
  
```  
{  
    "Name": "fabric:/WordCount",  
    "TypeName": "WordCount",  
    "TypeVersion": "1.0.0.0",  
    "ParameterList": []  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|Name|Yes|String|The name of the application.|  
|TypeName|Yes|String|The type name of the application.|  
|TypeVersion|Yes|String|The type version of the application.|  
|ParameterList|Yes|Array|The parameter list as an array of name/value pairs.|  
  
## Response  
 A successful operation will return 201 Created. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example creates an application.  
  
```  
/// <summary>  
/// Creates an application.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool CreateApplication(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/$/Create?api-version={0}",  
        "1.0"));    // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.ContentType = "text/json";  
    request.Method = "POST";  
  
    // Create the byte array that will become the request body.  
    string requestBody = "{\"Name\":\"fabric:/WordCount\"," +  
                         "\"TypeName\":\"WordCount\"," +  
                         "\"TypeVersion\":\"1.0.0.0\"," +  
                         "\"ParameterList\":[]}";  
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
        Console.WriteLine("Error creating application:");  
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
  
    Console.WriteLine("Create Application response status = " + statusCode.ToString());  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Create Application response status = Created  
*/  
  
```