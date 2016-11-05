---
title: "Get a list of deployed applications on a node"
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
ms.assetid: f872abda-afe7-4b4b-a2f7-41167bfeb204
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
# Get a list of deployed applications on a node
Get the deployed applications running on a Service Fabric cluster node.  
  
## Request  
 See [Deployed application](../ServiceFabricREST/deployed-application.md) for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Nodes/{node-name}/$/GetApplications?api-version={api-version}`|  
|GET|`<URI>/Nodes/{node-name}/$/GetApplications/{application-id}?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see Status and Error Codes.  
  
```  
[  
    {  
        "Id": "WordCount",  
        "Name": "fabric:\\/WordCount",  
        "TypeName": "WordCount",  
        "Status": 3,  
        "WorkDirectory": "C:\\\\SfDevCluster\\\\Data\\\\Node.1\\\\Fabric\\\\work\\\\Applications\\\\WordCount_App0\\\\work",  
        "LogDirectory": "C:\\\\SfDevCluster\\\\Data\\\\Node.1\\\\Fabric\\\\work\\\\Applications\\\\WordCount_App0\\\\log",  
        "TempDirectory": "C:\\\\SfDevCluster\\\\Data\\\\Node.1\\\\Fabric\\\\work\\\\Applications\\\\WordCount_App0\\\\temp"  
    }  
]  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Id|The ID of the application.|  
|Name|The name of the application.|  
|TypeName|The type name of the application.|  
|Status|The application status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Downloading - Indicates that the package is downloading from the ImageStore. The value is 1.<br />-   Activating - Indicates that the package is activating. The value is 2.<br />-   Active - Indicates that the package is active. The value is 3.<br />-   Upgrading - Indicates that the package is upgrading. The value is 4.<br />-   Deactivating - Indicates that the package is deactivating. The value is 5.|  
|WorkDirectory|The application’s work directory on this node|  
|LogDirectory|The application’s log directory on this node|  
|TempDirectory|The application’s temp directory on this node.|  
  
### Example  
 The following example displays the list of applications on a node.  
  
```c#  
  
/// <summary>  
/// Class similar to DeployedApplication. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class DeployedApplication2  
{  
    public string Id;  
    public string Name;  
    public string TypeName;  
    public DeploymentStatus Status;  
    public string WorkDirectory;  
    public string LogDirectory;  
    public string TempDirectory;  
}  
  
/// <summary>  
/// Gets the list of applications on a node.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetApplicationsOnANode(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Nodes/{0}/$/GetApplications?api-version={1}",  
        "Node.1",   // Name of node  
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
        Console.WriteLine("Error getting the list of applications:");  
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
  
    // Create the list from the JSON data.  
    JavaScriptSerializer jss = new JavaScriptSerializer();  
    List<DeployedApplication2> applications = jss.Deserialize<List<DeployedApplication2>>(responseString);  
  
    // Display the list of applications.  
    Console.WriteLine("List of applications on a node:");  
    foreach (DeployedApplication2 application in applications)  
    {  
        Console.WriteLine("  Application:");  
        Console.WriteLine("    Id: " + application.Id);  
        Console.WriteLine("    Name: " + application.Name);  
        Console.WriteLine("    TypeName: " + application.TypeName);  
        Console.WriteLine("    Status: " + application.Status);  
        Console.WriteLine("    WorkDirectory: " + application.WorkDirectory);  
        Console.WriteLine("    LogDirectory: " + application.LogDirectory);  
        Console.WriteLine("    TempDirectory: " + application.TempDirectory);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of applications on a node:  
  Application:  
    Id: WordCount  
    Name: fabric:/WordCount  
    TypeName: WordCount  
    Status: Active  
    WorkDirectory: C:\SfDevCluster\Data\Node.1\Fabric\work\Applications\WordCount_App0\work  
    LogDirectory: C:\SfDevCluster\Data\Node.1\Fabric\work\Applications\WordCount_App0\log  
    TempDirectory: C:\SfDevCluster\Data\Node.1\Fabric\work\Applications\WordCount_App0\temp  
*/  
```