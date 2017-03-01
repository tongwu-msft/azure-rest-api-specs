---
title: "Update an application upgrade"
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
ms.assetid: 1ee750f9-f372-43c1-be94-bc1e65d7565e
caps.latest.revision: 4
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
# Update an application upgrade
Modifies various parameters of an upgrade at any time while the upgrade is still pending.  
  
## Request  
 See Application for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/UpdateUpgrade?api-version={api-version}`|  
  
```  
{  
    "Name": "fabric:/WordCount",  
    "UpgradeKind": 1,  
    "UpdateDescription": { },  
    "ApplicationHealthPolicy": { }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|Name|Yes|String|The application name.|  
|UpgradeKind|Yes|Number|Reserved for future use to describe different upgrade types. Must be 1 (RollingUpgrade).|  
|UpdateDescription|No|Object|Contains upgrade parameters that can be updated independently.|  
|ApplicationHealthPolicy|No|Object|See ApplicationHealthPolicy. Elements not updated independently. The new health policy replaces the old health policy in its entirety.|  
  
## UpdateDescription  
 See Upgrade for a description of the elements. Each element is optional and can be updated independently.  
  
```  
{  
	 “RollingUpgradeMode": <value>,  
 “ForceRestart":false|true,  
        "FailureAction": <value>,  
 "UpgradeReplicaSetCheckTimeoutInSeconds": <value>,  
        "HealthCheckWaitDurationInMilliseconds": "<value>",  
        "HealthCheckStableDurationInMilliseconds": "<value>",  
        "HealthCheckRetryTimeoutInMilliseconds": "<value>",  
        "UpgradeTimeoutInMilliseconds": "<value>",  
        "UpgradeDomainTimeoutInMilliseconds": "<value>"  
}  
  
```  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example updates an application upgrade to set the UpgradeReplicaSetCheckTimeoutInSeconds to 0 while leaving all other upgrade parameters unchanged.  
  
```  
/// <summary>  
/// Updates an application upgrade.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool UpgradeApplicationUpgrade(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/{0}/$/UpdateUpgrade?api-version={1}",  
        "WordCount",     // Application Name  
        "1.0"));                // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.ContentType = "text/json";  
    request.Method = "POST";  
  
    string requestBody = "{\"Name\":\"fabric:/WordCount\"," +  
                         "\"UpgradeKind\":1," +  
                         "\"UpdateDescription:{\” +  
                         "\"UpgradeReplicaSetCheckTimeoutInSeconds\":0}}";  
  
    // Create the byte array that will become the request body.  
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
  
    Console.WriteLine("Response status = " + statusCode.ToString());  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Response status = OK  
*/  
  
```