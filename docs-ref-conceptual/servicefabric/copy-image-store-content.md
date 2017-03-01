---
title: "Copy image store content"
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
ms.assetid: 
caps.latest.revision: 4
author: "rwike77"
ms.author: "ryanwi"
manager: "timlt"
---
# Copy image store content
Copies the image store content from the source image store relative path to destination image store relative path.  
  
## Request  
 See [Image Store](image-store.md) for headers and parameters that are used by all requests related the image store.  
  
|Method|Request URI|  
|------------|-----------------|  
|POST|`<URI>/ImageStore/$/Copy?api-version=1.0`|  
 
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "1.0”.|  
|remote-location|Yes|Relative path in the image store.|  
  
```
{ 
    " RemoteSource": "<value>", 
    " RemoteDestination": "<value>", 
    " SkipFiles": [], 
    "CheckMarkFile": false|true, 
}
```

|Element name|Required|Type|Description|
|-------------------|-------------------|-------------------|-------------------|
|RemoteSource|Yes|String|The source image store relative path|
|RemoteDestination|Yes|String|The destination image store relative path.|
|SkipFiles|No|Array|The list of file to skip copying|
|CheckMarkFile|No|Boolean|The value is **true** to check the mark file during the copying; **false** to not check the mark file during the copying|

## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
The following example copy image store content between the specified image store paths.  
  
```  
public static bool CopyImageStoreContent(Uri clusterUri, string remoteSource, string remoteDestination)        
{
    // Stores the response status code.
    HttpStatusCode statusCode;

    // Create the request and add URL parameters.
    Uri requestUri = new Uri(clusterUri, "/ImageStore/$/Copy?api-version=1.0");
       
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);
    request.ContentType = "text/json";
    request.Method = "POST";

    string requestBody = "{\"RemoteSource\":\"CalcAppV1\\CalcService\\Data\"," +
                         "\"RemoteDestination\":\"CalcAppV3\\CalcService\\Data\"," +
                         "\"SkipFiles\":[]," +
                         "\"CheckMarkFile\":true}";

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

    return true;
}

  
```