---
title: "Update a cluster upgrade"
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
ms.assetid: 53e210cf-ff3e-43eb-938c-09fe3064f0a2
caps.latest.revision: 5
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
# Update a cluster upgrade
Modifies various parameters of an upgrade at any time while the upgrade is still pending.  
  
## Request  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/$/UpdateUpgrade?api-version={api-version}`|  
  
```  
{  
    "UpgradeKind": 1,  
    "EnableDeltaHealthEvaluation": false|true,  
    "UpdateDescription": { },  
    "ClusterUpgradeHealthPolicy": { },  
    “ApplicationHealthPolicyMap”: { }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|UpgradeKind|Yes|Number|Reserved for future use to describe different upgrade types. Must be 1 (RollingUpgrade).|  
|UpdateDescription|No|Object|Contains upgrade parameters that can be updated independently.|  
|ClusterHealthPolicy|No|Object|See ClusterHealthPolicy. Elements within the ClusterHealthPolicy object are not updated independently. The new health policy replaces the old health policy in its entirety.|  
|EnableDeltaHealthEvaluations|No|Boolean|When true, enables delta health evaluation rather than absolute health evaluation after completion of each upgrade domain.|  
  
### UpdateDescription  
 See Cluster Upgrade for a description of each element. Each element is optional and can be updated independently.  
  
```  
{  
	 “RollingUpgradeMode": <value>,  
 “ForceRestart": false|true,  
        "FailureAction": <value>,  
 "UpgradeReplicaSetCheckTimeoutInSeconds": <value>,  
        "HealthCheckWaitDurationInMilliseconds": "<value>",  
        "HealthCheckStableDurationInMilliseconds": "<value>",  
        "HealthCheckRetryTimeoutInMilliseconds": "<value>",  
        "UpgradeTimeoutInMilliseconds": "<value>",  
        "UpgradeDomainTimeoutInMilliseconds": "<value>"  
}  
  
```  
  
### ClusterHealthPolicy  
  
```  
{  
        "ConsiderWarningAsError": false|true,  
        "MaxPercentUnhealthyNodes": <value>,  
        "MaxPercentUnhealthyApplications": <value>  
        "ApplicationTypeHealthPolicyMap": [{"Key":"<value>","Value":<value>}]  
}  
  
```  
  
|Element Name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|ConsiderWarningAsError|No|Boolean|1.0|Value of true to treat warnings as errors; false to not treat warnings as errors.|  
|MaxPercentUnhealthyNodes|No|Number|1.0|The maximum allowed percentage of unhealthy nodes before reporting an error. For example, to allow 10% of nodes to be unhealthy, this value would be 10.|  
|MaxPercentUnhealthyApplications|No|Number|1.0|The maximum allowed percentage of unhealthy applications before reporting an error. For example, to allow 10% of applications to be unhealthy, this value would be 10.|  
|ApplicationTypeHealthPolicyMap|No|Object|2.0|Specifies the map that defines the maximum percentage of unhealthy applications that are allowed per application type. Application types in this map are evaluated using specific percentages rather than the global MaxPercentUnhealthyApplications percentage. <br />For example, if some applications of a type are critical, the cluster administrator can add an entry to the map for that application type and assign it a value of 0% (that is, do not tolerate any failures). All other applications can be evaluated with MaxPercentUnhealthyApplications set to 20% to tolerate some failures out of the thousands of application instances.The application type health policy map is used only if the cluster manifest enables application type health evaluation using the configuration entry for HealthManager/EnableApplicationTypeHealthEvaluation.|  
  
### ClusterUpgradeHealthPolicy  
  
```  
{  
	 “MaxPercentDeltaUnhealthyNodes": <value>,  
  “MaxPercentUpgradeDomainDeltaUnhealthyNodes":<value>  
}  
  
```  
  
|Element Name|Required|Type|Version|Description|  
|------------------|--------------|----------|-------------|-----------------|  
|MaxPercentDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of overall unhealthy nodes during upgrade when delta evaluation is enabled.|  
|MaxPercentUpgradeDomainDeltaUnhealthyNodes|No|Number|1.0|A value in the range [0, 100] that specifies the maximum allowed percentage of unhealthy nodes per upgrade domain during upgrade when delta evaluation is enabled.|  
  
### ApplicationHealthPolicyMap  
  
```  
{  
    "ApplicationHealthPolicyMap":  
    [{  
        "Key": “<value>”,  
        "Value": <value>  
    }]  
}  
  
```  
  
-   "Key” represents the Application name used to identify the application.  
  
-   "Value” represents the application health policy for specified application. The ApplicationHealthPolicy fields are:  
  
```  
{  
    "ConsiderWarningAsError": false|true,  
    "MaxPercentUnhealthyDeployedApplications":<value>,  
    "DefaultServiceTypeHealthPolicy":  
    {  
        "MaxPercentUnhealthyServices":<value>,  
        "MaxPercentUnhealthyPartitionsPerService":<value>,  
        "MaxPercentUnhealthyReplicasPerPartition":<value>  
    },  
    "ServiceTypeHealthPolicyMap":  
    [{  
        "Key":"value",  
        "Value":  
        {  
            "MaxPercentUnhealthyServices":<value>,  
            "MaxPercentUnhealthyPartitionsPerService":<value>,  
            "MaxPercentUnhealthyReplicasPerPartition":<value>  
        }  
    }]  
}  
  
```  
  
|Element Name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|ConsiderWarningAsError|Yes|Boolean|Determines whether warnings should be treated with the same severity as errors.|  
|MaxPercentUnhealthyDeployedApplications|Yes|Number|The maximum allowed percentage of unhealthy deployed applications.|  
|DefaultServiceTypeHealthPolicy|Yes|Number|The health policy used by default to evaluate the health of a service type.|  
|MaxPercentUnhealthyServices|Yes|Number|The maximum allowed percentage of unhealthy services.|  
|MaxPercentUnhealthyPartitionsPerService|Yes|Number|The maximum allowed percentage of unhealthy partitions per service.|  
|MaxPercentUnhealthyReplicasPerPartition|Yes|Number|The maximum allowed percentage of unhealthy replicas per partition.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example updates a cluster upgrade to set UpgradeReplicaSetCheckTimeoutInSeconds to 0 while leaving all other upgrade parameters unchanged.  
  
```  
/// <summary>  
/// Updates a cluster upgrade.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool UpdateClusterUpgrade(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("$/UpdateUpgrade?api-version={0}",  
        "1.0"));                // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.ContentType = "text/json";  
    request.Method = "POST";  
  
    string requestBody = "{" +  
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