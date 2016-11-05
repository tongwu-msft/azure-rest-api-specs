---
title: "Get a list of code packages"
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
ms.assetid: b9255ba9-3443-4224-a64a-375c5fd97278
caps.latest.revision: 21
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
# Get a list of code packages
Gets a list of Service Fabric code packages.  
  
## Request  
 See [Application type](../ServiceFabricREST/application-type.md) for headers and parameters that are used by all requests related to code packages.  
  
|Method|Request URI|  
|------------|-----------------|  
|GET|`<URI>/Nodes/{node-name}/$/GetApplications/{application-name}/$/GetCodePackages?api-version={api-version}`|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
```  
[  
    {  
        "Name": "Code",  
        "Version": "1.0",  
        "ServiceManifestName": "WordCount.Service",  
        "Status": 3,  
        "RunFrequencyInterval": 0,  
        "SetupEntryPoint": {  
            "EntryPointLocation": "",  
            "ProcessId": "0",  
            "RunAsUserName": "",  
            "NextActivationTime": "0",  
            "Status": 0,  
            "CodePackageEntryPointStatistics": {  
                "LastExitCode": 0,  
                "LastActivationTime": "0",  
                "LastExitTime": "0",  
                "LastSuccessfulActivationTime": "0",  
                "LastSuccessfulExitTime": "0",  
                "ActivationFailureCount": 0,  
                "ContinuousActivationFailureCount": 0,  
                "ExitFailureCount": 0,  
                "ContinuousExitFailureCount": 0,  
                "ActivationCount": 0,  
                "ExitCount": 0  
            },  
            "InstanceId": "0"  
        },  
        "MainEntryPoint": {  
            "EntryPointLocation": "C:\\\\SfDevCluster\\\\Data\\\\Node.1\\\\Fabric\\\\work\\\\Applications\\\\WordCount_App0\\\\WordCount.Service.Code.1.0\\\\WordCount.Service.exe",  
            "ProcessId": "10292",  
            "RunAsUserName": "NetworkSvc",  
            "NextActivationTime": "0",  
            "Status": 3,  
            "CodePackageEntryPointStatistics": {  
                "LastExitCode": 0,  
                "LastActivationTime": "0",  
                "LastExitTime": "130741852879774112",  
                "LastSuccessfulActivationTime": "130741852879774112",  
                "LastSuccessfulExitTime": "0",  
                "ActivationFailureCount": 0,  
                "ContinuousActivationFailureCount": 0,  
                "ExitFailureCount": 0,  
                "ContinuousExitFailureCount": 0,  
                "ActivationCount": 1,  
                "ExitCount": 0  
            },  
            "InstanceId": "130741852872967407"  
        },  
        "HasSetupEntryPoint": false  
    }  
]  
  
```  
  
|Element name|Description|  
|------------------|-----------------|  
|Name|The name of the code package.|  
|Version|The version of the code package.|  
|ServiceManifestName|The service manifest name.|  
|Status|The code package deployment status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Downloading - Indicates that the package is downloading from the ImageStore. The value is 1.<br />-   Activating - Indicates that the package is activating. The value is 2.<br />-   Active - Indicates that the package is active. The value is 3.<br />-   Upgrading - Indicates that the package is upgrading. The value is 4.<br />-   Deactivating - Indicates that the package is deactivating. The value is 5.|  
|RunFrequencyInterval|The run frequency interval.|  
|SetupEntryPoint|The setup entry point.|  
|EntryPointLocation|The entry point location as a string which is a fully-qualified path to the entry point.|  
|ProcessId|The process ID.|  
|RunAsUserName|The run as user name.|  
|NextActivationTime|The next activation time as a DateTime string.|  
|Status|The code package deployment status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Downloading - Indicates that the package is downloading from the ImageStore. The value is 1.<br />-   Activating - Indicates that the package is activating. The value is 2.<br />-   Active - Indicates that the package is active. The value is 3.<br />-   Upgrading - Indicates that the package is upgrading. The value is 4.<br />-   Deactivating - Indicates that the package is deactivating. The value is 5.|  
|CodePackageEntryPointStatistics|The code package entry point statistics.|  
|LastExitCode|The last exit code.|  
|LastActivationTime|The last activation time.|  
|LastExitTime|The last exit time as a DateTime string.|  
|LastSuccessfulActivationTime|The last successful activation time as a DateTime string.|  
|LastSuccessfulExitTime|The last successful exit time as a DateTime string.|  
|ActivationFailureCount|The activation failure count.|  
|ContinuousActivationFailureCount|The continuous activation failure count.|  
|ExitFailureCount|The exit failure count.|  
|ContinuousExitFailureCount|The continuous exit failure count.|  
|ActivationCount|The activation count.|  
|ExitCount|The exit count.|  
|InstanceId|The instance ID.|  
|MainEntryPoint|The main entry point.|  
|EntryPointLocation|The entry point location as a string which is a fully-qualified path to the entry point.|  
|ProcessId|The process ID.|  
|RunAsUserName|The run as user name.|  
|NextActivationTime|The next activation time as a DateTime string.|  
|Status|The code package deployment status.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates that deployment status is not valid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Downloading - Indicates that the package is downloading from the ImageStore. The value is 1.<br />-   Activating - Indicates that the package is activating. The value is 2.<br />-   Active - Indicates that the package is active. The value is 3.<br />-   Upgrading - Indicates that the package is upgrading. The value is 4.<br />-   Deactivating - Indicates that the package is deactivating. The value is 5.|  
|CodePackageEntryPointStatistics|The code package entry point statistics.|  
|LastExitCode|The last exit code.|  
|LastActivationTime|The last activation time.|  
|LastExitTime|The last exit time as a DateTime string.|  
|LastSuccessfulActivationTime|The last successful activation time as a DateTime string.|  
|LastSuccessfulExitTime|The last successful exit time as a DateTime string.|  
|ActivationFailureCount|The activation failure count.|  
|ContinuousActivationFailureCount|The continuous activation failure count.|  
|ExitFailureCount|The exit failure count.|  
|ContinuousExitFailureCount|The continuous exit failure count.|  
|ActivationCount|The activation count.|  
|ExitCount|The exit count.|  
|InstanceId|The instance ID.|  
|HasSetupEntryPoint|Value of `true` if this code package has a setup entry point; `false` if this code package does not have a setup entry point.|  
  
