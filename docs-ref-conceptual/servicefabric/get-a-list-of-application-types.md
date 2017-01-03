---
title: "Get a list of application types"
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
ms.assetid: 2ef188bf-b207-4dbc-b356-9fae3f702e05
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
# Get a list of application types
Gets a list of Service Fabric application types.  
  
## Request  
 See [Application type](application-type.md) for headers and parameters that are used by all requests related to application types.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/ApplicationTypes/{application-type-name}?api-version={api-version}`|  
  
### URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|`api-version`|Yes|The API Version, which is "1.0".|  
|`/<typeName>`|No|When using "\<URI>/ApplicationTypes/\<typeName>", gets a specific type name as a special filtered query.|  
  
### Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
[  
    {  
        "Name": "WordCount",  
        "Version": "1.0.0.0",  
        "DefaultParameterList": []  
    }  
]  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The application type name.|  
|Version|The application type version.|  
|DefaultParameterList|The default parameter list as an array of key/value pair strings.|  
  
## Examples  
 The following example displays the list of application types.  
  
```  
  
/// <summary>  
/// Class similar to ApplicationType. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class ApplicationType2  
{  
    public string Name { get; set; }  
    public string Version { get; set; }  
    public ApplicationParameterList DefaultParameterList { get; set; }  
}  
  
/// <summary>  
/// Gets the list of application types.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetListOfApplicationTypes(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/ApplicationTypes?api-version={0}",  
    "1.0"));    // api-version  
  
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
        Console.WriteLine("Error getting the list of application types:");  
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
    List<ApplicationType2> applicationTypes = jss.Deserialize<List<ApplicationType2>>(responseString);  
  
    // Display application type information for each application type.  
    Console.WriteLine("Application types:");  
    foreach (ApplicationType2 applicationType in applicationTypes)  
    {  
        Console.WriteLine("  Application Type:");  
        Console.WriteLine("    Name: " + applicationType.Name);  
        Console.WriteLine("    Version: " + applicationType.Version);  
        Console.WriteLine("    Default Parameter List:");  
  
        foreach (ApplicationParameter parameter in applicationType.DefaultParameterList)  
        {  
            Console.WriteLine("      Name: " + parameter.Name);  
            Console.WriteLine("      Value: " + parameter.Value);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Application types:  
  Application Type:  
    Name: WordCount  
    Version: 1.0.0.0  
    Default Parameter List:  
*/  
  
```