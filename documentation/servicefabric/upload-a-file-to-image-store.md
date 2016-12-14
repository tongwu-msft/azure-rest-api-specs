---
title: "Upload a file to image store"
ms.custom: ""
ms.date: "2016-12-14"
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
# Delete native image store content
Upload file to Azure Service Fabric image store  
  
## Request  
 See [Image Store](image-store.md) for headers and parameters that are used by all requests related the image store.  
  
|Method|Request URI|  
|------------|-----------------|  
|PUT|`<URI>/ImageStore/{remote-location}?api-version={api-version}`|  
  
## URI Parameters  
  
|URI Parameter|Required|Description|  
|-------------------|--------------|-----------------|  
|api-version|Yes|The API Version, which is "1.0”.|  
|remote-location|Yes|Relative path in the image store.|  
  
## Response  
 A successful operation will return 200 OK. For information on error codes, see [Status and Error Codes](status-and-error-codes1.md).  
  
## Examples  
 The following example uploads an application package.  
  
```  
public static bool UploadApplicationPackage(Uri clusterUri, string packageFullPath)
{ 
    DirectoryInfo source = new DirectoryInfo(packageFullPath);
    int separatorIndex = source.FullName.LastIndexOf(source.Name);
    string prefix = packageFullPath.Substring(0, separatorIndex - 1);
    string imageStoreContentUrlFormat = string.Format("{}/ImageStore/{0}?api-version=1.0", clusterUri);
    var filesToUpload = new Dictionary<FileInfo, string> ();
    ProcessDirectory(new DirectoryInfo(packageFullPath), prefix, filesToUpload);

    bool isSucceed = true;
    foreach (KeyValuePair<FileInfo, string> pair in FilesToUpload)
    {
        isSucceed = UploadFile(imageStoreContentUrlFormat, pair.Key, pair.Value).Result;
        if (! isSucceed)
        {
            break;
        }
    }

    return isSucceed;
}

private static void ProcessDirectory(DirectoryInfo sourceDirectory, string prefixDirectory, Dictionary<FileInfo, string> filesToUpload)
{
    DirectoryInfo[] subFolders = sourceDirectory.GetDirectories();
    foreach (var subFolder in subFolders)
    {
        ProcessDirectory(subFolder, prefixDirectory, filesToUpload);
    }

    FileInfo[] files = sourceDirectory.GetFiles();
    foreach (var file in files)
    {
        FilesToUpload.Add(file, file.FullName.Substring(prefixDirectory.Length + 1));
    }

    //Adding an extra mark file (_.dir) per folder is required for the following provision
    string markFileName = Path.Combine(sourceDirectory.FullName, "_.dir");
    File.Create(markFileName). Dispose ();
    FileInfo markFile = new FileInfo(markFileName);
    FilesToUpload.Add(markFile, markFile.FullName.Substring(prefixDirectory.Length + 1));
}

private static async Task<bool> UploadFile(string imageStoreContentUrlFormat, FileInfo localFile, string remotePath)
{
    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(new Uri (analyzer.Input.ClusterUrl, string.Format(ImageStoreContentUrlFormat, remotePath)));
    request.Method = "PUT";
    request.KeepAlive = true;

    request.ContentLength = localFile.Length;
    Console.WriteLine("Uploading the file: {0} to {1}", localFile.FullName, request.RequestUri);
    using (FileStream sourceStream = new FileStream(localFile.FullName, FileMode.Open, FileAccess.Read, FileShare.None))
    {
        byte [] data = new byte [localFile.Length];
        sourceStream.Read(data, 0, data.Length);
        Stream targetStream = request.GetRequestStream();
        targetStream.Write(data, 0, data.Length);
        targetStream.Close();

        try
        {
            using (HttpWebResponse webResponse = (HttpWebResponse)await request.GetResponseAsync())
            {
                int statusCode = (int)webResponse.StatusCode;
                if (statusCode >= 100 && statusCode < 400)
                {
                    Console.WriteLine("Succeeded in uploadind, StatusCode: {0}", webResponse.StatusCode.ToString());
                    return true;
                }
                else if (statusCode >= 400 && statusCode <= 499)
                {
                    Console.WriteLine(string.Format("Client Error: {0}", statusCode));
                    return false;
                }
                else if (statusCode >= 500 && statusCode <= 599)
                {
                    Console.WriteLine(string.Format("Server Error: {0}", statusCode));
                    return false;
                }
            }
        }
        Catch (WebException ex)
        {
            Console.WriteLine("Unhandled status: {0}", ex.Status);
            Console.WriteLine("Error uploading: {0}", ex.Message);
            return false;
        }
    }

    return true;
}
  
```