### Examples  
 The following example displays the code package information for a specific node and application.  
  
```  
/// <summary>  
/// Class similar to CodePackageDescription. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class CodePackageDescription2  
{  
    public string Name;  
    public string Version;  
    public string ServiceManifestName;  
    public DeploymentStatus Status;  
    public long RunFrequencyInterval;  
    public CodePackageEntryPoint2 SetupEntryPoint;  
    public CodePackageEntryPoint2 MainEntryPoint;  
    public bool HasSetupEntryPoint;  
}  
  
/// <summary>  
/// Class similar to CodePackageEntryPoint. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class CodePackageEntryPoint2  
{  
    public string EntryPointLocation;  
    public string ProcessId;  
    public string RunAsUserName;  
    public string NextActivationTime;  
    public EntryPointStatus Status;  
    public CodePackageEntryPointStatistics2 CodePackageEntryPointStatistics;  
    public string InstanceId;  
}  
  
/// <summary>  
/// Class similar to CodePackageEntryPointStatistics. Designed for use with JavaScriptSerializer.  
/// </summary>  
public class CodePackageEntryPointStatistics2  
{  
    public long LastExitCode;  
    public string LastActivationTime;  
    public string LastExitTime;  
    public string LastSuccessfulActivationTime;  
    public string LastSuccessfulExitTime;  
    public long ActivationFailureCount;  
    public long ContinuousActivationFailureCount;  
    public long ExitFailureCount;  
    public long ContinuousExitFailureCount;  
    public long ActivationCount;  
    public long ExitCount;  
}  
  
/// <summary>  
/// Gets the list of code packages for a specific application on a specific node.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool GetListOfCodePackages(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Nodes/{0}/$/GetApplications/{1}/$/GetCodePackages?api-version={2}",  
        "Node.1",       // Name of node  
        "WordCount",    // Application Name  
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
        Console.WriteLine("Error getting the list of code packages:");  
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
  
    // Deserialze the JSON data.  
    JavaScriptSerializer jss = new JavaScriptSerializer();  
    List<CodePackageDescription2> codePackages = jss.Deserialize<List<CodePackageDescription2>>(responseString);  
  
    Console.WriteLine("List of code packages:");  
    foreach (CodePackageDescription2 codePackage in codePackages)  
    {  
        Console.WriteLine("  Code Package:");  
        Console.WriteLine("    Name: " + codePackage.Name);  
        Console.WriteLine("    Version: " + codePackage.Version);  
        Console.WriteLine("    ServiceManifestName: " + codePackage.ServiceManifestName);  
        Console.WriteLine("    Status: " + codePackage.Status);  
        Console.WriteLine("    RunFrequencyInterval: " + codePackage.RunFrequencyInterval);  
        Console.WriteLine("    HasSetupEntryPoint: " + codePackage.HasSetupEntryPoint);  
  
        Console.WriteLine("    SetupEntryPoint:");  
        Console.WriteLine("      EntryPointLocation: " + codePackage.SetupEntryPoint.EntryPointLocation);  
        Console.WriteLine("      ProcessId: " + codePackage.SetupEntryPoint.ProcessId);  
        Console.WriteLine("      RunAsUserName: " + codePackage.SetupEntryPoint.RunAsUserName);  
        Console.WriteLine("      NextActivationTime: " + codePackage.SetupEntryPoint.NextActivationTime);  
        Console.WriteLine("      Status: " + codePackage.SetupEntryPoint.Status);  
        Console.WriteLine("      InstanceId: " + codePackage.SetupEntryPoint.InstanceId);  
  
        Console.WriteLine("      CodePackageEntryPointStatistics:");  
        Console.WriteLine("        LastExitCode: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.LastExitCode);  
        Console.WriteLine("        LastActivationTime: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.LastActivationTime);  
        Console.WriteLine("        LastExitTime: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.LastExitTime);  
        Console.WriteLine("        LastSuccessfulActivationTime: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.LastSuccessfulActivationTime);  
        Console.WriteLine("        LastSuccessfulExitTime: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.LastSuccessfulExitTime);  
        Console.WriteLine("        ActivationFailureCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ActivationFailureCount);  
        Console.WriteLine("        ContinuousActivationFailureCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ContinuousActivationFailureCount);  
        Console.WriteLine("        ExitFailureCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ExitFailureCount);  
        Console.WriteLine("        ContinuousExitFailureCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ContinuousExitFailureCount);  
        Console.WriteLine("        ActivationCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ActivationCount);  
        Console.WriteLine("        ExitCount: " + codePackage.SetupEntryPoint.CodePackageEntryPointStatistics.ExitCount);  
  
        Console.WriteLine("    MainEntryPoint:");  
        Console.WriteLine("      EntryPointLocation: " + codePackage.MainEntryPoint.EntryPointLocation);  
        Console.WriteLine("      ProcessId: " + codePackage.MainEntryPoint.ProcessId);  
        Console.WriteLine("      RunAsUserName: " + codePackage.MainEntryPoint.RunAsUserName);  
        Console.WriteLine("      NextActivationTime: " + codePackage.MainEntryPoint.NextActivationTime);  
        Console.WriteLine("      Status: " + codePackage.MainEntryPoint.Status);  
        Console.WriteLine("      InstanceId: " + codePackage.MainEntryPoint.InstanceId);  
  
        Console.WriteLine("      CodePackageEntryPointStatistics:");  
        Console.WriteLine("        LastExitCode: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.LastExitCode);  
        Console.WriteLine("        LastActivationTime: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.LastActivationTime);  
        Console.WriteLine("        LastExitTime: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.LastExitTime);  
        Console.WriteLine("        LastSuccessfulActivationTime: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.LastSuccessfulActivationTime);  
        Console.WriteLine("        LastSuccessfulExitTime: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.LastSuccessfulExitTime);  
        Console.WriteLine("        ActivationFailureCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ActivationFailureCount);  
        Console.WriteLine("        ContinuousActivationFailureCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ContinuousActivationFailureCount);  
        Console.WriteLine("        ExitFailureCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ExitFailureCount);  
        Console.WriteLine("        ContinuousExitFailureCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ContinuousExitFailureCount);  
        Console.WriteLine("        ActivationCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ActivationCount);  
        Console.WriteLine("        ExitCount: " + codePackage.MainEntryPoint.CodePackageEntryPointStatistics.ExitCount);  
    }  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
List of code packages:  
  Code Package:  
    Name: Code  
    Version: 1.0  
    ServiceManifestName: WordCount.Service  
    Status: Active  
    RunFrequencyInterval: 0  
    HasSetupEntryPoint: False  
    SetupEntryPoint:  
      EntryPointLocation:  
      ProcessId: 0  
      RunAsUserName:  
      NextActivationTime: 0  
      Status: Invalid  
      InstanceId: 0  
      CodePackageEntryPointStatistics:  
        LastExitCode: 0  
        LastActivationTime: 0  
        LastExitTime: 0  
        LastSuccessfulActivationTime: 0  
        LastSuccessfulExitTime: 0  
        ActivationFailureCount: 0  
        ContinuousActivationFailureCount: 0  
        ExitFailureCount: 0  
        ContinuousExitFailureCount: 0  
        ActivationCount: 0  
        ExitCount: 0  
    MainEntryPoint:  
      EntryPointLocation: C:\SfDevCluster\Data\Node.1\Fabric\work\Applications\WordCount_App0\WordCount.Service.Code.1.0\WordCount.Service.exe  
      ProcessId: 10292  
      RunAsUserName: NetworkSvc  
      NextActivationTime: 0  
      Status: Started  
      InstanceId: 130741852872967407  
      CodePackageEntryPointStatistics:  
        LastExitCode: 0  
        LastActivationTime: 0  
        LastExitTime: 130741852879774112  
        LastSuccessfulActivationTime: 130741852879774112  
        LastSuccessfulExitTime: 0  
        ActivationFailureCount: 0  
        ContinuousActivationFailureCount: 0  
        ExitFailureCount: 0  
        ContinuousExitFailureCount: 0  
        ActivationCount: 1  
        ExitCount: 0  
*/  
  
```