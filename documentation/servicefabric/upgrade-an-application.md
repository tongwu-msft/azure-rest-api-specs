---
title: "Upgrade an application"
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
ms.assetid: 185ded93-b8e2-4cf7-84d2-3f3ba2da01b6
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
# Upgrade an application
Upgrades Service Fabric applications by application name.  
  
## Request  
 See [Application](../ServiceFabricREST/application2.md) for headers and parameters that are used by all requests related to applications.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/Applications/{application-name}/$/Upgrade?api-version={api-version}`|  
  
```  
  
{  
    "Name": "<value>",  
    "TargetApplicationTypeVersion": "<value>",  
    "Parameters": [],  
    "UpgradeKind": <value>,  
    "RollingUpgradeMode": <value>  
    "UpgradeReplicaSetCheckTimeoutInSeconds": <value>,  
    "ForceRestart": false|true,  
    "MonitoringPolicy": { },  
    "ApplicationHealthPolicy": { }  
}  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|Name|Yes|String|The application name.|  
|TargetApplicationTypeVersion|Yes|String|The target application type version.|  
|Parameters|No|Array|The application parameter overrides as an array.|  
|UpgradeKind|Yes|Number|Reserved for future use to describe different upgrade types. Must be 1 (RollingUpgrade).|  
|RollingUpgradeMode|Yes|Number|The type of rolling upgrade when upgrading a cluster.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the rolling upgrade mode is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   UnmonitoredAuto - Specifies that the upgrade should be unmonitored automatic. The value is 1.<br />-   UnmonitoredManual - Specifies that the upgrade should be unmonitored manual. The value is 2.<br />-   Monitored - Specifies that the upgrade should be monitored automatic. The value is 3.|  
|UpgradeReplicaSetCheckTimeoutInSeconds|No|Number|The maximum amount of time the system block waiting for replica set availability before proceeding regardless.|  
|ForceRestart|No|Boolean|The value is `true` to force a restart of each service host during the upgrade process; `false` to not force a restart of the service host during the upgrade process.|  
|MonitoringPolicy|No|Object|A monitoring policy object to describe the monitoring to perform on the upgrade process.|  
|ApplicationHealthPolicy|No|Object|The application health policy to apply during upgrade.|  
  
## MonitoringPolicy  
  
```  
{  
        "FailureAction": <value>,  
        "HealthCheckWaitDurationInMilliseconds": "<value>",  
        "HealthCheckStableDurationInMilliseconds": "<value>",  
        "HealthCheckRetryTimeoutInMilliseconds": "<value>",  
        "UpgradeTimeoutInMilliseconds": "<value>",  
        "UpgradeDomainTimeoutInMilliseconds": "<value>"  
    }  
  
```  
  
|Element name|Required|Type|Description|  
|------------------|--------------|----------|-----------------|  
|FailureAction|No|Number|The actions for Service Fabric to take if the upgrade fails.<br /><br /> Possible values are:<br /><br /> -   Invalid - Indicates the failure action is invalid. All Service Fabric enumerations have the invalid type. The value is zero.<br />-   Rollback - Indicates that a rollback of the upgrade will be performed by Service Fabric if the upgrade fails. The value is 1.<br />-   Manual - Indicates that a manual repair will need to be performed by the administrator if the upgrade fails. Service Fabric will not proceed to the next upgrade domain automatically. The value is 2.|  
|HealthCheckWaitDurationInMilliseconds|No|String|A health check wait duration as measured in milliseconds.|  
|HealthCheckStableDurationInMilliseconds|No|String|A health check stable duration as measured in milliseconds.|  
|HealthCheckRetryTimeoutInMilliseconds|No|String|A health check retry timeout as measured in milliseconds.|  
|UpgradeTimeoutInMilliseconds|No|String|An upgrade timeout as measured in milliseconds.|  
|UpgradeDomainTimeoutInMilliseconds|No|String|An upgrade domain timeout in milliseconds|  
  
## ApplicationHealthPolicy  
 See ApplicationHealthPolicy for a description of the elements.  
  
```  
{  
    "ConsiderWarningAsError": false|true,  
    "MaxPercentUnhealthyDeployedApplications": <value>,  
    "DefaultServiceTypeHealthPolicy": {  
        "MaxPercentUnhealthyServices": <value>,  
        "MaxPercentUnhealthyPartitionsPerService": <value>,  
        "MaxPercentUnhealthyReplicasPerPartition": <value>  
}  
  
```  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](../ServiceFabricREST/status-and-error-codes1.md).  
  
## Examples  
 The following example upgrades an application.  
  
```  
/// <summary>  
/// Upgrades an application by application type.  
/// </summary>  
/// <param name="clusterUri">The URI to access the cluster.</param>  
/// <returns>Returns true if successful; otherwise false.</returns>  
public static bool UpgradeApplicationByApplicationType(Uri clusterUri)  
{  
    // String to capture the response stream.  
    string responseString = string.Empty;  
    // Stores the response status code.  
    HttpStatusCode statusCode;  
  
    // Create the request and add URL parameters.  
    Uri requestUri = new Uri(clusterUri, string.Format("/Applications/{0}/$/Upgrade?api-version={1}",  
        "WordCount",     // Application Name  
        "1.0"));                // api-version  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.ContentType = "text/json";  
    request.Method = "GET";  
  
    string requestBody = "{\"Name\":\"fabric:/WordCount\"," +  
                         "\"TargetApplicationTypeVersion\":\"1.1.0.0\"," +  
                         "\"Parameters\":[]," +  
                         "\"UpgradeKind\":1," +  
                         "\"RollingUpgradeMode\":1," +  
                         "\"UpgradeReplicaSetCheckTimeoutInSeconds\":5," +  
                         "\"ForceRestart\":true," +  
                         "\"MonitoringPolicy\":" +  
                         "{\"FailureAction\":1," +  
                         "\"HealthCheckWaitDurationInMilliseconds\":\"5000\"," +  
                         "\"HealthCheckStableDurationInMilliseconds\":\"10000\"," +  
                         "\"HealthCheckRetryTimeoutInMilliseconds\":\"20000\"," +  
                         "\"UpgradeTimeoutInMilliseconds\":\"60000\"," +  
                         "\"UpgradeDomainTimeoutInMilliseconds\":\"30000\"}}";  
  
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
        Console.WriteLine("Error upgrading application:");  
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
  
    Console.WriteLine("Update Application response status = " + statusCode.ToString());  
  
    return true;  
}  
  
/* This code produces output similar to the following:  
  
Upgrade Application response status = OK  
*/  
  
```