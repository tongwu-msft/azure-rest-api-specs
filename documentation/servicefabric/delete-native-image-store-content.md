---
title: "Delete native image store content"
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
ms.assetid: 61646d95-c445-4684-8259-3c342853e666
caps.latest.revision: 4
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Delete native image store content
Deletes image store content from the given relative path.  
  
## Request  
 See [Application](application2.md) for headers and parameters that are used by all requests related the image store.  
  
|Method|Request URI|  
|------------|-----------------|  
|DELETE|`<URI>/NativeImageStore/{remote-location}?api-version={api-version}`|  
  
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "1.0”.|  
|remote-location|Yes|Relative path in the native image store.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example deletes an application.  
  
```  
public static bool DeleteImageStoreContent(Uri clusterUri, string remoteLocation)  
{  
    Uri requestUri = new Uri(clusterUri, string.Format("/NativeImageStore/{0}?api-version={1}", remoteLocation, "1.0"));  
  
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);  
    request.Method = "DELETE";  
    HttpStatusCode statusCode;  
  
    try  
    {  
       using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())  
       {  
          statusCode = response.StatusCode;  
       }  
    }  
    catch (WebException e)  
    {  
         Console.WriteLine("Error deleting image store content:");  
         Console.WriteLine(e.Message);  
         if (e.InnerException != null)  
         {  
            Console.WriteLine(e.InnerException.Message);  
         }  
  
         return false;  
       }  
       catch (Exception e)  
       {  
         throw (e);  
       }  
  
       Console.WriteLine("Delet image store content response status = " + statusCode.ToString());  
       return true;  
    }  
  
```