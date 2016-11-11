---
title: "Get the application manifest for an application type"
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
ms.assetid: 4818fd2c-f867-43db-b128-ea6bbadb326c
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
# Get the application manifest for an application type
Get a Service Fabric application manifest for an application type.  
  
## Request  
 See [Application type](application-type.md) for headers and parameters that are used by all requests related to application types.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/ApplicationTypes/{application-type-name}/$/GetApplicationManifest?ApplicationTypeVersion={application-type-version}&api-version={api-version}`|  
  
### Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
```  
{  
    "Manifest": "<ApplicationManifest xmlns:xsd= ...  
}  
  
```  
  
### Examples  
 The following example displays the application manifest for the specific application type.  
  
```  
/// <summary>  
/// Class to contain the application manifest.  
/// </summary>  
public class ApplicationManifest  
{  
    public string Manifest { get; set; }  
}  
  
/// <summary>  
/// Gets the application manifest.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetApplicationManifestForAnApplicationType(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/ApplicationTypes/{0}/$/GetApplicationManifest?ApplicationTypeVersion={1}&api-version={2}",  
        "WordCount",    // Application type name  
        "1.0.0.0",      // Application type version  
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
        Console.WriteLine("Error getting application manifest:");  
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
    ApplicationManifest applicationManifest = jss.Deserialize<ApplicationManifest>(responseString);  
  
    // Display the application manifest.  
    Console.WriteLine("Application Manifest:");  
    Console.WriteLine(applicationManifest.Manifest);  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Application Manifest:  
<ApplicationManifest xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ApplicationTypeName="WordCount" ApplicationTypeVersion="1.0.0.0" xmlns="http://schemas.microsoft.com/2011/01/fabric">  
  <ServiceManifestImport>  
    <ServiceManifestRef ServiceManifestName="WordCount.Service" ServiceManifestVersion="1.0" />  
  </ServiceManifestImport>  
  <ServiceManifestImport>  
    <ServiceManifestRef ServiceManifestName="WordCount.WebService" ServiceManifestVersion="1.0" />  
    <Policies>  
      <RunAsPolicy EntryPointType="Setup" CodePackageRef="Code" UserRef="SetupUser" />  
    </Policies>  
  </ServiceManifestImport>  
  <DefaultServices>  
    <Service Name="WordCount.Service">  
      <StatefulService ServiceTypeName="WordCount.Service" MinReplicaSetSize="2" TargetReplicaSetSize="3">  
        <UniformInt64Partition PartitionCount="1" LowKey="1" HighKey="26" />  
      </StatefulService>  
    </Service>  
    <Service Name="WordCount.WebService">  
      <StatelessService ServiceTypeName="WordCount.WebService" InstanceCount="1">  
        <SingletonPartition />  
      </StatelessService>  
    </Service>  
  </DefaultServices>  
  <Principals>  
    <Users>  
      <User AccountType="NetworkService" Name="NetworkSvc" />  
      <User AccountType="LocalSystem" Name="SetupUser" />  
    </Users>  
  </Principals>  
  <Policies>  
    <DefaultRunAsPolicy UserRef="NetworkSvc" />  
  </Policies>  
</ApplicationManifest>  
*/  
  
```