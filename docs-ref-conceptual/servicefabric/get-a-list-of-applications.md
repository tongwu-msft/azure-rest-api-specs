---
title: "Get a list of applications"
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
ms.assetid: 092897cc-04a0-48f1-abd4-7d3626f75e8c
caps.latest.revision: 19
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
# Get a list of applications
Lists Service Fabric applications.  
  
## Request  
 See [Application](application2.md) for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|The following URI can be used to get the applications:<br /><br /> `<URI>/Applications/{application-name}?api-version={api-version}`|  
|GET|The following URI can be used to get an application:<br /><br /> `<URI>/Applications?api-version={api-version}`|  
|GET|The following URI can be used to get the applications with continuation token:<br /><br /> `<URI>/Applications?api-version={api-version}&ContinuationToken={continuation-token}`|  
  
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "2.0”.|  
|ContinuationToken|No|String that represents a continuation token. Returned from a previous get service list call when the results do not fit one message. Can be used to get next page of results.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{“Items”:[  
    {  
        "Id": "WordCount",  
        "Name": "fabric:\\/WordCount",  
        "TypeName": "WordCount",  
        "TypeVersion": "1.0.0.0",  
        "Status": 1,  
        "Parameters": [],  
        "HealthState": 1  
    }  
]}  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|The application ID.|  
|Name|The application name.|  
|TypeName|The application type name.|  
|TypeVersion|The application type version.|  
|Status|The application status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the application status is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ready - Indicates the application status is ready. The value is 1.<br />-   Upgrading - Indicates the application status is upgrading. The value is 2.<br />-   Creating - Indicates the application status is creating. The value is 3.<br />-   Deleting - Indicates the application status is deleting. The value is 4.<br />-   Failed - Indicates the creation or deletion of application was terminated due to persistent failures. Another create/delete request can be accepted. The value is 5.|  
|Parameters|The parameters as an array of name/value pairs.|  
|HealthState|The health state.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates an invalid health state. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Ok - Indicates the health state is okay. The value is 1.<br />-   Warning - Indicates the health status is at a warning level. The value is 2.<br />-   Error - Indicated the health status is at an error level. The value is 3.<br />-   Unknown - Indicates an unknown health status. The value is 65535.|  
|ContinuationToken|String that represents a continuation token. Returned when the results do not fit one message. Can be used to get next page of results by specifying ContinuationToken with this value in next call.|  
  
## Examples  
 The following example displays the list of applications.  
  
```  
  
/// <summary>  
/// Class designed for use with JavaScriptSerializer.  
/// </summary>  
public class ApplicationInfo  
{  
    public string Id { get; set; }  
    public string Name { get; set; }  
    public string TypeName { get; set; }  
    public string TypeVersion { get; set; }  
    public ApplicationStatus Status { get; set; }  
    public List<Parameter> Parameters { get; set; }  
    public HealthState HealthState { get; set; }  
}  
  
/// <summary>  
/// Class similar to Parameter. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class Parameter  
{  
    public string Name { get; set; }  
    public string Value { get; set; }  
}  
  
/// <summary>  
/// Gets the list of applications.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetApplicationList(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications?api-version={0}",  
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
        Console.WriteLine("Error getting the application list:");  
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
    List<ApplicationInfo> applicationInfos = jss.Deserialize<List<ApplicationInfo>>(responseString);  
  
    // Display some application information for each application.  
    Console.WriteLine("Application List:");  
    foreach (ApplicationInfo applicationInfo in applicationInfos)  
    {  
        Console.WriteLine("  Application:");  
        Console.WriteLine("    Id: " + applicationInfo.Id);  
        Console.WriteLine("    Name: " + applicationInfo.Name);  
        Console.WriteLine("    TypeName: " + applicationInfo.TypeName);  
        Console.WriteLine("    TypeVersion: " + applicationInfo.TypeVersion);  
        Console.WriteLine("    Status: " + applicationInfo.Status);  
        Console.WriteLine("    HealthState: " + applicationInfo.HealthState);  
  
        Console.WriteLine("    Parameters:");  
  
        foreach (Parameter parameter in applicationInfo.Parameters)  
        {  
            Console.WriteLine("      Parameter:");  
            Console.WriteLine("        Name: " + parameter.Name);  
            Console.WriteLine("        Value: " + parameter.Value);  
        }  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Application List:  
  Application:  
    Id: WordCount  
    Name: fabric:/WordCount  
    TypeName: WordCount  
    TypeVersion: 1.0.0.0  
    Status: Ready  
    HealthState: Ok  
    Parameters:  
*/  
  
```