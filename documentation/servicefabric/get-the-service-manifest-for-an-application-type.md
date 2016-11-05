---
title: "Get the service manifest for an application type"
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
ms.assetid: 26152596-6349-4606-bef1-036289e7708f
caps.latest.revision: 20
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
# Get the service manifest for an application type
Get a Service Fabric service manifest for an application type.  
  
## Request  
 See [Application type](../ServiceFabricREST/application-type.md) for headers and parameters that are used by all requests related to application types.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/ApplicationTypes/{application-type-name}/$/GetServiceManifest?ApplicationTypeVersion={application-type-version}&ServiceManifestName={service-manifest-name>&api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
{  
    "Manifest": "<ServiceManifest Name= ...  
}  
  
```  
  
## Examples  
 The following example displays the service manifest for a specific application type.  
  
```  
  
/// <summary>  
/// Class to contain the service manifest.  
/// </summary>  
public class ServiceManifest  
{  
    public string Manifest { get; set; }  
}  
  
/// <summary>  
/// Gets the service manifest.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetServiceManifestForAnApplicationType(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri,  
        string.Format("/ApplicationTypes/{0}/$/GetServiceManifest?ApplicationTypeVersion={1}&ServiceManifestName={2}&api-version={3}",  
        "WordCount",            // Application type name  
        "1.0.0.0",              // Application type version  
        "WordCount.Service",    // Service manifest name  
        "1.0"));                // api-version  
  
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
        Console.WriteLine("Error getting service manifest:");  
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
    ServiceManifest serviceManifest = jss.Deserialize<ServiceManifest>(responseString);  
  
    // Display the service manifest.  
    Console.WriteLine("Service Manifest:");  
    Console.WriteLine(serviceManifest.Manifest);  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Service Manifest:  
<ServiceManifest Name="WordCount.Service" Version="1.0" xmlns="http://schemas.microsoft.com/2011/01/fabric" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">  
  <ServiceTypes>  
    <StatefulServiceType ServiceTypeName="WordCount.Service" HasPersistedState="true" />  
  </ServiceTypes>  
  <CodePackage Name="Code" Version="1.0">  
    <EntryPoint>  
      <ExeHost>  
        <Program>WordCount.Service.exe</Program>  
      </ExeHost>  
    </EntryPoint>  
  </CodePackage>  
  <Resources>  
    <Endpoints>  
      <Endpoint Name="ServiceEndpoint" Type="Input" Protocol="http" />  
      <Endpoint Name="ReplicatorEndpoint" />  
    </Endpoints>  
  </Resources>  
</ServiceManifest>  
*/  
  
```